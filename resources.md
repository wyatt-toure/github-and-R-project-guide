---
title: "Resources for R programming project management"
output:
  html_document:
    df_print: paged
    css: styles.css
    
knit: (function(input, ...) {
    rmarkdown::render(
      input,
      output_file = 'docs/resources')
  })
bibliography: references.bib
link-citations: yes
csl: reference-info/elife-citation-style.csl
---

::: {.topnav}
<a href="index.html">GitHub and R guide</a> <a href="https://github.com/wyatt-toure/github-and-R-starter-guide" style = "float: right;"><img src="images/github.svg" width="20"/></img> GitHub</a> <a href="resources.html" style = "float: right;" class="active"><img src="images/toolbox.svg" width="20"/></img> Resources</a><a href="video-tutorial.html" style = "float: right;"><img src="images/video.svg" width="20"/></img> Video tutorial</a><a href="written-guide.html" style = "float: right;"><img src="images/book.svg" width="15"/></i> Written guide</a> <a href="index.html" style = "float: right;"><img src="images/home.svg" width="20"/></img> Home</a>
:::

<p class="author-name">M. Wyatt Toure[1]{.affil-mark}</p><p class="author-affil">[1]{.affil-mark}McGill University, Department of Biology, 1205 Docteur Penfield, Montreal, Quebec H3A 1B1, Canada</p><p>e-mail: `m_wyatt.toure@mail.mcgill.ca`</p>

------------------------------------------------------------------------

## Overview

On this page I list software and guides that I find/have found particularly useful for managing programming projects and learning about programming. Most of these tools and guides are open source meaning that the materials (*e.g.*, source code, image files, text files) used to generate them are available for you to see. Many of these links are resources I used to help make this page so check out these more detailed resources if something was unclear or you want to learn even more. I'm happy to add additional resources people think should be on this list.

------------------------------------------------------------------------

## Git and GitHub

-   [Happy Git and GitHub for the useR](https://happygitwithr.com/index.html) is a comprehensive introductory guide to using Git and GitHub with R, Rstudio, and Rmarkdown which is particularly suited to those that will be focusing on R programming.
-   [Pro Git](https://git-scm.com/book/en/v2) is a free online book which provides a great foundation in Git and instruction on how to use GitHub without a focus on any particular programming language.
-   [GitHub Desktop app documentation](https://docs.github.com/en/desktop)
-   Ten Simple Rules for Taking Advantage of Git and GitHub [@perez-riverol2016TenSimpleRules]

## Software documentation {#software-documentation}

-   [report](https://easystats.github.io/report/) is an R package that can produce the software, software versions, and R version used in an analysis script with `report::report(sessionInfo())`.
-   [renv](https://rstudio.github.io/renv/) is an R package that catalogs package dependencies. This package can allow someone to download your project repository and run `renv::restore()` to download the specific package versions used in your analysis [@ushey2021RenvProjectEnvironments].
-   [fertile](https://github.com/baumer-lab/fertile) is an R package that has several functions that check different aspects of reproducibility such as whether files are self contained, what the project software dependencies are, produces install scripts for dependencies, and much more [@bertin2021CreatingOptimalConditions].
-   [r-docker-tutorial](http://ropenscilabs.github.io/r-docker-tutorial/) is an introduction to using Docker for users of R and Rstudio by [rOpenSci](https://ropensci.org/about/).
-   [liftr](https://liftr.me/) is an R package which will generate docker containers from Rmarkdown files [@nust2020RockerversePackagesApplicationsa].

## Work flow management

-   [reproducible](https://reproducible.predictiveecology.org/) is an R package that makes it easier to re-run code from scratch multiple times. A reason you would want this package is if you work with very large raw data sets (*e.g.* spatial data for ecological niche models or bioinformatic data) that have very long pre processing steps [@mcintire2021ReproducibleSetTools].
-   [targets](https://docs.ropensci.org/targets/) is an R package which helps conduct long run times. A large work flow has a bunch of moving parts. If you change one stage you need to re run the computation to bring the results up to date [@landau2021TargetsPackageDynamic]. targets will show you the status of data, functions, etc. [drake](https://docs.ropensci.org/drake/) is an older version of targets but has limitations which required a completely new software implementation [@landau2018DrakePackagePipeline].
-   [flowr](http://flow-r.github.io/flowr/) is an R package which helps design and implement complex analysis pipelines (think big data like bioinformatics).

## Reproducibility guides

-   [rOpenSci Reproducibility in Science A Guide to enhancing reproducibility in scientific results and writing](http://ropensci.github.io/reproducibility-guide/) is a website that was created during an rOpenSci hackathon. It contains sections about writing code, storing data, and project work flows.
-   [The Turing Way](https://the-turing-way.netlify.app/welcome) is an extensive, open-source, community built guide for best practices in conducting reproducible, ethical, inclusive, and collaborative science. They go into much greater depth on several of the topics I have touched on in this guide.
-   [R for Reproducible Scientific Analysis](http://swcarpentry.github.io/r-novice-gapminder/) contains the lesson materials for a workshop that teaches fundamentals of programming in R (the focus is not on teaching statistical analysis).

## Cheat sheets

-   [Git commands](https://education.github.com/git-cheat-sheet-education.pdf)
-   [Rmarkdown](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf)
-   [Rstudio](https://github.com/rstudio/cheatsheets/blob/master/rstudio-ide.pdf)
-   [Randomizr](https://github.com/rstudio/cheatsheets/blob/master/randomizr.pdf), an experimental treatment assignment package
-   [dplyr](https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf), a tidyverse data transformation package

## References
