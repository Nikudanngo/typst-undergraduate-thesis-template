#let sans = "Noto Sans JP"
#let serif = "Noto Serif JP"
#let thick = 0.8pt
#let semithick = 0.6pt

// text setting
#set text(font: serif, 12pt)
#set par(justify: true, first-line-indent: 1em, spacing: 0.65em)

// 図表キャプションのカスタマイズ
#let figcaption = caption => figure(caption: caption)
#let tblcaption = caption => table(caption: caption)

// --- コンポーネント定義 ---

#let inkan-box() = {
  box(width: 4mm, height: 4mm)[ // サイズを固定
    #place(center + horizon)[
      #circle(radius: 2mm, stroke: 0.4pt)[
        #set align(center + horizon)
        #text(font: serif, size: 11pt)[印]
      ]
    ]
  ]
}

#let titlePage(
  doc-type: "修 　士 　論 　文",
  year: "2026",
  deadline: "1月30日",
  title1: "一行目タイトル",
  title2: "二行目タイトル",
  supervisor: "指導教員名",
  co-supervisor: "補助教員名",
  name: "申請者氏名",
  doc,
) = {
  set page(margin: 0mm, paper: "a4")
  set text(lang: "ja", font: serif, weight: "semibold")

  // --- 1. 文書タイトル ---
  // 基準: (6.8, 24.2), 長さ 9.2cm
  let t-x = 6.8cm
  let t-y = 29.7cm - 24.2cm
  let t-w = 9.2cm

  // 線
  place(dx: t-x, dy: t-y)[#line(length: t-w, stroke: thick)]

  // タイトル文字（線の中央）
  place(dx: t-x, dy: t-y - 26pt - 4pt)[ // 文字サイズ+隙間(4pt)分 上へ
    #box(width: t-w, align(center)[
      #text(font: sans, size: 26pt)[#doc-type]
    ])
  ]
  // 提出日（線の中央）
  place(dx: t-x, dy: t-y + 12pt)[ // 隙間(12pt)分 下へ
    #box(width: t-w, align(center)[
      #text(font: serif, size: 12pt, spacing: 0.25em)[(#year 年 #deadline #h(1em) 提出)]
    ])
  ]


  // --- 2. 論文題目 ---
  // 線1: (4, 19.4), 長さ 14.6cm
  let d1-x = 4cm
  let d1-y = 29.7cm - 19.4cm
  let d1-w = 14.6cm

  place(dx: d1-x, dy: d1-y)[#line(length: d1-w, stroke: semithick)]

  // ラベル "論文題目" (左端, yshift=3.5mm)
  place(dx: d1-x, dy: d1-y - 16pt - 3.5mm)[
    #text(font: serif, size: 16pt)[論文題目]
  ]
  // 題目1行目 (pos=0.6 -> 左から60%の位置中心, yshift=2mm)
  place(dx: d1-x, dy: d1-y - 20pt - 2mm)[
    #box(width: d1-w, align(center)[ // boxで幅確保してcenter寄せはしない（pos指定のため）
      #place(dx: d1-w * 0.6)[ // 左から60%を基準に
        #place(center)[ // その地点を「文字の中心」にする
          #text(font: serif, size: 20pt, weight: "bold")[#title1]
        ]
      ]
    ])
  ]

  // 線2: (4, 17.8)
  let d2-y = 29.7cm - 17.8cm
  place(dx: d1-x, dy: d2-y)[#line(length: d1-w, stroke: semithick)]

  // 題目2行目 (pos=0.5, yshift=2mm)
  place(dx: d1-x, dy: d2-y - 20pt - 2mm)[
    #box(width: d1-w)[
      #place(dx: d1-w * 0.5)[ // 左から50%
        #place(center)[
          #text(font: serif, size: 20pt, weight: "bold")[#title2]
        ]
      ]
    ]
  ]


  // --- 3. 署名欄（共通設定） ---
  let row-x = 5.9cm
  let row-w = 10.8cm
  let name-pos = row-w * 0.6 // 名前は左から60%の位置

  // (A) 指導教員 (y=13.7)
  let s-y = 29.7cm - 13.7cm

  // 線（点線）
  place(dx: row-x, dy: s-y)[#line(length: row-w, stroke: (thickness: semithick, dash: (1mm, 0.75mm)))]

  // ラベル (左端+3mm, 上へ1mm)
  place(dx: row-x + 3mm, dy: s-y - 13pt - 1mm)[
    #text(font: serif, size: 13pt, tracking: 2em / 3)[指導教員]
  ]
  // 名前 (pos=0.6)
  place(dx: row-x + name-pos, dy: s-y - 18pt)[ // yshiftなし、線の上に乗せる感じ
    #place(center)[
      #text(font: serif, size: 18pt)[#supervisor]
    ]
  ]
  // 印 (pos=1, -6mm, yshift=3mm)
  place(dx: row-x + row-w - 6mm, dy: s-y - 2mm - 3mm)[ // 2mm(半径)+3mm(浮かせ)
    #inkan-box()
  ]


  // (B) 補助担当教員 (y=12.4)
  let c-y = 29.7cm - 12.4cm
  place(dx: row-x, dy: c-y)[#line(length: row-w, stroke: semithick)]

  place(dx: row-x + 3mm, dy: c-y - 13pt - 1mm)[
    #text(font: serif, size: 13pt)[補助担当教員]
  ]
  place(dx: row-x + name-pos, dy: c-y - 18pt)[
    #place(center)[
      #text(font: serif, size: 18pt)[#co-supervisor]
    ]
  ]
  // 補助教員がいる場合のみ印を表示するなどの分岐が可能
  place(dx: row-x + row-w - 6mm, dy: c-y - 2mm - 3mm)[
    #inkan-box()
  ]


  // (C) 専攻 (y=10.9, 10.3)
  // 1行目
  let m1-y = 29.7cm - 10.9cm
  place(dx: row-x + 3mm, dy: m1-y - 13pt - 1mm)[
    #text(font: serif, size: 13pt, tracking: 1em)[大学院]
  ]
  place(dx: row-x + 10.8cm * 0.65, dy: m1-y - 13pt - 1mm)[ // 少し右(0.65)と推測
    #place(center)[
      #text(font: serif, size: 13pt)[ロボティクス＆デザイン工学研究科]
    ]
  ]

  // 2行目
  let m2-y = 29.7cm - 10.3cm
  place(dx: row-x, dy: m2-y)[#line(length: row-w, stroke: semithick)]
  place(dx: row-x + 3mm, dy: m2-y - 13pt - 1mm)[
    #text(font: serif, size: 13pt)[博士前期課程]
  ]
  place(dx: row-x + 10.8cm * 0.65, dy: m2-y - 13pt - 1mm)[
    #place(center)[
      #text(font: serif, size: 13pt)[ロボティクス＆デザイン工学専攻]
    ]
  ]


  // (D) 申請者氏名 (y=8.3)
  let n-y = 29.7cm - 8.3cm
  place(dx: row-x, dy: n-y)[#line(length: row-w, stroke: semithick)]

  place(dx: row-x + 3mm, dy: n-y - 13pt - 1mm)[
    #text(font: serif, size: 13pt)[申請者氏名]
  ]
  place(dx: row-x + name-pos, dy: n-y - 18pt)[
    #place(center)[
      #text(font: serif, size: 18pt)[#name]
    ]
  ]
  place(dx: row-x + row-w - 6mm, dy: n-y - 2mm - 3mm)[
    #inkan-box()
  ]


  // --- 4. 大学名フッター ---
  // 座標 (11.3, 2.8)
  place(dx: 11.3cm, dy: 29.7cm - 2.8cm - 24pt)[ // 24pt文字の下端を合わせる
    #place(center)[ // 文字の幅の中心を 11.3cm に合わせる
      #text(font: sans, size: 24pt, tracking: 1em / 3)[大阪工業大学大学院]
    ]
  ]
  pagebreak()
  set page(
    margin: (
      top: 25mm,
      bottom: 20mm,
      left: 25mm,
      right: 15mm,
    ),
    numbering: "1",
  )
  set text(font: serif, size: 12pt)
  // headingが長いと、二行目以降のインデントが左寄せになり、行間の....の表示がおかしくなる場合がある
  // https://forum.typst.app/t/how-to-fix-the-bug-for-outline-entries-with-long-titles/707/2
  show outline.entry.where(
    level: 1,
  ): it => {
    set text(weight: "bold", size: 12pt)
    v(1.5em, weak: true)
    it
  }
  outline(
    title: [#text(size: 1.3em, font: sans, weight: "medium", "目次") #v(2em)],
    indent: 2em,
  )
  pagebreak()
  doc
}

