#let rsjconf(
    title: "An RSJ paper",
    authors: (
	(
	    name: "Author One",
	    affiliation: "Awesome University",
        supervisor: false,
	),
	(
	    name: "Author Two",
	    affiliation: "Awesome University",
        supervisor: true,
	),
    ),
    abstract: [],
    doc
) = {
    let sans = ("Noto Sans JP", "sans")
    let serif = ("Noto Serif JP", "serif")
    set text(lang: "ja", font: serif, 9.5pt)
    set page(margin: (bottom: 27mm, top:28mm, left: 20mm, right: 20mm))
    set par(justify: true, first-line-indent: 1em, leading: 0.5em, spacing: 0.5em)
    // equation numbering as (1), (2), ...
    set math.equation(numbering: "(1)")
    // equation reference as (1)
    show ref: it => {
	let eq = math.equation
	let el = it.element
	if el != none and el.func() == eq {
	    numbering(
		el.numbering,
		..counter(eq).at(el.location())
	    )
	} else {
	    it
	}
    }
    //    set par(hanging-indent: -1em) // workaround for the first-line-indent bug? of Typst (0.11.0)
    show strong: it => {text(font: sans, it)}
    set align(center)
    set enum(numbering: "1.")
    set heading(numbering: (car, ..cdr) => {
	if cdr.pos().len() == 0 {
	    [#car.#h(0.5em)]
	} else {
	    [#car.#cdr.pos().map(str).join(".")#h(1em)]
	}
    })
    show heading: set text(10pt, font: sans, weight: "medium")
    show heading.where(level: 1): it => {
    set align(center)
	set text(11pt)
	it
    }
    // workaround for the first-line-indent bug? of Typst (0.11.0)
    // show heading: it => {it;text()[#v(0.5em, weak: true)];text()[#h(0em)]}
    show heading: it => [
        #it
        #par(text(size: 0em, ""))
    ]
    show enum: it => {it;text()[#v(0.5em, weak: true)];text()[#h(0em)]}
    show list: it => {it;text()[#v(0.5em, weak: true)];text()[#h(0em)]}
    // paper title
    // v(1.5mm)
    text(17pt, weight: "medium", font: sans, title)
    // authors
    let nAuthors = authors.len()
    let nCols = calc.min(nAuthors, 3)
    v(6mm)
    grid(
	columns: nCols,
	column-gutter: 10mm,
	..authors.map(a => [
	    #stack(
		dir: ltr,
		if ("supervisor" in a) and a.supervisor {text(12pt, "指導教員: ")},
		[#text(12pt, [#a.name])]
	    )
	])
    )
    set align(left)
    v(10mm)
    columns(2, doc)
}
