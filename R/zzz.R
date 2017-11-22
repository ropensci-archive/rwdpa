wdpa_base <- function() "https://www.protectedplanet.net"
wdpa_api <- function() "https://api.protectedplanet.net"

wdpaGET2 <- function(path, args, ...) {
  conn <- crul::HttpClient$new(url = wdpa_api(), opts = list(...))
  x <- conn$get(path, query = args)
  x$raise_for_status()
  x$parse("UTF-8")
}

wdpaGET <- function(id, args, overwrite, ...) {
  url <- file.path(wdpa_base(), "downloads",
    paste0("WDPA_Nov", format(Sys.Date(), "%Y")))
  if (!is.null(id)) url <- paste0(url, "_protected_area_", id)

  pathx <- file.path(rw_cache$cache_path_get(),
    paste0(basename(url), "-", args$type, ".zip"))
  pathcc <- file.path(
    rw_cache$cache_path_get(),
    paste0(basename(url), "-", args$type),
    switch(args$type,
      csv = paste0(basename(url), "-csv.csv"),
      shapefile = paste0(basename(url), "-shapefile-"),
      kml = paste0(basename(url), "-kml.kml")
    )
  )

  if ( any(vapply(rw_cache$list(), function(z) grepl(pathcc, z), TRUE)) ) {
    message("in cache already")
    if (args$type == "shapefile") {
      pathcc <- list.files(dirname(pathcc), pattern=".shp", full.names=TRUE)
    }
    return(pathcc)
  } else {
    rw_cache$mkdir()
    conn <- crul::HttpClient$new(url = url, opts = list(followlocation = TRUE, ...))
    x <- conn$get(query = args, disk = pathx)
    x$raise_for_status()
    zpath <- x$content
    utils::unzip(zpath, exdir = sub(".zip", "", zpath))
    pathc <- list.files(sub(".zip", "", zpath),
      pattern = switch(args$type, csv = "-csv", shapefile = ".shp", kml = "-kml"),
      full.names = TRUE
    )
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

check_key <- function (x) {
  tmp <- if (is.null(x)) Sys.getenv("WDPA_KEY", "") else x
  if (tmp == "") {
    getOption("wdpa_key", stop("need an API key for the WDPA API"))
  } else {
    tmp
  }
}
