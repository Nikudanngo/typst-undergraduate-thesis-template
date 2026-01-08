// フォントの設定
// google Font(https://fonts.google.com/)から以下のフォントをダウンロードし、各OSのシステムにインストールしてください。
// - Noto Sans JP
// - Noto Serif JP

#import "template.typ": mainPage, titlePage
// chapterに対応した図番号をつけるためのライブラリ
#import "@preview/i-figured:0.2.4"
#show heading: i-figured.reset-counters
#show figure: i-figured.show-figure

//↓ここから書き換える
#show: doc => titlePage(
  // doc-type: "修 士 論 文 の 概 要",
  doc-type: "修 　士 　論 　文",
  year: "2026",
  title1: "一行目のタイトル",
  title2: "二行目のタイトル",
  deadline: "1月31日",
  name: "卒論 太郎",
  supervisor: "小林 裕之",
  co-supervisor: "",
  doc,
)

#show: doc => mainPage(doc)

#include "chapter1/chapter1.typ"

#include "chapter2/chapter2.typ"

#include "chapter3/chapter3.typ"

#include "chapter4/chapter4.typ"

#include "chapter5/chapter5.typ"

#include "chapter6/chapter6.typ"

#pagebreak()
#heading(numbering: none, [参考文献])
#set text(lang: "en")
#bibliography(
  "reference.bib",
  title: none,
)
#pagebreak()
#set page(numbering: none)
#include "chapter99/chapter99.typ"
