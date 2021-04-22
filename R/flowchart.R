library(DiagrammeR)

mermaid("
graph LR
A(Data Collection)-->B(Data preparation)
B-->C(Analysis)
C-->D(Write up)
style A fill:#76b7b2, stroke-width:0px
style B fill:#4e79a7, stroke-width:0px
style C fill:#edc948, stroke-width:0px
style D fill:#59a14f, stroke-width:0px
")
