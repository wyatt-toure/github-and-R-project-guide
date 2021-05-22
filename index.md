---
title: "Project management with Git, GitHub, and Rmarkdown: A starter's guide"
output:
  html_document:
    df_print: paged
    css: styles.css
    
knit: (function(input, ...) {
    rmarkdown::render(
      input,
      output_file = 'docs/index')
  })
---

::: {.topnav}
<a href="index.html">GitHub and R guide</a> <a href="https://github.com/wyatt-toure/github-and-R-starter-guide" style = "float: right;"><img src="images/github.svg" width = "20"></img> GitHub</a> <a href="resources.html" style = "float: right;"><img src="images/toolbox.svg" width ="20"></img> Resources</a><a href="video-tutorial.html" style = "float: right;"><img src="images/video.svg" width = "20"></img> Video tutorial</a><a href="written-guide.html" style = "float: right;"><img src="images/book.svg" width = "15"></i> Written guide</a> <a href="index.html" style = "float: right;" class="active"><img src="images/home.svg" width = "20"></img> Home</a>
:::

<p class="author-name">M. Wyatt Toure[1]{.affil-mark}</p><p class="author-affil">[1]{.affil-mark}McGill University, Department of Biology, 1205 Docteur Penfield, Montreal, Quebec H3A 1B1, Canada</p><p>e-mail: `wyatt.toure@gmail.com`</p>
------------------------------------------------------------------------

![](images/starter-guide-logo2.png){style="float: right; margin: 0% 0% 0% 5%;" width="190"}

*Note this site is a work in progress, the video tutorial is not yet available*

Research can be messy and often during an undergraduate degree we learn a lot about theory and deciding what statistical tests to use but less about the practicalities of managing a research project. I myself was never sat down and told how I should structure the files of my projects or how to keep track of different file versions. Thus, through trial and error I have learned some tid-bits about research project management and methods for keeping track of all the materials that are produced in the process of conducting experiments. The goal of this site is to demonstrate the benefit of using Git, GitHub, and Rmarkdown, three tools which aid tremendously in version controlling and documenting analyses. On this site I share a brief [written guide](written-guide.html) and [video tutorial](video-guide.html) to using these tools as well as a [list of resources](resources.html) that help manage version controlled projects. The written guide introduces and explains the key concepts while the video tutorial walks through a demonstration of these principles in action.  

![](images/directory-rendering.svg)
