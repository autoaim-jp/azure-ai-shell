#!/bin/bash

source .env

export DEPLOYMENT_NAME="gpt-4o"

PROMPT=${1:-"「夏」「二人の秘密の基地の中」といえばなんの歌ですか。"}

CURRENT_TIME=$(date '+%Y%m%d_%H%M%S')
RESPONSE_DIR_PATH="./chat/"
RESPONSE_FILE_PATH="${RESPONSE_DIR_PATH}${CURRENT_TIME}.json"
mkdir -p $RESPONSE_DIR_PATH

curl -X POST \
  "$ENDPOINT/openai/deployments/$DEPLOYMENT_NAME/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $API_KEY" \
  -d '{
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": "'${PROMPT}'"}
        ],
        "max_tokens": 8192
      }' | jq '. + { "prompt": "'${PROMPT}'" }' > $RESPONSE_FILE_PATH

cat $RESPONSE_FILE_PATH | jq '.prompt'
cat $RESPONSE_FILE_PATH | jq '.choices[0].message.content'

echo "see: $RESPONSE_FILE_PATH"
