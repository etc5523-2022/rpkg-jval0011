#' Rating DataTable
#'
#' @description
#' Create interactive Data Table of Airlines based on the rating input by the user.
#'
#' @param input_rate Shiny user-interface input
#'
#' @return A DataTable with 2 columns : Airline Name and Tail Logo
#'
#' @import dplyr
#' @import shiny
#' @importFrom DT datatable
#'
#' @export

airline_dt <- function(input_rate){

 pictags <- airline <- rating <- NULL

  air <- airsafety::safetydata

  air2 <- airsafety::safetydata_ratePic(air)

  rateTable <- reactive({
    req(input_rate)
    if(input_rate == 1){
      rateTable <- air2 %>%
        filter(rating == 1) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input_rate == 2){
      rateTable <- air2 %>%
        filter(rating == 2) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input_rate == 3){
      rateTable <- air2 %>%
        filter(rating == 3) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input_rate == 4){
      rateTable <- air2 %>%
        filter(rating == 4) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input_rate == 5){
      rateTable <-  air2 %>%
        filter(rating == 5) %>%
        select(airline, pictags) %>%
        tibble()
    }
  })

  DT::datatable(rateTable(),
                colnames = c("Airline", "Logo"),
                escape = FALSE)

}




