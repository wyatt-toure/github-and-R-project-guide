---
title: "Guide to creating reproducible analyses with GitHub and R"
bibliography: reference-info/references.bib
csl: reference-info/elife-citation-style.csl
link-citations: yes
output:
  html_document:
    includes:
      in_header: docs/header.html
      after_body: docs/footer.html
    df_print: paged
    css: styles.css

knit: (function(input, ...) {
    rmarkdown::render(
      input,
      output_file = 'docs/written-guide')
  })
---

::: {.topnav}
<a href="index.html">GitHub and R guide</a> <a href="https://github.com/wyatt-toure/github-and-R-project-guide" style = "float: right;"><i class="fab fa-github"></i> GitHub</a> <a href="resources.html" style = "float: right;"><i class="fas fa-toolbox"></i> Resources</a><a href="video-tutorial.html" style = "float: right;"><i class="fas fa-video"></i> Video tutorial</a><a href="written-guide.html" class="active" style = "float: right;"><i class="fas fa-book"></i> Written guide</a> <a href="index.html" style = "float: right;"><i class="fas fa-home"></i> Home</a>
:::

<p class="author-name">M. Wyatt Toure[1]{.affil-mark}</p><p class="author-affil">[1]{.affil-mark}McGill University, Department of Biology, 1205 Docteur Penfield, Montreal, Quebec H3A 1B1, Canada</p><p>e-mail: `m_wyatt.toure@mail.mcgill.ca`</p>

------------------------------------------------------------------------

## Introduction

In research you will often find yourself handling several data, analysis code, manuscript, and figure files which can go through many intermediary stages based upon decisions you make during your project analysis. Not properly documenting changes across all these files can lead to difficulties in re-tracing our steps. If analysis pipelines are not accurately documented then even the person who performed the analysis can have a difficult time reproducing it [@perkel2020]. This then cascades into difficulties for others to retrace our steps. Moreover, in programming languages with large communities such as R many of these steps can be mediated by community built libraries/packages which are suites of functions that perform specifics tasks [@wickham2019WelcomeTidyverse; @bates2014FittingLinearMixedEffects]. Given the many software dependencies modern analyses typically rely on, the metadata concerning the software versions used can be just as crucial in reproducing an analysis as the code itself. Keeping track of data and software versions are therefore crucial steps in reproducing analyses for yourself and others. Fortunately, documenting each step of an analysis pipeline has never been easier as a result of documentation tools such as Rmarkdown and version control software such as *Git* and GitHub.

Here I explain how to create version controlled directories for projects which allow one to share analysis steps and keep track of changes made in the process of performing an analysis. Documenting key facts about an analysis such as what steps were run to transform data, perform the analyses, and create the figures make it easier to perform, share, and re-visit your project analyses.

## Project Directories

To keep projects clear and organized it is good to separate components of a project that have a shared organizing structure within their own directories. I tend to like the following project structure for my work:

    .
    ├── ./LICENSE.md
    ├── ./README.md
    ├── ./my-analysis-project.Rproj
    ├── ./analysis.Rmd
    ├── ./data
    │   └── ./data/my-data.csv
    ├── ./docs
    │   └── ./docs/analysis.html
    ├── ./figs
    │   ├── ./figs/figure-1.png
    │   └── ./figs/figure-2.png
    └── ./R
        ├── ./R/function-one.R
        └── ./R/function-two.R

This is called a directory tree and it is used to represent a directory structure in plain text. The `.` represents the root directory (sometimes called the main directory) which is the directory you see when you first open the project directory and a `/` indicates a directory. Therefore everything inside just `./` is in the root directory. In the root directory I have `LICENSE.md` which contains the software license for your project. It basically dictates who can do what with your code. You can explore different licensing options at <https://choosealicense.com/>. Personally, I generally always license my projects under an MIT license which lets people do anything they want with your software but you may opt for something else. `README.md` contains information about the contents of the directory and the project. I also place my `.Rproj` file (here named `my-analysis-project.Rproj`) in the root directory. An R project file makes it easier to keep R scripts from different projects distinct from each other. Finally, I also keep the Rmarkdown file, `analysis.Rmd` which contains the full analysis in the root directory.

Another `/` indicates a subdirectory. In the subdirectories I have:

-   `R/` which contains custom R functions relevant for the analysis

-   `data/` which contains the raw data used in the analysis

-   `docs/` which contains the documentation for the analysis

-   `figs/` which contains the figures generated from the code in the analysis script

The `docs/` and `figs/` directory are always populated with outputs produced in the `analysis.Rmd` script.

## Coding

For this guide I am going to assume you are familiar with R but I will give a brief overview of R here regardless. R is a programming language which is specialised for data manipulation and analysis. With R one can write scripts that executes commands for XYZ. This means all commands that lead to your final results can be recorded within the script and that produces your analysis providing a record of the steps you took.

