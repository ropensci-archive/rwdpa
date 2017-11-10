#' @title Caching
#'
#' @description Manage cached `rwdpa` files with \pkg{hoardr}
#'
#' @export
#' @name rw_cache
#'
#' @details The dafault cache directory is
#' `paste0(rappdirs::user_cache_dir(), "/R/rwdpa")`, but you can set
#' your own path using `cache_path_set()`
#'
#' `cache_delete` only accepts 1 file name, while
#' `cache_delete_all` doesn't accept any names, but deletes all files.
#' For deleting many specific files, use `cache_delete` in a [lapply()]
#' type call
#'
#' @section Useful user functions:
#' \itemize{
#'  \item `rw_cache$cache_path_get()` get cache path
#'  \item `rw_cache$cache_path_set()` set cache path
#'  \item `rw_cache$list()` returns a character vector of full
#'  path file names
#'  \item `rw_cache$files()` returns file objects with metadata
#'  \item `rw_cache$details()` returns files with details
#'  \item `rw_cache$delete()` delete specific files
#'  \item `rw_cache$delete_all()` delete all files, returns nothing
#' }
#'
#' @examples \dontrun{
#' rw_cache
#'
#' # list files in cache
#' rw_cache$list()
#'
#' # delete certain database files
#' # rw_cache$delete("file path")
#' # rw_cache$list()
#'
#' # delete all files in cache
#' # rw_cache$delete_all()
#' # rw_cache$list()
#'
#' # set a different cache path from the default
#' }
NULL
