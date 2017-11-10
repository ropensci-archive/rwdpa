rwdpa
=====



[![Build Status](https://travis-ci.org/ropenscilabs/rwdpa.svg)](https://travis-ci.org/ropenscilabs/rwdpa)

`rwdpa` - World Database of Protected Areas

## Install

Development version from Github


```r
devtools::install_github("ateucher/rmapshaper")
devtools::install_github("ropenscilabs/rwdpa")
```


```r
library("rwdpa")
```

## Fetch files

by ID


```r
wdpa_fetch(id = 76200, type = "csv")
#> # A tibble: 1 x 29
#>      TYPE WDPAID WDPA_PID PA_DEF            NAME       ORIG_NAME
#>     <chr>  <int>    <int>  <int>           <chr>           <chr>
#> 1 Polygon  76200    76200      1 Oregon Badlands Oregon Badlands
#> # ... with 23 more variables: DESIG <chr>, DESIG_ENG <chr>,
#> #   DESIG_TYPE <chr>, IUCN_CAT <chr>, INT_CRIT <chr>, MARINE <int>,
#> #   REP_M_AREA <int>, GIS_M_AREA <int>, REP_AREA <dbl>, GIS_AREA <dbl>,
#> #   NO_TAKE <chr>, NO_TK_AREA <int>, STATUS <chr>, STATUS_YR <int>,
#> #   GOV_TYPE <chr>, OWN_TYPE <chr>, MANG_AUTH <chr>, MANG_PLAN <chr>,
#> #   VERIF <chr>, METADATAID <int>, SUB_LOC <chr>, PARENT_ISO3 <chr>,
#> #   ISO3 <chr>
```


## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
