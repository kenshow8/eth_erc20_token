# eth_erc20_token
ERC20準拠のETH独自トークンを作成する事ができるプログラムです。  
このプログラムでは、ganacheを利用してローカルネットワーク内にオリジナルトークンを発行します。  

## ブログ記事
https://blog.kenshow8.com/ethereum/ethereum-erc20-token-deploy-local/

## 環境
macOS Catalina : 10.15.4
node : v14.2.0

## 使い方

### githubリポジトリのクローン
```
git clone https://github.com/kenshow8/eth_erc20_token.git
```

### truffleのインストール
```
npm install -g truffle
```

### ganacheをインストールして起動

https://www.trufflesuite.com/ganache


### コンパイル
```
truffle compile
```

### デプロイ
```
truffle migrate
```

