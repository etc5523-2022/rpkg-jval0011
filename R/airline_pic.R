#' @import dplyr
#' @import htmltools
#'
#' @param x An unquoted variable name
#'
#' @export

airline_pic <- function(x){

  airline <- NULL

  air_pic <- airsafety::safetydata_ratePic(airsafety::safetydata)

  pic <- air_pic %>%
      filter(airline == x)

  tags$img(src = pic$logo, height="70%", width="70%")

}

