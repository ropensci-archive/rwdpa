context("wdpa_api_countries")

test_that("wdpa_api_countries works as expected", {
  skip_on_cran()

  aa <- wdpa_api_countries(per_page = 1)

  expect_is(aa, 'data.frame')
  expect_type(aa$name, 'character')
  expect_type(aa$iso_3, 'character')
  expect_is(aa$statistics, 'data.frame')
})


test_that("wdpa_api_countries fails well", {
  skip_on_cran()

  expect_error(wdpa_api_countries(5), "country_code must be of class character")
  expect_error(wdpa_api_countries(geojson = 5),
               "geojson must be of class logical")
  expect_error(wdpa_api_countries(page = "adf"),
               "page must be of class integer, numeric")
  expect_error(wdpa_api_countries(per_page = "fa"),
               "per_page must be of class integer, numeric")
})


context("wdpa_api_countries_")
test_that("under the hood fxn wdpa_api_countries_ works as expected", {
  skip_on_cran()

  aa <- wdpa_api_countries_(per_page = 1)

  expect_is(aa, 'HttpResponse')
  expect_is(aa$method, 'character')
  expect_equal(aa$method, 'get')
  expect_match(aa$url, 'v3/countries')
  expect_equal(aa$status_code, 200)
  expect_is(aa$content, 'raw')
})
