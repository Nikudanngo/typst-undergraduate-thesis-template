// フォントの設定
// google Font(https://fonts.google.com/)から以下のフォントをダウンロードし、各OSのシステムにインストールしてください。
// - Noto Sans JP
// - Noto Serif JP

#import "template.typ": titlePage,mainPage
// chapterに対応した図番号をつけるためのライブラリ
#import "@preview/i-figured:0.2.4"
#show heading: i-figured.reset-counters
#show figure: i-figured.show-figure
#show math.equation: i-figured.show-equation

//↓ここから書き換える
#show: doc => titlePage(
  isOverview: false,
  year: "2024",
  title1: "一行目タイトル",
  title2: "",
  deadline: "1月30日",
  university: "大阪工業大学大学院",
  department: "ロボティクス＆デザイン工学研究科",
  faculty: "ロボティクス＆デザイン工学専攻",
  lab: "知能ロボティクス研究室",
  name: "卒論 太郎",
  supervisor: "小林 裕之",
  co-supervisor: "",　// ここは指導教員のみの場合はここは空欄にしておく。
  doc
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
  title: none
)
#pagebreak()
#set page(numbering: none)
#include "chapter99/chapter99.typ"
