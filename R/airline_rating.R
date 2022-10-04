#' Airline Safety Rating
#'
#' @description
#' State the rating an airline out of the 56 listed in the safetydata based on the input.
#'
#' @param name an airline name listed in the safetydata, typed in both lowercase or uppercase is acceptable
#'
#' @examples
#' airline_rating("All Nippon Airways")
#' airline_rating("QANTAS")
#' airline_rating("garuda indonesia")
#'
#' @import dplyr
#' @import magrittr
#'
#' @export

airline_rating <- function(name){

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
    paste0(toupper(air_name$airline), " has rating of ", air_name$rating, " / 5!")
  } else {
    paste0("Sorry we do not have the data for this airline!")
  }


}



