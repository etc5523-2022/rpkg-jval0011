#' @import dplyr
#' @import magrittr
#' @import tidyr
#'
#' @export

airline_rating <- function(name = NULL){

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



