#' World Database of Protected Areas
#'
#' @section WDPA Web API:
#'
#' - API Docs: <https://api.protectedplanet.net/>
#' - Get an API key at <https://api.protectedplanet.net/request>
#'
#' @section Package API:
#'
#' - [rw_cache()] - manage bulk cached files
#' - [wdpa_api_countries()] - API, countries
#' - [wdpa_api_pa_search()] - API, search protected areas
#' - [wdpa_api_pa()] - API, protected areas
#' - [wdpa_fetch()] - fetch a file
#'
#' @import sf readr
#' @importFrom crul HttpClient
#' @importFrom jsonlite fromJSON
#' @importFrom hoardr hoard
#' @name rwdpa-package
#' @aliases rwdpa
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus+r@@gmail.com}
#' @keywords package
NULL
