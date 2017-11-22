context("wdpa_api_pa_search")

test_that("wdpa_api_pa_search works as expected", {
  skip_on_cran()

  aa <- wdpa_api_pa_search(per_page = 1)

  expect_is(aa, 'data.frame')
  expect_type(aa$name, 'character')
  expect_type(aa$id, 'integer')
  expect_is(aa$countries, 'list')
  expect_is(aa$countries[[1]], 'data.frame')
})

test_that("wdpa_api_pa_search fails well", {
  skip_on_cran()

  expect_error(wdpa_api_pa_search(5), "marine must be of class logical")
  expect_error(wdpa_api_pa_search(country = 5),
               "country must be of class character")
  expect_error(wdpa_api_pa_search(designation = TRUE),
               "designation must be of class integer, numeric")
  expect_error(wdpa_api_pa_search(per_page = "fa"),
               "per_page must be of class integer, numeric")
})


context("wdpa_api_pa_search_")
test_that("under the hood fxn wdpa_api_pa_search_ works as expected", {
  skip_on_cran()

  aa <- wdpa_api_pa_search_(per_page = 1)

  expect_is(aa, 'HttpResponse')
  expect_is(aa$method, 'character')
  expect_equal(aa$method, 'get')
  expect_match(aa$url, 'protected_areas/search')
  expect_equal(aa$status_code, 200)
  expect_is(aa$content, 'raw')
})

