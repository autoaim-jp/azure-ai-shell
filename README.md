# azure ai shell

## 使い方

### セットアップ
.env.sampleを参考に.envファイルを作成。  
Azure AI Foundry > 共有リソース > デプロイ  
にターゲットURLとキーがある。  


### 文章生成

```
./chat_gpt_4o.sh
# または
./chat_gpt_4o.sh "スイカって紫色だよね。"
```

### 画像生成
プロンプトを渡さなくても試せる。  

```
./image_dall_e_3.sh
# または
./image_dall_e_3.sh "purple watermelon"
```

## 作成方法

ChatGPTに聞いて作った。  
はじめの質問は、AZURE_CLIENT_ID、AZURE_TENANT_ID、AZURE_CLIENT_SECRETを使うとどこかで見たから質問。  
でもazure aiのページにキー1、キー2とエンドポイントがあったから、これ使ってできるかなと質問。  
試しに動かしてみて動作を確認できた。  
このスクリプトに手で微修正した。  
具体的には、レスポンスを各ディレクトリに保存、環境変数をファイル分離、引数を渡せるようにした。  

https://chatgpt.com/share/675e5c71-1834-8008-8c2d-e6675983ac2d  


