#let sans = ("Noto Sans JP")
#let serif = ("Noto Serif JP")

// text setting
#set text(font: serif, 12pt)
#set par(justify: true, first-line-indent: 1em, spacing: 0.65em)

// 図表キャプションのカスタマイズ
#let figcaption = (caption) => figure(caption: caption)
#let tblcaption = (caption) => table(caption: caption)

#let inkan = () => [
	#box(width: 0.6em, height: 0.6em,[
		#place(
			center+horizon,
		[
		#circle(
			radius: 0.5em,
			stroke: 1pt,
			[
				#text("印", font: serif, size: 0.8em)
			]
			)
		])
	])
]

#let titlePage(
	year: "2025",
	deadline: "1月30日",
	title1: "一行目タイトル",
	title2: "二行目タイトル",
	university: "大阪工業大学大学院",
	faculty: "学部",
	department: "学科",
	lab: "研究室",
	name: "名前",
	supervisor: "指導教員",
	co-supervisor: "補助担当教員",
	doc
) = {
	set par(justify: true, first-line-indent: 0pt)
	set page(margin: (
		top: 45mm,
		bottom: 30mm, 
		left: 20mm, 
		right: 20mm
	))

	// フォントサイズの設定
	set text(size: 18pt, weight: "medium", font: serif)
	align(center)[
		#set text(size: 26pt, weight: "bold", font: sans)
		#underline(offset: 10pt, stroke: 1pt, extent: 40pt ,text(size: 26pt,font: sans, tracking: 1.4em, "修士論文"))
		#v(-0.5em)
		#text(size: 12pt, spacing: 0em, weight: "medium", font: serif, tracking: 0.1em, [(#year 年 #deadline #h(1em) 提出)])
		#v(3em)
		#align(left)[
			#set text(size: 16pt, weight: "bold", font: serif, spacing: 0.5em)
			// titleのアルファベットはserif、それ以外はsans
			#show regex("[a-zA-Z]+"): set text(font: serif)
			論文題目 
			#set text(size: 20pt)
			#h(1fr)#title1#h(1fr)
			#v(-0.5em)
			#line(length: 100%, stroke: 1pt)
			#set align(center)
			#title2
			#v(-0.5em)
			#line(length: 100%, stroke: 1pt)
		]
		\
		\ 
		\
		#box(width: 70%)[
			#set align(left)
			#set text(font: serif, size: 13pt)
			#set par(justify: true)
			#let jb = linebreak(justify: true)
			#let width = 78pt

			#text( " " + box(width: width,[#text("指導教員" + jb)]) + h(1fr) + text(size: 18pt, weight: "bold", supervisor) + h(1.2fr) + inkan() + "")
			#v(-0.8em)
			#line(length: 100%, stroke: (dash: "dashed"))
			#v(0.5em)
			#text( " " + box(width: width,[#text("補助担当教員" + jb)]) + h(1fr) + text(size: 18pt, weight: "bold", co-supervisor) + h(1.2fr) + inkan() + "")
			#v(-0.8em)
			#line(length: 100%)
			\ 
			#text( " " + box(width: width,[#text("大学院" + jb)]) + h(1fr) + department + h(1.2fr)) \
			#text( " " + box(width: width,[#text("博士前期課程" + jb)]) + h(1fr) + faculty + h(1.2fr))
			#v(-0.8em)
			#line(length: 100%)
			\
			#text( " " + box(width: width,[#text("申請者氏名" + jb)]) + h(1fr) + text(size: 18pt, weight: "bold", name) + h(1.2fr) + inkan() + "")
			#v(-0.8em)
			#line(length: 100%)
		]
		\
		#align(center + bottom)[
			#set text(size: 26pt, weight: "medium", font: sans, tracking: 0.3em)
			#university
		]
	]
	pagebreak()
	set page(
		margin: (
			top: 25mm, 
			bottom: 20mm, 
			left: 25mm, 
			right: 15mm
		),
		numbering: "1"
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
		title: [#text(size: 1.3em, font: sans,weight: "medium", "目次") #v(2em)], 
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
	set list(indent: 2em , spacing: 1.5em,marker: ([#sym.circle.filled.tiny]))
	set enum(indent: 2em, spacing: 1.5em)
	show list.where() : it => [
		#linebreak()
		#it
	]
	show enum.where() : it => [
		#linebreak()
		#it
	]
	show figure.where(
  	kind: table
	): set figure.caption(position: top)
	doc
}
