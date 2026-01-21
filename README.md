# OIT-Typst卒論テンプレート 
これは大阪工業大学の卒論、修論テンプレートです。

- `/sotsuron` → 卒論のテンプレート
- `/syuron`　→ 修論のテンプレート

# install
このテンプレートを使うには以下のものをインストールしてください。
- vscode
- このテンプレート
- [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)(vscodeの拡張機能)
- Noto Sans JP フォント
- Noto Serif JP フォント

# 注意点
### 2026/01/21追記、数式を書く場合は以下のように参照時に`eqt:`をつけてください。
```typst
$
E = mc^2
$<einstein>

式@eqt:einstein では〜
```
こうすることで(3.1)のように、式番号が章に対応したユニークな番号になります。
詳しくはhttps://typst.app/universe/package/i-figured/ を参照ください。
