#' State Airline Safety Rating
#'
#' @description
#' Calculate the rating an airline out of the 56 listed in the safetydata based on the input.
#'
#' @param name an airline name listed in the safetydata, typed in both lowercase or uppercase, even mixed, is acceptable
#'
#' @examples
#' airline_rating("All Nippon Airways")
#' airline_rating("QANTAS")
#' airline_rating("garuda inDOnesia")
#'
#' @import dplyr
#' @import magrittr
#'
#' @export
#'
airline_rating0 <- function(name = NULL){

  airline <- NULL

  air <- airsafety::safetydata

  air_rate <- airsafety::safetydata_ratePic(air) %>%
    mutate(airline = tolower(airline))

  name <- tolower(name)

  if(is.null(name)){
    print("Please enter airline name!")
  } else if(name %in% air_rate$airline){
    air_name <- air_rate %>%
      filter(airline == name)
    as.numeric(air_name$rating)
  } else {
    paste0("Sorry we do not have the data for this airline!")
  }


}
