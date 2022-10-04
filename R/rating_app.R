#' Airline Safety Rating R Shiny Application
#'
#' @description
#' Run Airsafety Rating Shiny Application from inst/myapp directory
#'
#' @return
#' A Shiny App embedded in the package
#'
#' @export

rating_app <- function() {
  app_dir <- system.file("myapp", package = "airsafety")
  shiny::runApp(app_dir, display.mode = "normal")
}
