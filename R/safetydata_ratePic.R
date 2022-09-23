#' @import dplyr
#' @import magrittr
#' @import tidyr
#' @import purrr
#' @import shiny
#'
#' @param x An unquoted variable name
#'
#' @export


safetydata_ratePic <- function(x){

  year_range <- type_of_event <- n_events <- incident1 <- fatal_accidents1 <-
    fatalities1 <- incidents2 <- fatal_accidents2 <- fatalities2 <- tot <-
    tot_rate <- avail_seat_km_per_week <- airline <- rating <- NULL


  air_rate <- x %>%
    pivot_wider(names_from = c(year_range, type_of_event),
                values_from = n_events) %>%
    mutate(across(.cols=3:8, .fns=as.numeric)) %>%
    rename("incident1" = "85_99_incidents",
           "fatal_accidents1" = "85_99_fatal_accidents",
           "fatalities1" = "85_99_fatalities",
           "incidents2" = "00_14_incidents",
           "fatal_accidents2" = "00_14_fatal_accidents",
           "fatalities2" = "00_14_fatalities") %>%
    mutate(tot = ((incident1 + fatal_accidents1 + fatalities1)/3) +
             2 * ((incidents2 + fatal_accidents2 + fatalities2)/3)) %>%
    mutate(tot_rate = mean(tot) - tot,
           sqrt = tot_rate * sqrt(avail_seat_km_per_week),
           rating = cut(sqrt, breaks = 5, labels = c(1,2,3,4,5)))

  air_pic <- air_rate %>%
    arrange(airline) %>%
    mutate(logo = c("https://airhex.com/images/airline-logos/tail/aer-lingus.png",
                    "https://airhex.com/images/airline-logos/tail/aeroflot.png",
                    "https://airhex.com/images/airline-logos/tail/aerolineas-argentinas.png",
                    "https://airhex.com/images/airline-logos/tail/aeromexico.png",
                    "https://airhex.com/images/airline-logos/tail/air-canada.png",
                    "https://airhex.com/images/airline-logos/tail/air-france.png",
                    "https://airhex.com/images/airline-logos/tail/air-india.png",
                    "https://airhex.com/images/airline-logos/tail/air-new-zealand.png",
                    "https://airhex.com/images/airline-logos/tail/alaska-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/alitalia.png",
                    "https://airhex.com/images/airline-logos/tail/all-nippon-airways.png",
                    "https://airhex.com/images/airline-logos/tail/american-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/austrian-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/avianca.png",
                    "https://airhex.com/images/airline-logos/tail/british-airways.png",
                    "https://airhex.com/images/airline-logos/tail/cathay-pacific.png",
                    "https://airhex.com/images/airline-logos/tail/china-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/condor.png",
                    "https://airhex.com/images/airline-logos/tail/copa-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/delta.png",
                    "https://airhex.com/images/airline-logos/tail/egyptair.png",
                    "https://airhex.com/images/airline-logos/tail/el-al.png",
                    "https://airhex.com/images/airline-logos/tail/ethiopian-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/finnair.png",
                    "https://airhex.com/images/airline-logos/tail/garuda-indonesia.png",
                    "https://airhex.com/images/airline-logos/tail/gulf-air.png",
                    "https://airhex.com/images/airline-logos/tail/hawaiian-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/iberia.png",
                    "https://airhex.com/images/airline-logos/tail/japan-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/kenya-airways.png",
                    "https://airhex.com/images/airline-logos/tail/klm.png",
                    "https://airhex.com/images/airline-logos/tail/korean-air.png",
                    "https://airhex.com/images/airline-logos/tail/latam-colombia.png",
                    "https://airhex.com/images/airline-logos/tail/lufthansa.png",
                    "https://airhex.com/images/airline-logos/tail/malaysia-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/pia.png",
                    "https://airhex.com/images/airline-logos/tail/philippine-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/qantas.png",
                    "https://airhex.com/images/airline-logos/tail/royal-air-maroc.png",
                    "https://airhex.com/images/airline-logos/tail/sas-scandinavian.png",
                    "https://airhex.com/images/airline-logos/tail/saudia.png",
                    "https://airhex.com/images/airline-logos/tail/singapore-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/south-african-airways.png",
                    "https://airhex.com/images/airline-logos/tail/southwest-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/srilankan-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/swiss.png",
                    "https://airhex.com/images/airline-logos/tail/avianca.png",
                    "https://airhex.com/images/airline-logos/tail/latam-colombia.png",
                    "https://airhex.com/images/airline-logos/tail/tap-air-portugal.png",
                    "https://airhex.com/images/airline-logos/tail/thai-airways.png",
                    "https://airhex.com/images/airline-logos/tail/turkish-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/united-airlines.png",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Former_America_West_Airlines_logo.svg/505px-Former_America_West_Airlines_logo.svg.png",
                    "https://airhex.com/images/airline-logos/tail/vietnam-airlines.png",
                    "https://airhex.com/images/airline-logos/tail/virgin-atlantic.png",
                    "https://airhex.com/images/airline-logos/tail/xiamen-airlines.png"
    ),
    pictags = paste("<img src=",logo,"height=\"70\"></img>")
    )

  air_pic
}
