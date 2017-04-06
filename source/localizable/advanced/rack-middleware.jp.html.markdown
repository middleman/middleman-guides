---
title: Rack ミドルウェア
---

# Rack ミドルウェア

Rack はオンザフライで内容を変更し, サーバ (Middleman) で処理される前に
リクエストを傍受できる仕組みです。

Middleman には Middleman と連携する広大な宇宙を開くライブラリである
Rack ミドルウェアへアクセスする仕組みがあります。

## 例: 構文ハイライト

**Note:** 構文ハイライトには, 公式の [middleman-syntax] 拡張の使用を
おすすめします。これは Rack ミドルウェアを使う 1 例に過ぎません。

このサイトは Middleman で書かれており, 構文ハイライトされたたくさんの
code ブロックからできています。構文ハイライトは Middleman の外で行われます。
このサイトは `<code>` ブロックをレンダリングし, Rack ミドルウェアはこれらの
ブロックを引き継ぎ構文ハイライトを追加します。呼び出されるミドルウェアは
[`Rack::Codehighlighter`] です。`config.rb` での使用方法を示します:

```ruby
require "rack/codehighlighter"
require "pygments"
use Rack::Codehighlighter,
  :pygments,
  :element => "pre>code",
  :pattern => /\A:::([-_+\w]+)\s*\n/,
  :markdown => true
```

この処理を行うために `Gemfile` に正しい依存関係を追加してください:

```ruby
gem "rack-codehighlighter", :git => "git://github.com/wbzyl/rack-codehighlighter.git"
gem "pygments.rb"
```

上記のブロックには `rack/codehighlighter` と `pygments.rb` ライブラリが
必要です。 `use` コマンドは Middleman にこのミドルウェアを使うよう命令します。
残りの部分は標準的な Rack ミドルウェアのセットアップで,
構文ハイライトを作るミドルウェアに対し構文解析の処理方法や code ブロックの
配置方法を変数で渡しています。

### ビルドサイクル

Rack ミドルウェアは, ビルドサイクルの間に行われたリクエストを含めたすべての
リクエストに対し実行されます。つまりプレビュー中に表れる Rack ミドルウェアの
効果は, ビルドしたファイルにも現れるます。ただし, プロジェクトがビルドされると
静的なサイトになることに注意してください。サイトがビルドされると,
Cookie, セッションや変数を期待したリクエストを処理する Rack ミドルウェアは
動作しなくなります。

## 便利なミドルウェア

* [Rack::GoogleAnalytics]
* [Rack::Tidy]
* [Rack::Validate]
* [Rack::SpellCheck]

  [middleman-syntax]: https://github.com/middleman/middleman-syntax
  [`Rack::Codehighlighter`]: https://github.com/wbzyl/rack-codehighlighter
  [Rack::GoogleAnalytics]: https://github.com/ambethia/rack-google_analytics
  [Rack::Tidy]: https://github.com/rbialek/rack-tidy
  [Rack::Validate]: https://gist.github.com/235715
  [Rack::SpellCheck]: https://gist.github.com/235097
