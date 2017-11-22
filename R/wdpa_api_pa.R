#' WDPA API: protected areas
#'
#' @export
#' @param wdpa_id (character) WDPA protected area ID
#' @param geojson (logical) If `TRUE` returns the GeoJSON representation of the
#' geometry of the protected areas. Default: `FALSE`
#' @param page (integer) page to retrieve. Default: 1
#' @param per_page (character) results to retrieve per page. Default: 25
#' @param token (character) token. see [rwdpa] for help on tokens
#' @param ... curl options passed on to [crul::HttpClient]
#' @details This function uses the Protected Planet API
#' @references <https://api.protectedplanet.net/documentation>
#' @examples \dontrun{
#' wdpa_api_pa(per_page = 1)
#' (x <- wdpa_api_pa(per_page = 1, geojson = TRUE))
#' x$geojson
#' wdpa_api_pa(per_page = 3, page = 2)
#' wdpa_api_pa(wdpa_id = 322152)
#' (x <- wdpa_api_pa(wdpa_id = 322152, geojson = TRUE))
#' x$geojson
#' }
wdpa_api_pa <- function(wdpa_id = NULL, geojson = FALSE, page = 1,
  per_page = 25, token = NULL, ...) {

  if (!is.null(wdpa_id)) {
    path <- file.path("v3/protected_areas", wdpa_id)
    args <- cpt(list(with_geometry = tolower(geojson)))
  } else {
    path <- "v3/protected_areas"
    args <- cpt(list(with_geometry = tolower(geojson), page = page,
      per_page = per_page))
  }
  args$token <- check_key(token)
  xx <- wdpaGET2(path, args, ...)
  if (is.null(wdpa_id)) {
    jsonlite::fromJSON(xx)$protected_areas
  } else {
    jsonlite::fromJSON(xx)$protected_area
  }
}
