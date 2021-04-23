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

In research you will often find yourself handling several data, analysis code, manuscript, and figure files which can go through many intermediary stages based upon decisions you make during your project analysis. Not properly documenting changes across all these files and the decisions that underly these changes can lead to difficulties in re-tracing our steps. If analysis pipelines are not accurately documented then even the person who performed the analysis can have a difficult time reproducing it [@perkel2020]. This then cascades into difficulties for others to retrace our steps [@ioannidis2009RepeatabilityPublishedMicroarray]. Moreover, in programming languages with large communities, such as R, many of these steps can be mediated by community built libraries/packages which are suites of functions that perform specific tasks [@wickham2019WelcomeTidyverse; @bates2014FittingLinearMixedEffects]. Given the many software dependencies modern analyses typically rely on, the metadata concerning the software and software versions used can be just as crucial in reproducing an analysis as the code itself. Keeping track of data and software versions are therefore crucial steps in reproducing analyses for yourself and others. Fortunately, documenting each step of an analysis pipeline has never been easier as a result of documentation tools such as Rmarkdown and version control software such as *Git* and GitHub. Documenting key facts about an analysis such as what steps were run to transform data, perform the analyses, and create the figures make it easier to work on, share, and re-visit your project analyses.

Here I explain how to create tidy version controlled directories for projects which allow one to share analysis steps and keep track of changes made in the process of performing an analysis.

## Project Directories

To keep projects clear and organized it is good to separate components of a project that have a shared theme within their own directories. I tend to like the following project structure for my work:

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

The above is called a directory tree and is used to represent a directory structure in plain text. The `.` represents the root directory (sometimes called the main directory) which is the directory you see when you first open the project directory and a `/` indicates something inside a directory. Therefore everything inside just `./` is in the root directory. In the root directory I have `LICENSE.md` which contains the software license for your project. It basically dictates who can do what with your code. You can explore different licensing options at <https://choosealicense.com/>. Personally, I generally always license the code in my projects under an MIT license which lets people do anything they want with your software but you may opt for something else. For your figures and text you may consider using a [Creative Commons Attribution (CC-BY) license](http://creativecommons.org/licenses/by/4.0/). `README.md` contains information about the contents of the directory and the project. I also place my `.Rproj` file (here named `my-analysis-project.Rproj`) in the root directory. An R project file makes it easier to keep R scripts from different projects separate from each other. Finally, I also keep the Rmarkdown file, `analysis.Rmd` which contains the full analysis code and documentation explaining the code in the root directory.

Another `/` indicates a subdirectory. In the subdirectories I have:

-   `R/` which contains custom R functions relevant for the analysis

-   `data/` which contains the raw data used in the analysis

-   `docs/` which contains the documentation for the analysis

-   `figs/` which contains the figures generated from the code in the analysis script

The `docs/` and `figs/` directory are always populated with outputs produced in the `analysis.Rmd` script.

## Using R

For this guide I am going to assume you are familiar with R but I will give a brief overview of R here regardless. R is a programming language which is specialised for data manipulation and analysis. With R one can write scripts that executes commands for tidying, manipulating, modeling, and visualising data. This means all commands that lead to your final results can be recorded within the script that produces your analysis providing a record of the steps you took.

R is a functional programming language. Almost everything you do in R is done by calling functions. Typically you call functions on variables which have been assigned values. A simple example is below.

``` {.r}
# Assigning value to variable 
variable_a <- 3
variable_b <- 7

# Calling the sum function on my variables
sum(variable_a, variable_b)

# Storing the output of a function in a variable
variable_sum <- sum(variable_a, variable_b)
```

In the above code chunk I am assigning `variable_a` and `variable_b` the values 3 and 7 respectively. I then call the `sum()` function which, as the name suggests, sums the values that the two variables have been assigned. Functions produce outputs which themselves can be stored in variables. This is done by assigning the function call to the variable `variable_sum`. Without assigning a function call to a variable, an output may be produced in the console but not stored anywhere in your script for you to do more tasks with.

### Good practices for writing code