#let mainPage(doc) = {
  set math.equation(numbering: "(1)")
  set text(lang: "ja", font: serif, size: 12pt)
  set ref(supplement: none)
  set par(justify: true, first-line-indent: 1em, spacing: 0.65em)
  set heading(numbering: "1.1 ")
  show heading.where(level: 1): set heading(numbering: "第1章 ")
  show heading.where(level: 1): it => [
    #set text(weight: "semibold", size: 1.4em)
    #linebreak()
    #it
  ]
  show heading.where(level: 2): it => [
    #set text(weight: "semibold", size: 1.2em)
    #it
  ]
  show heading.where(level: 3): it => [
    #set text(weight: "semibold", size: 1.1em)
    #it
  ]
  show heading: it => [
    #show regex("a-zA-Z1-9"): set text(font: serif)
    #show regex("[^a-zA-Z1-9]"): set text(font: sans)
    #it
    #par(text(size: 0pt, ""))
  ]
  set list(indent: 2em, spacing: 1.5em, marker: [#sym.circle.filled.tiny])
  set enum(indent: 2em, spacing: 1.5em)
  show list.where(): it => [
    #linebreak()
    #it
  ]
  show enum.where(): it => [
    #linebreak()
    #it
  ]
  show figure.where(
    kind: table,
  ): set figure.caption(position: top)
  doc
}
