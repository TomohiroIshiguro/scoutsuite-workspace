# ローカルに ScoutSuite 実行環境を構築する

## ScoutSuite とは

```
Scout Suite is an open source multi-cloud security-auditing tool, which enables security posture assessment of cloud environments. Using the APIs exposed by cloud providers, Scout Suite gathers configuration data for manual inspection and highlights risk areas. Rather than going through dozens of pages on the web consoles, Scout Suite presents a clear view of the attack surface automatically.

Scout Suite was designed by security consultants/auditors. It is meant to provide a point-in-time security-oriented view of the cloud account it was run in. Once the data has been gathered, all usage may be performed offline.
```
Ref: https://github.com/nccgroup/ScoutSuite

## リポジトリのファイル構成

Makefile: リポジトリをクローン後のコマンド。  
config: クラウドサービスへ接続情報の設定ファイル。コンテナ内にコピーして使う。

## 作業手順

1. 当リポジトリをクローンする
2. クラウドサービスに構成の参照権限をもつユーザーを作り、接続情報を発行する
3. config/ に接続情報を追加する
4. ScouteSuite を実行する (コンテナを起動して、クラウドサービスの構成を監査する)
5. output/ に監査結果が出力されるので、html ファイルを web ブラウザで開く

## 備考

Makefile のコマンドで実行した場合、コンテナは終了したら破棄するオプションをつけて起動しています。
