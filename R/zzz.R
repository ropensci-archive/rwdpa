wdpa_base <- function() "http://www.protectedplanet.net"

wdpaGET2 <- function(url, args, ...) {
  x <- GET(url, query = args, ...)
  stop_for_status(x)
  content(x, "text")
}

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

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

cpt <- function(l) Filter(Negate(is.null), l)
