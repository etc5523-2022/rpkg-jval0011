#' Airline Plot
#'
#' @description
#' Create interactive bar plot comparing number of accidents in two different
#' range of year of an airline based on the input of the selected type of events.
#'
#' @param input_aero Shiny user-interface input
#' @param input_event Shiny user-interface input
#'
#' @import plotly
#' @import ggplot2
#' @import dplyr
#' @import shiny
#'
#' @export

airline_plot <- function(input_aero, input_event) {

  airline <- year_range <- type_of_event <- n_events <- NULL

  air <- airsafety::safetydata

  y_label <- reactive({
    req(input_event)
    if(input_event == "incidents"){
      y_label <- "Number of Incidents"
    } else if(input_event == "fatal_accidents"){
      y_label <- "Number of Fatal Accidents"
    } else if(input_event == "fatalities"){
      y_label <- "Number of Fatalities"
    }})

  p <- air %>%
    filter(airline == input_aero, type_of_event == input_event) %>%
    ggplot(aes(y = n_events,
               x = year_range)) +
    geom_col(aes(fill = year_range)) +
    labs(y = y_label(),
         x = "Range of Year") +
    scale_x_discrete(labels = c("85_99" = "1985 to 1999", "00_14" = "2000 to 2014")) +
    theme_bw() +
    theme(legend.position="none")
  ggplotly(p)

}
