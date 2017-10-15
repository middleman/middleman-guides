---
title: ビルド & デプロイ
---

# 静的サイトのエクスポート

## `middleman build` でサイトをビルド

<br><iframe width="560" height="315" src="https://www.youtube.com/embed/S8b-aKlRdOs?rel=0" frameborder="0" allowfullscreen></iframe><br>

静的サイトのコードを出力する準備ができている, または "ブログモード" で静的ブログ
をホストするような場合, サイトをビルドする必要があります。コマンドラインを使い,
プロジェクトフォルダの中から `middleman build` を実行してください:

```bash
$ cd my_project
$ bundle exec middleman build
```

このコマンドは `source` フォルダにあるファイル毎に静的ファイルを作ります。
テンプレートファイルがコンパイルされ, その静的ファイルがコピーされ, 有効化された
ビルド時の機能 (圧縮のような) が実行されます。 Middleman は
自動的に前回のビルドから残っていて
今回は生成されないファイルを削除します。

ビルド時間を短縮するために, `NO_CONTRACTS=true` を指定することができます:

```bash
$ cd my_project
$ NO_CONTRACTS=true bundle exec middleman build
```

[Contracts] は特定のメソッドに型シグネチャを追加するために使用されます。
Middleman はこの方法で gem クラスをオーバーライドし型チェックをクリアします。
型チェックは内部のみで使用されることになります。より詳しい説明は
[挙動を解説する動画で確認できます][youtube]。

## サイトをデプロイ

サイトをビルドすることで, 必要なものはすべて `build` ディレクトリに
用意されます。静的なビルドデータをデプロイする方法はほぼ無限にあります。
ここでは私たち独自のソリューションを紹介します。web 検索や
[デプロイ拡張ディレクトリ][extension directory] を探すことで `Middleman`
プロジェクトのデプロイの選択肢を探すことができます。あなたが `Middleman` プロジェクト
をデプロイするツールの作者であれば, [ここ][directory] からPR をしてください。

ビルドファイルをデプロイする便利なツールがあります。[`middleman-deploy`] です。
このツールは rsync, FTP, SFTP や Git を用いてデプロイを行うことができます。

```bash
$ middleman build [--clean]
$ middleman deploy [--build-before]
```

## プロダクション環境のアセットハッシュ & CDN 設定

プロダクション環境では一般的にアセットファイル名にハッシュ文字列を付与し CDN で
そのファイルを提供します。Middleman を使うことで簡単に対応することができます:

```ruby
configure :build do
  activate :minify_css
  activate :minify_javascript

  # アセットファイルの URL にハッシュを追加 (URL ヘルパの使用が必要)
  activate :asset_hash

  activate :asset_host, :host => '//YOURDOMAIN.cloudfront.net'
end
```

  [extension directory]: https://directory.middlemanapp.com/#/extensions/deployment
  [directory]: https://github.com/middleman/middleman-directory
  [`middleman-deploy`]: https://github.com/middleman-contrib/middleman-deploy
  [youtube]: https://www.youtube.com/watch?v=W7qj_WFClls
  [contracts]: https://github.com/egonSchiele/contracts.ruby