Good code should be simple, readable, and modular. Keeping a consistent style helps in making your code readable. I myself try to conform to the [tidyverse style guidelines](https://style.tidyverse.org/) when writing R code. To keep your code readable try to have clear, precise, and meaningful variable and function names. A simple example is below.

``` {.r}
# Reading in data 
full_data <- read.csv("path/to/your-data.csv")

# Extracting male only data
male_data <- filter(full_data, sex == "M")
```

This block of code reads in our full data set and stores into a variable called `full_data`. This data is then subset by sex using the `filter()` function so that only data for the males is extracted from the full data set. We store this in the variable `male_data`.

#### Comment your code

I also add comments using `#` and then explaining what I intend for the following line to do. Always comment your code. I like to comment even things that are easily readable (*e.g.*, `read.csv()` obviously reads in the data if you know what it does) because non-R users may also want to read your code. Commenting code is good practice because it is tempting to think that you will remember why code was written in a particular way or for what purpose. This is a lie. You will forget. I promise. Well commented code makes it easier for you and others to quickly gleam what the code snippets in a script are meant to do and how they work.

#### Make it modular

Since R scripts are essentially a series of function calls you should try to keep any custom functions you make in a file separate from your main analysis script and only source them when needed in your main analysis script. This is describes making code modular *i.e.,* code is broken up into distinct components that are called at different points of the analysis script. This is useful for snippets of code that you repeatedly used throughout a script. Rather than copy and pasting certain steps that are performed multiple times, which is liable to copy-paste errors, writing a function that contains those steps and then calling that function when needed makes debugging easier. For example, if at some point you realize your code of interest is producing unexpected behaviour, rather than inspect all instances where you have copy and pasted code the performs task X you can simply inspect the function, fix it there, and the changes will carryover to the entire script.

## Rmarkdown for generating integrated project directories

Rmarkdown is a free R package that provides a documentation format for data science. In an Rmarkdown file you can write executable documents that incorporates runnable code chunks and plain text outside the code chunks. This allows you to create a map of your project, making it easier for future you or others who are interested in your project to see exactly what code you ran to get the results and figures you did and why you ran particular models by allowing you to write documentation along side code. Thus, the inputs (data, R functions), outputs (figures, model results), code, and documentation for an analysis are integrated into one file whose changes can be tracked using *Git*. Notably an Rmarkdown file is a plain text file format that can be rendered into several different file formats using the `render()` function on an Rmd file. Moreover, plots generated within an Rmd script can be saved to external directories such as a `fig/` directory by specifying a line to do so within the Rmd script.

![](images/directory-rendering.svg)

The rendered html files can have additional formatting and integrate the figures generated by the analysis to make understanding the analyses conducted easier. These files can be opened in a user's browser. Moreover, integrating Rmarkdown outputs with GitHub Pages allows one to host reader-friendly sites for your projects online. With GitHub pages a website can be generated from a directory of HTML files. This requires a file called `index.html` to be present in the directory the site is built from which can also be made using Rmarkdown.

## Keeping track of analysis steps

### Before data are collected

There are steps that can be taken before data is even collected to make for a better documented project. Often experimental subjects are split into experimental treatments. You can start your `analysis.Rmd` script by programmatically assigning individuals to different treatment based on the criteria your experiment depends upon [@coppock2019RandomizrEasytoUseTools]. This can help in making you think early on explicitly about your experimental design and serve as a record of your design decisions.

Once individuals are assigned to treatments and data is being collected it is important to consider collecting the finest level of data possible. For example, if you wanted to determine whether fish weigh more than 10 grams, rather than record each fish as True (above 10 grams) or False (below 10 grams), recording the actual weight will provide more information in addition to allowing you to transform the data later. An example more common in animal behaviour is documenting the position of an animal through time. If the position of an animal is only sampled every minute rather than every second you may be losing additional useful data. However, these decisions must be made in the context in your experiment. If it is substantially more difficult to get fine grain data but coarse grain data will do then coarse grain data may be sufficient. Transformations to a coarser level of analysis can always be done but it is not possible to go from a coarse level of analysis to a fine level of analysis if only the coarse data are collected.

### Woes with data transformations

Performing transformations of the raw data into meaningful variables is often needed in the course of an analysis. Spreadsheet software (*e.g.,* Microsoft Excel) is often used to do these transformations manually and then save these changes into separate files. The idiosyncrasies and lack of a record of what was done and how when using spreadsheet based software can lead to difficulties in retracing one's steps or to outright errors [@ziemann2016GeneNameErrors]. Additionally, many researchers, including me, can tell you from experience that this is a bad practice. In my case, before I switched to programmatically creating new data files I would end up with directories with file names such as `data_new.csv`, `data_na_removed1.xlsx`, or `data_final_subset_realv3.csv` which were constructed by manually constructing new sheets with Excel---this is a terrible way to do this (Figure 1).

![Figure 1: The Lovecraftian horror that was my early data directories.](images/directory-horror.png){#figure-horror style="display: block;   margin-left: auto;   margin-right: auto;" width="400"}

In this case it is easy to lose track of how these files changed. This becomes even more difficult if it is converted from a format that keeps track of transformation formulas (.xlsx) to one that does not (.csv). One way to alleviate these issues is by doing data transformations programmatically. With a script that performs transformations a record of how the transformation was done is always present so that you always know how to get from the raw data to the cleaned data set. In R there is a collection of packages designed to perform such data manipulation and visualization tasks which fall under the umbrella of the "tidyverse" [@wickham2019WelcomeTidyverse]. However, since the code files which produce the cleaned data themselves have the potential to go through multiple versions, the problems with version control are not restricted to the data files. So rather than naming files idiosyncratically we can make use of version control systems to keep tracking of changes in our entire project directory.

### Implementing version control

As we saw in my awful data directory keeping tracking of different versions of file in our project is something we want to do but can be difficult to employ. An individual working on a project will produce several versions of different files and when they are sent off to collaborators even more alternative version of these files can be produced. To combat these issues we can make use of version control systems to manage continuously changing files within a directory. The most popular software used to do this is called *Git* [@blischak2016QuickIntroductionVersion]. With *Git* it becomes possible to take snapshots of your entire project directory. GitHub is a service provided by Microsoft that allows one to store *Git* repositories online. These tools allow us to maintain a record of file changes over time with each version being fully accessible should they need to be recalled in the future.

GitHub works by tracking changes that are made on your local *Git* directory with an action called a commit. Each time you commit a change you essential take a picture of the state of your entire repository. When committing changes you have to accompany the commit with a commit message. You will be tempted as a project goes on to have short uninformative commit messages such as "changes to file X". Resist this urge. Try to make commit messages as informative as possible it will aid tremendously if you have to go back through your commits to investigate a particular change.

### Metadata documentation

It is good practice for each of your projects to create what is known as a README file and store this alongside your project code and data. After reading a README file it should be clear to a stranger what your project's purpose is, how it is structured, and how to interpret it. Inside a README I tend to have a summary of the project, an explanation of the directory structure, descriptions of the variables in the data set, and the R packages and package versions I used to conduct the analysis. A useful tool for documenting the packages used in an analysis is the [reports](https://easystats.github.io/report/) package [@makowski2021AutomatedResultsReporting]. It allows you to report the name, version, and citation of the packages that you call in your script with the `library()` function and also reports the version of R you are using.

------------------------------------------------------------------------

## References
