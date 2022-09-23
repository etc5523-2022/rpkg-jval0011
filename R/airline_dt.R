#' @import dplyr
#' @import shiny
#' @import DT
#'
#' @param input_aero An unquoted variable name
#'
#' @export

airline_dt <- function(input_rate){

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




