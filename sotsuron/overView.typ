#import "overViewTemplate.typ": rsjconf
#show: doc => rsjconf(
  title: "概要タイトル", authors: (
	(name: "卒論 太郎"),
	(name: "小林 裕之", supervisor: true),
  ),
  studentNumber: "920-017",
  doc
)

= Typstのセットアップ
+ このテンプレートをお好みのディレクトリに配置
+ vscodeでmain.typを含むrootで開く
+ `Tinymist Typst`の拡張機能をインストール
+ このテンプレートの`main.typ`を開いた状態で、以下の@buildIcon で示すアイコンをクリックでpdfにビルドできます。
// ↑本来のtypstの参照では@buildIconでいいですが、外部のライブラリを使ってる関係でfig: or tbl: or lst:が必要です。

#figure(
  caption: "ビルドアイコン",
  image("./img/typstBuild.png")
)<buildIcon>

= 注意点
参考文献を書くときは直接書かずに`.reference.bib`にBibTex形式で書きましょう。 @bibtex_export

= Tips
ここからは初めて`Typst`を触る人のためにある程度の記述例を示します。

== 数式
ワンラインの数式は`$`で囲んでかけるよ$y = 3x + 1$。式と`$`の間に空白を入れちゃダメだよ。
論文で数式書くときは`$`を改行 or 空白込みで囲むといいよ。以下にサンプルの@math を示す

$
y=3x+1
$<math>

== 改行、改カラム
基本的にはエディタで1回改行しても
反映されないよ。(謎の空白が入るので注意)

2回改行すれば改行されるよ。

改行したいときは\ これでもいいし #linebreak() でもいいよ。

違いはご覧の通り文頭の字下げがあるかないかだよ。


#lorem(430)

= 結論
卒論で書いた内容を一枚のページに要約して頑張って書いてください！

ps. このテンプレートは小林先生が作ったRSJ2024のテンプレートを元にしています。🙏 @rsj_typst_template
K


#set text(lang: "en", 9pt)
#bibliography("reference.bib", title: block(width: 100%, align(center, text(11pt, "参考文献"))))
