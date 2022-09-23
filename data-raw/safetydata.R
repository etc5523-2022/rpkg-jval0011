#' @import dplyr
#' @import stringr

URL <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-08-07/week19_airline_safety.csv"

safetydata <- read.csv(URL) %>%
  select(-X) %>%
  mutate(airline = str_replace(airline,"\\*",""),
         year_range = factor(year_range, levels=c("85_99", "00_14")))

usethis::use_data(safetydata, overwrite = TRUE)

