#' Get WDPA metadata
#'
#' @export
#' @param id (integer) Site id
#' @param lat (integer) latitude
#' @param long (integer) longitude
#' @param type (character) one of 'official' or 'public'. Default: both returned
#' @param page (integer) page to return, Default: 1
#' @param ... Further named parameters passed on to [crul::HttpClient]
#' @details This function uses the Protected Planet API
#' @references \url{http://www.protectedplanet.net/api2/sites}
#' @examples \dontrun{
#' wdpa_meta_sites(id = 40597)
#' wdpa_meta_sites(lat = 51, long = 2.5)
#' wdpa_meta_sites(page = 2)
#' wdpa_meta_sites(type = 'official')
#' wdpa_meta_sites(type = 'public')
#' }
wdpa_meta_sites <- function(id = NULL, lat = NULL, long = NULL, type = NULL,
                            page = NULL, ...) {

  url <- file.path(wdpa_base(), "api2/sites")
  if (!is.null(id)) {
    url <- file.path(url, id)
  } else if (!is.null(lat) && !is.null(long)) {
    url <- file.path(url, 'search_by_point', lat, long)
  }
  args <- cpt(list(type = type, page = page))
  xx <- wdpaGET2(url, args, ...)
  jsonlite::fromJSON(xx)
}
