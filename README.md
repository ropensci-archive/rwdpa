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
head(res$official[,-1])
#>   WDPA_PID     GOV_TYPE             MANG_AUTH       INT_CRIT    MANG_PLAN
#> 1       NA Not Reported Local law enforcement Not Applicable Not Reported
#> 2       NA Not Reported       Natural England           <NA>         <NA>
#> 3       NA Not Reported          Not Reported   Not Reported Not Reported
#> 4       NA Not Reported          Not Reported   Not Reported Not Reported
#> 5       NA Not Reported          Not Reported   Not Reported Not Reported
#> 6       NA Not Reported          Not Reported   Not Reported Not Reported
#>   ObjectID OFFICIAL    WDPAID COUNTRY      SUB_LOC
#> 1   323971     TRUE 555512145     NLD       Marine
#> 2   323887     TRUE 555512102     GBR Not Reported
#> 3   296663     TRUE    901218     NLD        NL-NB
#> 4   296661     TRUE    900899     NLD        NL-ZH
#> 5   296659     TRUE    900898     NLD Not Reported
#> 6   296657     TRUE    900896     NLD        NL-ZE
#>                         NAME                  ORIG_NAME
#> 1                   Predelta                  Voordelta
#> 2 Thames Estuary and Marshes Thames Estuary and Marshes
#> 3                Grevelingen                Grevelingen
#> 4               Voornes Duin               Voornes Duin
#> 5                  Voordelta                  Voordelta
#> 6                Veerse Meer                Veerse Meer
#>                                              DESIG
#> 1                         Bodem Beschermingsgebied
#> 2                    Special Protection Area (SPA)
#> 3 Ramsar Site, Wetland of International Importance
#> 4 Ramsar Site, Wetland of International Importance
#> 5 Ramsar Site, Wetland of International Importance
#> 6 Ramsar Site, Wetland of International Importance
#>                                          DESIG_ENG    DESIG_TYPE
#> 1                         Seafloor Protection Area      National
#> 2                    Special Protection Area (SPA)      National
#> 3 Ramsar Site, Wetland of International Importance International
#> 4 Ramsar Site, Wetland of International Importance International
#> 5 Ramsar Site, Wetland of International Importance International
#> 6 Ramsar Site, Wetland of International Importance International
#>         IUCN_CAT MARINE REP_M_AREA      NO_TAKE NO_TK_AREA REP_AREA
#> 1   Not Reported   TRUE     298.36 Not Reported          0  298.360
#> 2   Not Reported   TRUE         NA         <NA>         NA   48.389
#> 3 Not Applicable   TRUE         NA Not Reported          0  139.000
#> 4 Not Applicable   TRUE         NA Not Reported          0   15.000
#> 5 Not Applicable   TRUE         NA Not Reported          0  900.000
#> 6 Not Applicable   TRUE         NA Not Reported          0   25.750
#>       STATUS STATUS_YR
#> 1 Designated      2008
#> 2 Designated      2000
#> 3 Designated      2000
#> 4 Designated      2000
#> 5 Designated      2000
#> 6 Designated      2000
```

## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
