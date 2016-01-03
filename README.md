rwdpa
=====



[![Build Status](https://travis-ci.org/ropenscilabs/rwdpa.svg)](https://travis-ci.org/ropenscilabs/rwdpa)

`rwdpa` - World Database of Protected Areas

## Install

CRAN stable version


```r
install.packages("rwdpa")
```

Development version from Github


```r
install.packages("devtools")
devtools::install_github("ropenscilabs/rwdpa")
```


```r
library("rwdpa")
```

## Search for protected areas

By site id


```r
res <- wdpa_meta_sites(id = 40597)
res$official[1:5]
#> $WDPAID
#> [1] 40597
#> 
#> $COUNTRY
#> [1] "UGA"
#> 
#> $SUB_LOC
#> [1] "Not Reported"
#> 
#> $NAME
#> [1] "Lopeichubei"
#> 
#> $ORIG_NAME
#> [1] "Lopeichubei"
```

By lat/long


```r
res <- wdpa_meta_sites(lat = 51, long = 2.5)
head(res$official[,2:5])
#>   WDPA_PID     GOV_TYPE             MANG_AUTH       INT_CRIT
#> 1       NA Not Reported Local law enforcement Not Applicable
#> 2       NA Not Reported       Natural England           <NA>
#> 3       NA Not Reported          Not Reported   Not Reported
#> 4       NA Not Reported          Not Reported   Not Reported
#> 5       NA Not Reported          Not Reported   Not Reported
#> 6       NA Not Reported          Not Reported   Not Reported
```

## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
