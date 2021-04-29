# Linguistic Markers

![R](https://img.shields.io/badge/R-4.0.x-blue)
![MIT license](https://img.shields.io/badge/License-MIT-green.svg)

Linguistic markers are frequently used in a variety of acedemic papers.
They tend to be lists of words that have known meening in _some_ context.
**WARNING**: It is not a good idea to use markers out of context.
Make sure you look at the origional paper to figure out if you are using a context that is reasonably close.

This project aims to
* Create a `R` package facilitating the calculation of markers
* Create a series of vignettes describing the setup and use if the markers in `R`

# Marker Lists

Below is a list of all the markers I have found so far.
When you use them, make sure to cite them.
The top of the vignette will have the [BibTxT](http://www.bibtex.org/) citation.

* [x] [Natural Emotion](https://doi.org/10.1038/s41467-020-18349-0)
* [ ] [LIWC](https://liwc.wpengine.com/)
* [ ] [Metadiscourse](https://doi.org/10.1016/j.jslw.2004.02.001)
* [ ] [General Inquirer](https://doi.org/10.1145/1461551.1461583)

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
