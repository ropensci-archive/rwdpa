#' Fetch WDPA shp file
#'
#' @export
#' @param path Base path to store file at. Default: \code{~/.rwdpa}
#' @param overwrite Overwrite if exists. Default: \code{TRUE}
#' @details If  you don't have the metadata file, we download it for you
#' and read it in. After that we jus read the cached version. If for some
#' reason that file is deleted, we'll detect it and download again.
#' @examples \dontrun{
#' wdpa_fetch()
#' }
wdpa_fetch <- function(path = "~/.rwdpa", overwrite = TRUE) {
  xx <- wdpaGET(url = file.path(wdpa_base(), "WDPA_Nov2015"),
                args = list(type = 'csv'), path, overwrite)
  readr::read_csv(xx)
}
