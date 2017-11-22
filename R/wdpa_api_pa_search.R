#' WDPA API: protected areas search
#'
#' @export
#' @param marine (logical) If `TRUE` returns all marine protected areas,
#' paginated. If `FALSE` (default) returns all terrestrial protected areas,
#' paginated.
#' @param country (character) If set, returns all protected areas from the
#' country with the given ISO3, paginated. By default, this is unset:
#' protected areas from all countries are returned.
#' @param designation (integer) If set, returns all protected areas designated
#' with the given `id`, paginated. By default, this is unset: protected areas
#' with all designations are returned.
#' @param jurisdiction (integer) If set, returns all protected areas with the
#' given jurisdiciton `id`, paginated. By default, this is unset: protected
#' areas with all jurisdictions are returned.
#' @param governance (integer) If set, returns all protected areas with the
#' given governance `id`, paginated. By default, this is unset: protected
#' areas with all governances are returned.
#' @param iucn_category (integer) If set, returns all protected areas with the
#' given IUCN category `id`, paginated. By default, this is unset: protected
#' areas with all IUCN categories are returned.
#' @param geojson (logical) If `TRUE` returns the GeoJSON representation
#' of the geometry of the protected areas. Default: `FALSE`
#' @param page (integer) Controls the returned page. Default: 1
#' @param per_page (integer) Controls how many protected areas are returned per
#' page. Default: 25. For performance reasons, the maximum value is 50.
#' @param token (character) token. see [rwdpa] for help on tokens
#' @param ... curl options passed on to [crul::HttpClient]
#' @details This function uses the Protected Planet API
#' @references <https://api.protectedplanet.net/documentation>
#' @return a data.frame
#' @examples \dontrun{
#' wdpa_api_pa_search()
#' wdpa_api_pa_search(per_page = 3)
#' wdpa_api_pa_search(country = "BEL")
#' wdpa_api_pa_search(iucn_category = 3)
#' }
wdpa_api_pa_search <- function(marine = FALSE, country = NULL,
  designation = NULL, jurisdiciton = NULL, governance = NULL,
  iucn_category = NULL, geojson = FALSE, page = 1,
  per_page = 25, token = NULL, ...) {

  path <- "v3/protected_areas/search"
  args <- cpt(list(marine = marine, country = country,
    designation = designation, jurisdiciton = jurisdiciton,
    governance = governance, iucn_category = iucn_category,
    with_geometry = tolower(geojson), page = page,
    per_page = per_page, token = check_key(token)))
  xx <- wdpaGET2(path, args, ...)
  jsonlite::fromJSON(xx)$protected_areas
}
