---
title: "Resources for R programming project management"
output:
  html_document:
    includes:
      in_header: docs/header.html
    df_print: paged
    css: styles.css
    
knit: (function(input, ...) {
    rmarkdown::render(
      input,
      output_file = 'docs/resources')
  })
---

::: {.topnav}
<a href="index.html">GitHub and R guide</a> <a href="https://github.com/wyatt-toure/github-and-R-starter-guide" style = "float: right;"><i class="fab fa-github"></i> GitHub </a> <a href="resources.html" class="active" style = "float: right;"><i class="fas fa-toolbox"></i> Resources</a><a href="video-tutorial.html" style = "float: right;"><i class="fas fa-video"></i> Video tutorial</a><a href="written-guide.html" style = "float: right;"><i class="fas fa-book"></i> Written guide</a><a href="index.html" style = "float: right;"><i class="fas fa-home"></i> Home</a>
:::

<p class="author-name">M. Wyatt Toure[1]{.affil-mark}</p><p class="author-affil">[1]{.affil-mark}McGill University, Department of Biology, 1205 Docteur Penfield, Montreal, Quebec H3A 1B1, Canada</p><p>e-mail: `m_wyatt.toure@mail.mcgill.ca`</p>

------------------------------------------------------------------------

## Overview

On this page I list software and guides that I find/have found particularly useful for managing programming projects. I would be happy to add additional resources people think should be on this list. Many of these links are resources I used to help make this page so check out these more detailed resources if something was unclear or you want to learn even more. 

## Git and GitHub

- [Happy Git and GitHub for the useR](https://happygitwithr.com/index.html) is a comprehensive introductory guide to using Git and GitHub with R, Rstudio, and Rmarkdown
-[Pro Git](https://git-scm.com/book/en/v2) is a free online book which provides a foundation in Git.

## Software documentation

- [report](https://easystats.github.io/report/) 
- [renv](https://rstudio.github.io/renv/) 
- [fertile](https://github.com/baumer-lab/fertile) 

## Workflow management 

- [reproducible](https://reproducible.predictiveecology.org/)
- [drake](https://github.com/ropensci/drake)

## Reproducibility guides

- [rOpenSci Reproducibility in Science A Guide to enhancing reproducibility in scientific results and writing.](http://ropensci.github.io/reproducibility-guide/)
- [The Turing Way](https://the-turing-way.netlify.app/welcome) is an extensive, open-source, community built guide for best practices in conducting reproducible, ethical, inclusive, and collaborative science. They go into much greater depth on several of the topics I have touched on in this guide. 
- [R for Reproducible Scientific Analysis](http://swcarpentry.github.io/r-novice-gapminder/) contains the lesson materials foor a workshop that teaches fundamentals of programming in R (the focus is not on teaching statistical analysis). 
- [r-docker-tutorial](http://ropenscilabs.github.io/r-docker-tutorial/)

## 