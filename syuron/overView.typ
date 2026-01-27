#import "template.typ": titlePage, overviewPage

#show: doc => titlePage(
  isOverview: true,
  year: "2026",
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

#show: doc => overviewPage(doc)
= 概要


#lorem(430)
