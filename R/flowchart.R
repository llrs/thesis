library("grViz")
a <- grViz("
digraph boxes_and_circles {

  # a 'graph' statement
  graph [overlap = true, fontsize = 12]

  # several 'node' statements
  node [shape = diamond,
        fontname = Helvetica]
  A [label = 'Technical\nreplicates?']
  B [label = 'Does the \nposition matter?']

  node [shape = box,
        fontname = Monospace,
        fontsize = 10,
        fixedsize = true]
  C [label = 'design']
  E [label = 'spatial']

  node [shape = box,
        size=9,
        fontname = Monospace,
        fontsize = 9,
        fixedsize = true]
  D [label = 'replicates']

  node [shape = none,
        fontname = Helvetica,
        fixedsize = true]
  F [label = 'Done!']

  # several 'edge' statements
  A->C [label = 'No']
  A->D [label = 'Yes']
  D->B
  C->B
  B->E [label = 'Yes', labeljust = 'l']
  E->F
  B->F [label = 'No']
}
")

# 2. Convert to SVG, then save as png
b <- DiagrammeRsvg::export_svg(a)
d <- charToRaw(b) # flatten
rsvg::rsvg_png(d, "images/flowchart_dot.png")
