#import "@preview/polylux:0.2.0": *
#import themes.simple: *
#set text(font: "Inria Sans")

#set image(height: 85%)

#let cgrid(cols, rows, data) = {
  let content = data.map((it) => block(
    stroke: (2pt), 
    width: 100%,
    height: 100%,
    align(center + horizon)[#text(size: 48pt, it)])
  )

  let c = ()
  let r = ()
  while c.len() < cols or r.len() < rows {
    if c.len() < cols { c.push(1fr) }
    if r.len() < rows { r.push(1fr) }
  }

  align(horizon, 
  box(
    width: 100%,
    height: 80%,
    inset: (bottom: 8pt),
    grid(
      gutter: 16pt,
      columns: c,
      rows: r,
      ..content
    )
  )
  )
}

#let split(col1, col2, variation: "") = {
  let cols = ()
  if variation == "left" {
    cols = (2fr, 1fr)
  } else if variation == "right" {
    cols = (1fr, 2fr)
  } else {
    cols = (1fr, 1fr)
  }
  grid(
    columns: cols,
    gutter: 16pt,
    col1, col2
  )
}

#show figure: it => align(center)[
  #it.caption
  #it.body
]

#show heading.where(level: 1): it => align(center)[
  #it
]

#show: simple-theme

#title-slide[
  #text(size: 32pt, [ Þorvaldur Tumi Baldursson ])\ 
]

#slide[
  #only(1)[#align(center, text(size: 32pt, [Hver er ég?]))]
  #only((2, 3, 4))[
    #grid(columns: (1fr, 1fr, 1fr),
      uncover((2, 3, 4), align(center, figure(image("imgs/computer.jpg"), caption: [Tölvur]))), 
      uncover((3, 4), align(center, figure(image("imgs/bassi.jpg"), caption: [Tónlist]))),
      uncover(4, align(center, figure(image("imgs/skidi.jpg"), caption: [TÚtivist])))
    )
  ]
]

#slide[
  = Tölvur
  #cgrid(2, 2, ([Fortíð],[Fyrsta ár],[Annað ár],[Þriðja ár]))
]

#slide[
  = Fortíð
  #split(
    block(height:80%, align(horizon, text(size: 48pt)[
      - Mikill áhugi
      - Hvatning
      - Tölvuleikir
      - Vinna
    ])),
    image("imgs/ungur.jpg"),
  )
]

#slide[
  = Fyrsta ár
  #split(
    image("imgs/juni_viso.jpg"),
    block(height:80%, align(horizon, text(size: 48pt)[
      - Vísó
      - Fólk
      - Fókus
    ])),
    variation: "left"
  )
]

#slide[
  = Annað ár
  #split(
    block(height:80%, align(horizon, text(size: 48pt)[
      - Hakkaþon
      - Útlönd
      - Kennsla
      - Harka
    ])),
    image("imgs/vin.jpg"),
    variation: "right"
  )
]

#slide[
  = Þriðja ár / Núna
  #split(
    image("imgs/auto.jpg"),
    block(height:80%, align(horizon, text(size: 48pt)[
      - Vinna
      - Vinna
      - Vinna
    ])),
    variation: "left"
  )
]

#slide[
  = Tónlist
  #align(center)[
    #image(fit: "contain", "imgs/sameheads.jpg")
  ]
]

#slide[
= Útivist
#split(align(horizon)[
  - Fjallgöngur
  - Skíði
  - Hlaup
  - Hjólreiðar
  - Sund
  - Garðyrkja
  ],[
  #image("imgs/hjolid.jpg")
  ], variation: "right"
  )
]

#title-slide[
  #text(size: 64pt)[ Kennsla sem lærdómtól ]
]
