#' Airline Safety Data
#'
#' A dataset that contains information about number of airlines' incidents,
#' fatal accidents, fatalities and available seat kilometers per week,
#' focusing on the year 1985-1999 and 2000-2014.
#'
#' @format A data frame with 336 rows and 5 variables.
#' \describe{
#'   \item{airline}{Airline name}
#'   \item{avail_seat_km_per_week}{Available seat kilometers flown every week}
#'   \item{year_range}{Range of year (1985-1999 & 2000-2014)}
#'   \item{type_of_event}{Types of events happened : incidents, fatal accidents, fatalities}
#'   \item{n_events}{Total number of event that happened}
#' }
#' @source \url{https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-08-07/week19_airline_safety.csv}
"safetydata"
