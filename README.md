rwdpa
=====



[![Build Status](https://travis-ci.org/ropenscilabs/rwdpa.svg)](https://travis-ci.org/ropenscilabs/rwdpa)

`rwdpa` - World Database of Protected Areas (WDPA)

WPDA is hosted at <https://www.protectedplanet.net/>

API:

* API Docs: <https://api.protectedplanet.net/>
* Get an API key at <https://api.protectedplanet.net/request>

Package API:


```
#>  - rw_cache
#>  - wdpa_api_countries
#>  - wdpa_api_pa_search
#>  - wdpa_api_pa
#>  - wdpa_fetch
```

## Install

Development version from Github


```r
devtools::install_github("ropenscilabs/rwdpa")
```


```r
library("rwdpa")
```

## Fetch files by ID

Default is file type `csv`


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

But you can also get `shapefile` or `kml`


## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/rwdpa/issues).
* License: MIT
* Get citation information for `rwdpa` in R doing `citation(package = 'rwdpa')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
