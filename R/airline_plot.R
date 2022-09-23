#' @import plotly
#' @import ggplot2
#' @import dplyr
#' @import shiny
#'
#' @param input_aero An unquoted variable name
#' @param input_event An unquoted variable name
#'
#' @export

airline_plot <- function(input_aero, input_event) {

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
