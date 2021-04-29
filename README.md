# Linguistic Markers

![R](https://img.shields.io/badge/R-4.0.x-blue)
![MIT license](https://img.shields.io/badge/License-MIT-green.svg)

Linguistic markers are frequently used in a variety of academic papers.
They tend to be lists of words that have known meaning in _some_ context.
**WARNING**: It is not a good idea to use markers out of context.
Make sure you look at the original paper to figure out if you are using a context that is reasonably close.

This project aims to
* Create a `R` package facilitating the calculation of markers
* Create a series of vignettes describing the setup and use if the markers in `R`

# Installation

* Current version (from CRAN)

None yet.

* Latest development version from GitHub

```{r}
pkgs <- installed.packages()
if (!('devtools' %in% pkgs)) { install.packages('devtools') }
if ('LinguisticMarkers' %in% pkgs) { remove.packages('LinguisticMarkers') }

devtools::install_github(repo = 'markanewman/LinguisticMarkers', upgrade = 'never')
```
