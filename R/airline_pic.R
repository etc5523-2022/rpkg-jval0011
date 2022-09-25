#' Airline Tail Logo Tag
#'
#' @description
#' Create a HTML IMG tag for the tail logo of the airlines for output in Shiny APP.
#'
#' @param input Shiny user-interface input
#'
#' @import dplyr
#' @import htmltools
#'
#' @export

airline_pic <- function(input){

  airline <- NULL

  air_pic <- airsafety::safetydata_ratePic(airsafety::safetydata)

  pic <- air_pic %>%
      filter(airline == input)

  tags$img(src = pic$logo, height="70%", width="70%")

}

