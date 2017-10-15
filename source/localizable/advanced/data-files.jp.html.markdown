---
title: データファイル
---

# データファイル

ページのコンテンツデータをレンダリングから抜き出すと便利な場合があります。
この方法では, あるチームメンバーがコンテンツのデータベースの作成に集中でき,
その作業の間に他のチームメンバーはサイト構造を組むことができます。
データファイルは `data` フォルダの中に `.yml` や `.json` として作ることができ,
テンプレートの中でこの情報を使うことができます。
`data` フォルダは, `source` フォルダと同じように,
プロジェクトのルートに置かれます。

<iframe width="560" height="315" src="https://www.youtube.com/embed/5YHwLKxSB2I?rel=0" frameborder="0" allowfullscreen></iframe><br>

データが用意された `data/people.yml` を例として示します:

```yaml
friends:
  - Tom
  - Dick
  - Harry
```

テンプレートファイルの中ならどこからでも, このデータにアクセスできます:

```erb
<h1>友だち一覧</h1>
<ol>
  <% data.people.friends.each do |f| %>
  <li><%= f %></li>
  <% end %>
</ol>
```

次のようにレンダリングされます:

```html
<h1>友だち一覧</h1>
<ol>
  <li>Tom</li>
  <li>Dick</li>
  <li>Harry</li>
</ol>
```

`.yml` (people) のファイル名はテンプレートの中では, `data.people` のように,
データが保存されたオブジェクトの名前になるので注意してください。
サブディレクトリでも同じように機能します。ファイルが `data/people/tom.yml` にある場合,
`data.people.tom` でアクセスできます。

データを保存のために YAML の代わりに JSON を使うこともできます。
上記の例では `data/people.json` を使うことができます:

```json
{
  "friends": [
    "Tom",
    "Dick",
    "Harry"
  ]
}
```
