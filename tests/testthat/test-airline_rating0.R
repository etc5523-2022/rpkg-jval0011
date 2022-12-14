test_that("airline_rating0 shows correct rating, test1", {

  library(dplyr)

  air <- airsafety::safetydata

  air_rate <- airsafety::safetydata_ratePic(air) %>%
    mutate(airline = tolower(airline))

  name <- tolower("QANTAS")

  test_rate <- air_rate %>%
    dplyr::filter(airline == name)

  expect_equal(airline_rating0(name = "qanTAS"), as.numeric(test_rate$rating))

})


test_that("airline_rating0 shows correct rating, test2", {

  expect_equal(airline_rating0(name = "qantasss"), "Sorry we do not have the data for this airline!")

})