R is a functional programming language. Everything you do in R is done by calling functions. Typically you call functions on variables which have been assigned values.

### Writing code

Good code should be simple, readable, and modular. Keeping a consistent style helps in making your code readable. I myself try to conform to the [tidyverse style guidelines](https://style.tidyverse.org/) when writing R code. To keep your code readable try to have clear, precise, and meaningful variable and function names. A simple example is below.

``` {.r}
# Reading in data 
full_data <- read.csv("path/to/your-data.csv")

# Extracting male only data
male_data <- filter(full_data, sex == "M")
```

This block of code reads in our full data set and stores into a variable called `full_data`. This data is then subset by sex using the `filter()` function so that only data for the males is extracted from the full data set. We store this in the variable `male_data`.

Always comment your code. It is tempting to think that you will remember why code was written in a particular way or for what purpose. This is a lie. It is rarely the case---you will forget. Well commented code makes it easier for you and others to quickly gleam what the code snippets in a script are meant to do and how they work.

Modular code means that code is broken up into distinct components that are called at different points of the script. Rather than copy and pasting certain steps that are performed multiple times, which is liable to copy-paste errors, writing a function that contains those steps and then calling that function when needed makes debugging easier. For example, if at some point you realize your code of interest is producing unexpected behaviour, rather than inspect all instances where you have copy and pasted code the performs task X you can simply inspect the function, fix it there, and the changes will carryover to the entire script.

## Data

There are steps that can be taken before data is even collected to make for a better documented project. Often experimental subjects are split into experimental treatments. You can programmatically assign individuals to different treatment based on the criteria your experiment depends upon [@coppock2019RandomizrEasytoUseTools]. This can help in making you think early on explicitly about your experimental design and serve as a record of your design decisions.

Once individuals are assigned to treatments and data is being collected it is important to consider collecting the finest level of data possible. For example, if you wanted to determine whether fish weigh more than 10 grams, rather than record each fish as True (above 10 grams) or False (below 10 grams), recording the actual weight will provide more information in addition to allowing you to transform the data later. Transformations to a coarser level of analysis can always be done but it is not possible to go from a coarse level of analysis to a fine level of analysis if only the coarse data are collected.

### Tracking data transformations

Performing transformations of the raw data into meaningful variables is often needed in the course of an analysis. Spreadsheet software (*e.g.,* Microsoft Excel) is often used to do these transformations manually and then save these changes into separate files. The idiosyncrasies and lack of a record of what was done and how when using spreadsheet based software can lead to difficulties in retracing one's steps or to outright errors [@ziemann2016GeneNameErrors]. Additionally, many researchers, including me, can tell you from experience that this is a bad practice. In my case, before I switched to programmatically creating new data files I would end up with directories with file names such as `data_new.csv`, `data_na_removed1.xlsx`, or `data_final_subset_realv3.csv` which were constructed by manually constructing new sheets with Excel---this is a terrible way to do this (Figure 1).

![Figure 1: The Lovecraftian horror that was my early data directories](images/directory-horror.png){#figure-horror style="display: block;   margin-left: auto;   margin-right: auto;" width="400"}

In this case it is easy to lose track of how these files changed. This becomes even more difficult if it is converted from a format that keeps track of transformation formulas (.xlsx) to one that does not (.csv). One way to alleviate these issues is by doing data transformations programmatically. With a script that performs transformations a record of how the transformation was done is always present. In R there is a collection of packages designed to perform data manipulation and visualization tasks which fall under the umbrella of the "tidyverse" [@wickham2019WelcomeTidyverse]. However, these problems with version control are not restricted to data, the analysis scripts themselves can have different versions that we may need to go through. Rather than naming files idiosyncratically we can make use of version control systems to keep tracking of changes in our entire project directory.

## Keeping track of analysis steps

### Version control

As we saw in my awful data directory keeping tracking of different versions of file in our project is something we want to do but can be difficult to employ. An individual working on a project will produce several versions of different files and when they are sent off to collaborators even more alternative version of these files can be produced. To combat these issues we can make use of version control systems to manage continuously changing files within a directory. The most popular software used to do this is called *Git* [@blischak2016QuickIntroductionVersion]. With *Git* it becomes possible to take snapshots of your entire project directory. GitHub is a XYZ that allows one to store Git repositories online.

GitHub works by XYZ that is ABC with an action called a commit. Each time you commit a change you essential take a picture of the state of your entire repository. When committing changes you have to accompany the commit with a commit message. You will be tempted as a project goes on to have short uninformative commit messages such as "changes to file X". Resist this urge. Try to make commit messages as informative as possible it will aid tremendously if you have to go back through your commits to investigate a particular change.

### Metadata

It is good practice for each of your projects to create what is known as a README file and store this alongside your project code and data. Inside a README I tend to have a summary of the project, an explanation of the directory structure, descriptions of the variables in the data set, and the R packages and package versions I used to conduct the analysis.

------------------------------------------------------------------------

## References
