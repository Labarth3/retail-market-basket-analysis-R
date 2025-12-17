# Install renv once
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")

# Initialize renv (first time only)
# renv::init()

# Install dependencies (will be recorded in renv.lock)
renv::install(c(
  "arules",
  "arulesViz",
  "tidyverse",
  "janitor",
  "skimr",
  "rmarkdown",
  "knitr"
))

renv::snapshot()
