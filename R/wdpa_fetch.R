#' Fetch WDPA shp file
#'
#' @export
#' @param id (numeric/integer) a WDPA site ID. if not given, we get all
#' the data
#' @param type (character) type of file, one of shapefile (default),
#' kml, or csv
#' @param overwrite (logical) Overwrite if exists. Default: `TRUE`
#' @param ... Further named parameters passed on to [crul::HttpClient]
#'
#' @details If  you don't have the metadata file, we download it for you
#' and read it in. After that we jus read the cached version. If for some
#' reason that file is deleted, we'll detect it and download again.
#'
#' The path file written to is managed via `rw_cache`. See [rw_cache].
#'
#' Uses [readr::read_csv] for csv and [sf::read_sf] for shp and kml internally
#'
#' @return varies depending on value of `type` parameter
#'
#' @examples \dontrun{
#' # a single site
#' wdpa_fetch(id = 76200, type = "csv")
#' wdpa_fetch(id = 76200, "shapefile")
#' wdpa_fetch(id = 76200, "kml")
#'
#' # another id
#' wdpa_fetch(id = 2137, type = "csv")
#' wdpa_fetch(id = 2137, "shapefile")
#' wdpa_fetch(id = 2137, "kml")
#'
#' # entire dataset, beware, very large
#' # wdpa_fetch()
#' }
wdpa_fetch <- function(id = NULL, type = "csv", overwrite = TRUE, ...) {
  xx <- wdpaGET(id, args = list(type = type), overwrite, ...)
  switch(
  	type,
  	`csv` = readr::read_csv(xx),
		`shapefile` = sf::read_sf(xx),
  	`kml` = sf::read_sf(xx)
  )
}
