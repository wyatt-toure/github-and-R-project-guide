library(DiagrammeR)

grViz("
digraph dot {

graph [layout = dot,
        rankdir = LR]

node [shape = circle,
      style = filled,
      color = grey,
      label = '']

node [fillcolor = '#4e79a7']
a

node [fillcolor = '#e15759']
b w 

node [fillcolor = '#f28e2b']
u

node [fillcolor = '#4e79a7']


edge [color = '#bab0ac']

{f} -> {b}
b -> w
w -> i
f -> u
u -> h
a -> {e} -> {f} -> {g} -> {h} -> {i} -> {j}
}")