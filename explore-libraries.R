#Version Control with Git/GitHub
#Updated 2020-01-27


## how jenny might do this in a first exploration
## purposely leaving a few things to change later!

#' Which libraries does R search for packages?
.libPaths()

## let's confirm the second element is, in fact, the default library
.Library
identical(.Library, .libPaths()[2])

## Huh? Maybe this is an symbolic link issue?
library(fs)
identical(path_real(.Library), path_real(.libPaths()[2]))

#' Installed packages
library(tidyverse)
ipt <- installed.packages() %>%
  as_tibble()

## how many packages?
nrow(ipt)

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
ipt %>%
  count(LibPath, Priority)

##   * what proportion need compilation?
ipt %>%
  count(NeedsCompilation) %>%
  mutate(prop = n / sum(n))

##   * how break down re: version of R they were built on
ipt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))
