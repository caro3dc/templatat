#let template(title, code, cs, doc) = {

/* colours section */
let author = "Carlos Romeo Clemente Del Castillo III"
let bg = rgb("#f8ece1"); // BG; 50
let tc = rgb("#353542"); // Text; 950
let ac = rgb("#355eb4"); // Accent; 600
let la = rgb("#eac879"); // lightAccent; 300
let da = rgb("#7f1e33"); // darkAccent; 800

if      (cs == "red"){      bg = rgb("#FEF2F2"); tc = rgb("#450A0A"); ac = rgb("#DC2626"); la = rgb("#FECACA"); da = rgb("#991B1B") }
else if (cs == "orange") {  bg = rgb("#FFF7ED"); tc = rgb("#431407"); ac = rgb("#EA580C"); la = rgb("#FED7AA"); da = rgb("#9A3412") }
else if (cs == "yellow") {  bg = rgb("#FEFCE8"); tc = rgb("#422006"); ac = rgb("#CA8A04"); la = rgb("#FEF08A"); da = rgb("#854D0E") }
else if (cs == "lime") {    bg = rgb("#F7FEE7"); tc = rgb("#1A2E05"); ac = rgb("#65A30D"); la = rgb("#D9F99D"); da = rgb("#3F6212") }
else if (cs == "green") {   bg = rgb("#F0FDF4"); tc = rgb("#052E16"); ac = rgb("#16A34A"); la = rgb("#BBF7D0"); da = rgb("#166534") }
else if (cs == "teal") {    bg = rgb("#F0FDFA"); tc = rgb("#042F2E"); ac = rgb("#0D9488"); la = rgb("#99F6E4"); da = rgb("#115E59") }
else if (cs == "sky") {     bg = rgb("#F0F9FF"); tc = rgb("#082F49"); ac = rgb("#0284C7"); la = rgb("#BAE6FD"); da = rgb("#075985") }
else if (cs == "blue") {    bg = rgb("#EFF6FF"); tc = rgb("#172554"); ac = rgb("#2563EB"); la = rgb("#BFDBFE"); da = rgb("#1E40AF") }
else if (cs == "indigo") {  bg = rgb("#EEF2FF"); tc = rgb("#1E1B4B"); ac = rgb("#4F46E5"); la = rgb("#C7D2FE"); da = rgb("#3730A3") }
else if (cs == "purple") {  bg = rgb("#FAF5FF"); tc = rgb("#3B0764"); ac = rgb("#9333EA"); la = rgb("#E9D5FF"); da = rgb("#6B21A8") }
else if (cs == "magenta") { bg = rgb("#FDF4FF"); tc = rgb("#4A044E"); ac = rgb("#C026D3"); la = rgb("#F5D0FE"); da = rgb("#86198F") }
else if (cs == "pink") {    bg = rgb("#FDF2F8"); tc = rgb("#500724"); ac = rgb("#DB2777"); la = rgb("#FBCFE8"); da = rgb("#9D174D") }
else if (cs == "bluegrey"){ bg = rgb("#F8FAFC"); tc = rgb("#020617"); ac = rgb("#475569"); la = rgb("#E2E8F0"); da = rgb("#1E293B") }
else if (cs == "brown") {   bg = rgb("#EFEBE9"); tc = rgb("#3E2723"); ac = rgb("#795548"); la = rgb("#BCAAA4"); da = rgb("#4E342E") }
else if (cs == "grey") {    bg = rgb("#FAFAFA"); tc = rgb("#0A0A0A"); ac = rgb("#525252"); la = rgb("#E5E5E5"); da = rgb("#262626") }
else if (cs == "herald") {  bg = rgb("#f8ece1"); tc = rgb("#353542"); ac = rgb("#355eb4"); la = rgb("#eac879"); da = rgb("#7f1e33") }
else if (cs == "pine") {   bg = rgb("#EFEBE9"); tc = rgb("#022C22"); ac = rgb("#059669"); la = rgb("#B5D6C9"); da = rgb("#065F46") }

/* end colours section */

  
  set page(
    fill: bg,
    width: 6in,
    height: 12in,
    margin: (top: 1.25in, bottom: 0.65in, rest: 0.5in),
    header: par(leading:0.67em)[#text(10pt)[
      #smallcaps[#strong[#author]]
      #h(1fr)
      #strong[#datetime.today().display(
        "[day] [month repr:long] [year repr:full]"
      )]
      #linebreak()
      #title
      #h(1fr)
      #code
    ]
      #line(length: 100%, stroke: 0.5pt + tc )
    ],
    header-ascent: 0.25in,
    numbering: "1 / 1"
  )

  set text(
    fill: tc,
    font: "Linux Biolinum",
    size: 10pt,
  )

 set enum(
   body-indent: 1em,
   tight: false,
   indent: 1em
 )

 set list(indent: 1em, body-indent: 1em)
  set heading(numbering: "1.1 ·")

  show heading.where(level: 1): hy => [
    #set text(fill: bg, size: 1.15em)
    #align(center, block(inset: 0.33em, radius: 0.25em, fill: tc, smallcaps[#hy]))
  ]

  show heading.where(level: 2): hy => [
    #set text(fill: bg, size: 1.075em)
    #align(left, block(inset: 0.33em, radius: 0.25em, fill: da, smallcaps[#hy]))
  ]

  show heading.where(level: 3): hy => [
    #set text(fill: bg, size: 1em)
    #align(left, block(inset: 0.33em, radius: 0.25em, fill: ac, smallcaps[#hy]))
  ]

  show heading.where(level: 4): hy => [
    #set text(fill: tc, size: 1em)
    #align(left, block(inset: 0.33em, radius: 0.25em, fill: la, smallcaps[#hy]))
  ]

  
  set bibliography(style: "american-psychological-association", full: true)
  set cite(form: "normal", style: "american-psychological-association")
  
  set par(
    justify: true,
    leading: 0.85em,
  )

  set table(
    fill: (_, row) => if (calc.even(row)) { la } else {none},
    inset: 0.5em,
    stroke: 0.5pt + tc,
  )

  show table: ta => [#align(center)[#ta]]
  show par: set block(above: 1em, below: 2em)
  show heading: set block(above: 1em, below: 1em)
  show cite: set text(da)
  show quote: q => text(lang:"fr")[#emph(q)]
  set highlight( fill: la, extent: 0.1em)
  show highlight: hl => strong[#hl]
 set image(width: 55%)

 show image: im => [ #rect(fill: none, stroke: 2pt + tc, im, inset: 0pt, ) ]

 show figure: fig => [#align(center)[#block(above: 2em, below: 2em, fig)]]
 show raw.where(block:true): r => [ #box(inset:0.5em)[#text(font: "Cascadia Code")[#r] ]]


  // DONNY FOCKING TOUCH THIS ELSE YON DOCUMENT IS GONE
  doc
}