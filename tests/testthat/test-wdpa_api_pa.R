context("wdpa_api_pa")

test_that("wdpa_api_pa works as expected", {
  skip_on_cran()

  aa <- wdpa_api_pa(per_page = 1)

  expect_is(aa, 'data.frame')
  expect_type(aa$name, 'character')
  expect_type(aa$id, 'integer')
  expect_is(aa$countries, 'list')
  expect_is(aa$countries[[1]], 'data.frame')
  expect_false("geojson" %in% names(aa))

  ## if geojson = TRUE
  bb <- wdpa_api_pa(per_page = 1, geojson = TRUE)

  expect_is(bb, 'data.frame')
  expect_true("geojson" %in% names(bb))
})

test_that("wdpa_api_pa fails well", {
  skip_on_cran()

  expect_error(wdpa_api_pa("adf"), "wdpa_id must be of class integer, numeric")
  expect_error(wdpa_api_pa(geojson = 5),
               "geojson must be of class logical")
  expect_error(wdpa_api_pa(per_page = "fa"),
               "per_page must be of class integer, numeric")
})


context("wdpa_api_pa_")
test_that("under the hood fxn wdpa_api_pa_ works as expected", {
  skip_on_cran()

  aa <- wdpa_api_pa_(per_page = 1)

  expect_is(aa, 'HttpResponse')
  expect_is(aa$method, 'character')
  expect_equal(aa$method, 'get')
  expect_match(aa$url, 'v3/protected_areas')
  expect_equal(aa$status_code, 200)
  expect_is(aa$content, 'raw')
})

