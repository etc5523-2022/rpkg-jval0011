#' @export
rating_app <- function() {
  app_dir <- system.file("myapp", package = "airsafety")
  shiny::runApp(app_dir, display.mode = "normal")
}
