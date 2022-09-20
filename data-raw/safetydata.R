library(tidyverse)
library(kableExtra)

airsafety <- read_csv("Data/week19_airline_safety.csv") %>%
  select(-X) %>%
  mutate(airline = str_replace(airline,"\\*",""),
         year_range = factor(year_range, levels=c("85_99", "00_14")))


usethis::use_data(safetydata, overwrite = TRUE)
