= Tips
ここからは初めて`Typst`を触る人のためにある程度の記述例を示します。

== 数式
ワンラインの数式は`$`で囲んでかけるよ$y = 3x + 1$。式と`$`の間に空白を入れちゃダメだよ。
論文で数式書くときは`$`を改行 or 空白込みで囲むといいよ。以下にサンプルの@math を示す

$
y=3x+1
$<math>

== 改行、改ページ
基本的にはエディタで1回改行しても
反映されないよ。(謎の空白が入るので注意)

2回改行すれば改行されるよ。

改行したいときは\ これでもいいし #linebreak() でもいいよ。

違いはご覧の通り文頭の字下げがあるかないかだよ。

#pagebreak()
これで改ページ