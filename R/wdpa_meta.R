#' Fetch WDPA metadata
#'
#' @export
#' @param path Base path to store file at. Default: \code{~/.rwdpa}
#' @param overwrite Overwrite if exists. Default: \code{TRUE}
#' @details If  you don't have the metadata file, we download it for you
#' and read it in. After that we jus read the cached version. If for some
#' reason that file is deleted, we'll detect it and download again.
#' @examples \dontrun{
#' wdpa_meta()
#' }
wdpa_meta <- function(path = "~/.rwdpa", overwrite = TRUE) {
  xx <- wdpaGET(url = file.path(wdpa_base(), "WDPA_Nov2015"),
            args = list(type = 'csv'), path, overwrite)
  readr::read_csv(xx)
}

wdpa_base <- function() "http://www.protectedplanet.net/downloads"

wdpaGET <- function(url, args, path, overwrite) {
  pathx <- file.path(path, "WDPA_Nov2015.zip")
  pathcc <- file.path(path, "WDPA_Nov2015/WDPA_Nov2015-csv.csv")
  if (file.exists(pathcc)) {
    return(pathcc)
  } else {
    if (!file.exists(pathx)) {
      dir.create(path, recursive = TRUE, showWarnings = FALSE)
    }
    x <- GET(url, query = args, config(followlocation = TRUE),
             write_disk(pathx, overwrite))
    stop_for_status(x)
    zpath <- x$request$output$path
    unzip(zpath, exdir = sub(".zip", "", zpath))
    pathc <- list.files(sub(".zip", "", zpath), pattern = ".csv", full.names = TRUE)
    unlink(zpath)
    return(pathc)
  }
}
