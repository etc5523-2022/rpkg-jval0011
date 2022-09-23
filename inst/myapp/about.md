## About the app

**Is Your Favorite Airline✈️ Safe?** is inspired by the article, [Should Travelers Avoid Flying Airlines That Have Had Crashes in the Past?](https://fivethirtyeight.com/features/should-travelers-avoid-flying-airlines-that-have-had-crashes-in-the-past/) by Nate Silver. This article show analysis of airlines' accidents and the rating of airlines' safety based on that analysis. 

Similarly, this app will rate each airline and can be compared based on the number of accidents. 
There are two modes that users can choose from :
 - **Compare Mode** : Comparing two airlines' safety
 - **Rating Mode** : Search airlines based on the rating
 

**Disclaimer** : 
The ratings are calculated based on comparing only within airlines listed in the data set.

Please go to *Data* section for further details about the rating system.


#### Data

This application use data set sourced from [TidyTuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-08-07), which has been modified from the original data used in the article [Should Travelers Avoid Flying Airlines That Have Had Crashes in the Past?](https://fivethirtyeight.com/features/should-travelers-avoid-flying-airlines-that-have-had-crashes-in-the-past/) by Nate Silver.

The data contains information about airlines' accidents and the number of seat kilometres, focusing on the year 1985-1999 and 2000-2014. The accidents specified in this data are as follows:

- Incidents : number of incidents that happened
- Fatal Accidents : number of incidents resulting in the death
- Fatalities : number of death by the accident

For this app, the data has been modified to calculate each airline's rating and display the tail logo of each airline. The graphics is taken from [AirHex](https://airhex.com/airline-logos/).

**Rating System**

The rating system in this app is calculated as follows:

1. Calculate the average number of each type of incident for each year range and double the number for the year 2000-2014 to increase the significance of the airlines' recent years' performance. Then, subtract the average of each airline from the average of all airlines. Safer airlines result in higher/positive scores.

2. Multiply the result by the square root of the number of seat kilometres flown. This step considers airlines with a larger sample of flights.

3. The result is aggregated into five groups (rating of 1 to 5)


Please refer to the *data.r* file in this [github](https://github.com/etc5523-2022/shiny--jval0011/tree/main/Data) repository to see how the data set is modified.

#### Purpose

The purpose of the app is to:

1. show the comparison of airline safety between two airlines through the number of accidents.
2. provide information about the rating of airlines' safety

This app used interactive components where users can choose their favourite airlines and compare them to other airlines to see the number of incidents, fatal accidents, and fatalities from 1985 to 2014. In addition, the rating mode lets the users choose the rating that will show a list of airlines that belongs to the corresponding rating category.


#### Creator

Josephine Valensia (jval0011@student.monash.edu)

<details>
<summary>Session information</summary>

```
## ─ Session info ───────────────────────────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.1.2 (2021-11-01)
##  os       macOS Monterey 12.4
##  system   aarch64, darwin20
##  ui       RStudio
##  language (EN)
##  collate  en_US.UTF-8
##  ctype    en_US.UTF-8
##  tz       Australia/Melbourne
##  date     2022-09-23
##  rstudio  2022.07.0+548 Spotted Wakerobin (desktop)
##  pandoc   NA
## 
## ─ Packages ───────────────────────────────────────────────────────────────────────────────────────
##  package     * version    date (UTC) lib source
##  airsafety   * 0.0.0.9000 2022-09-23 [1] local
##  assertthat    0.2.1      2019-03-21 [2] CRAN (R 4.1.0)
##  bslib       * 0.4.0      2022-07-16 [1] CRAN (R 4.1.1)
##  cachem        1.0.6      2021-08-19 [2] CRAN (R 4.1.1)
##  cli           3.3.0      2022-04-25 [2] CRAN (R 4.1.1)
##  colorspace    2.0-3      2022-02-21 [2] CRAN (R 4.1.1)
##  crayon        1.5.1      2022-03-26 [2] CRAN (R 4.1.1)
##  crosstalk     1.2.0      2021-11-04 [1] CRAN (R 4.1.1)
##  data.table    1.14.2     2021-09-27 [1] CRAN (R 4.1.1)
##  DBI           1.1.3      2022-06-18 [1] CRAN (R 4.1.1)
##  digest        0.6.29     2021-12-01 [2] CRAN (R 4.1.1)
##  dplyr       * 1.0.9      2022-04-28 [2] CRAN (R 4.1.1)
##  DT          * 0.24       2022-08-09 [1] CRAN (R 4.1.1)
##  ellipsis      0.3.2      2021-04-29 [2] CRAN (R 4.1.0)
##  evaluate      0.15       2022-02-18 [2] CRAN (R 4.1.1)
##  fansi         1.0.3      2022-03-24 [2] CRAN (R 4.1.1)
##  farver        2.1.1      2022-07-06 [2] CRAN (R 4.1.1)
##  fastmap       1.1.0      2021-01-25 [2] CRAN (R 4.1.0)
##  fontawesome   0.3.0      2022-07-20 [1] CRAN (R 4.1.1)
##  fs            1.5.2      2021-12-08 [2] CRAN (R 4.1.1)
##  generics      0.1.3      2022-07-05 [2] CRAN (R 4.1.1)
##  ggplot2     * 3.3.6      2022-05-03 [2] CRAN (R 4.1.1)
##  glue          1.6.2      2022-02-24 [2] CRAN (R 4.1.2)
##  gtable        0.3.0      2019-03-25 [2] CRAN (R 4.1.1)
##  htmltools     0.5.3      2022-07-18 [2] CRAN (R 4.1.1)
##  htmlwidgets   1.5.4      2021-09-08 [1] CRAN (R 4.1.1)
##  httpuv        1.6.5      2022-01-05 [1] CRAN (R 4.1.1)
##  httr          1.4.3      2022-05-04 [2] CRAN (R 4.1.1)
##  jquerylib     0.1.4      2021-04-26 [2] CRAN (R 4.1.0)
##  jsonlite      1.8.0      2022-02-22 [2] CRAN (R 4.1.1)
##  knitr         1.39       2022-04-26 [1] CRAN (R 4.1.1)
##  labeling      0.4.2      2020-10-20 [2] CRAN (R 4.1.0)
##  later         1.3.0      2021-08-18 [1] CRAN (R 4.1.1)
##  lazyeval      0.2.2      2019-03-15 [1] CRAN (R 4.1.0)
##  lifecycle     1.0.1      2021-09-24 [2] CRAN (R 4.1.1)
##  magrittr      2.0.3      2022-03-30 [2] CRAN (R 4.1.1)
##  markdown      1.1        2019-08-07 [2] CRAN (R 4.1.0)
##  memoise       2.0.1      2021-11-26 [2] CRAN (R 4.1.1)
##  mime          0.12       2021-09-28 [2] CRAN (R 4.1.1)
##  munsell       0.5.0      2018-06-12 [2] CRAN (R 4.1.0)
##  pillar        1.8.0      2022-07-18 [2] CRAN (R 4.1.1)
##  pkgconfig     2.0.3      2019-09-22 [2] CRAN (R 4.1.0)
##  pkgload       1.3.0      2022-06-27 [1] CRAN (R 4.1.1)
##  plotly      * 4.10.0     2021-10-09 [1] CRAN (R 4.1.1)
##  promises      1.2.0.1    2021-02-11 [1] CRAN (R 4.1.0)
##  purrr       * 0.3.4      2020-04-17 [2] CRAN (R 4.1.0)
##  R6            2.5.1      2021-08-19 [2] CRAN (R 4.1.1)
##  Rcpp          1.0.9      2022-07-08 [2] CRAN (R 4.1.1)
##  rlang         1.0.4      2022-07-12 [2] CRAN (R 4.1.1)
##  rsconnect     0.8.27     2022-07-12 [1] CRAN (R 4.1.2)
##  rstudioapi    0.13       2020-11-12 [2] CRAN (R 4.1.0)
##  sass          0.4.2      2022-07-16 [1] CRAN (R 4.1.1)
##  scales        1.2.0      2022-04-13 [1] CRAN (R 4.1.1)
##  sessioninfo   1.2.2      2021-12-06 [1] CRAN (R 4.1.1)
##  shiny       * 1.7.2      2022-07-19 [1] CRAN (R 4.1.1)
##  stringi       1.7.8      2022-07-11 [2] CRAN (R 4.1.1)
##  stringr       1.4.1      2022-08-20 [1] CRAN (R 4.1.1)
##  tibble        3.1.8      2022-07-22 [1] CRAN (R 4.1.1)
##  tidyr       * 1.2.0      2022-02-01 [2] CRAN (R 4.1.1)
##  tidyselect    1.1.2      2022-02-21 [2] CRAN (R 4.1.1)
##  utf8          1.2.2      2021-07-24 [2] CRAN (R 4.1.0)
##  vctrs         0.4.1      2022-04-13 [2] CRAN (R 4.1.1)
##  viridisLite   0.4.0      2021-04-13 [2] CRAN (R 4.1.0)
##  withr         2.5.0      2022-03-03 [2] CRAN (R 4.1.1)
##  xfun          0.31       2022-05-10 [1] CRAN (R 4.1.1)
##  xtable        1.8-4      2019-04-21 [1] CRAN (R 4.1.0)
##  yaml          2.3.5      2022-02-21 [2] CRAN (R 4.1.1)
## 
##  [1] /Users/josephinevalensia/Library/R/arm64/4.1/library
##  [2] /Library/Frameworks/R.framework/Versions/4.1-arm64/Resources/library
## 
## ──────────────────────────────────────────────────────────────────────────────────────────────────
```
</details>
