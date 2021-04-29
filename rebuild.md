The following guides you through the full (re)build process.

```{r}
# load packages
pkgs <- installed.packages()
if (!('devtools' %in% pkgs)) { install.packages('devtools') }
if (!('roxygen2' %in% pkgs)) { install.packages('roxygen2') }
if (!('pkgdown' %in% pkgs)) { install.packages('pkgdown') }
if ('LinguisticMarkers' %in% pkgs) { remove.packages('LinguisticMarkers') }

# set working directory and clean files that will be regenerated
setwd("D:/repos/markanewman/LinguisticMarkers")
unlink(c('./man', './inst/doc', './NAMESPACE'), recursive = T)

# pre-build checks
devtools::check(manual = T, vignettes = T)
detach('package:LinguisticMarkers', unload = T)
unlink(c('./man', './NAMESPACE'), recursive = T)

# make docs
devtools::document()
devtools::build_vignettes()
dir.create('./inst/doc', showWarnings = F, recursive = T)
files <- list.files('./doc', pattern = 'html')
lapply(files, function(x) { file.rename(paste0('./doc/', x), paste0('./inst/doc/', x)) } )
unlink(c('./doc', './Meta', './.Rbuildignore'), recursive = T)
detach('package:LinguisticMarkers', unload = T)

# test the instalability
devtools::install_local(upgrade = 'never')
remove.packages('LinguisticMarkers')

# recompile the test data and run the tests
#testthat::source_dir('./data-raw')
#devtools::test()
```
