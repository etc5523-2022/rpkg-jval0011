
<!-- README.md is generated from README.Rmd. Please edit that file -->

# airsafety

<!-- badges: start -->
<!-- badges: end -->

The goal of `airsafety` package is to share information about airline
safety information with embedded interactive R Shiny application and
functions where user can easily calculate rating of an airline based on
its safety records.

## Installation

You can install the development version of airsafety from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2022/rpkg-jval0011")
```

## How to use `airsafety` package?

Load the `Airsafety` package!

``` r
library(airsafety)
```

## Functions

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Function
</th>
<th style="text-align:left;">
Description
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
safetydata
</td>
<td style="text-align:left;">
Access the airline safety data
</td>
</tr>
<tr>
<td style="text-align:left;">
ratingapp ( )
</td>
<td style="text-align:left;">
Run the R Shiny application
</td>
</tr>
<tr>
<td style="text-align:left;">
airline_rating0 ( )
</td>
<td style="text-align:left;">
Calculate rating of an airline
</td>
</tr>
<tr>
<td style="text-align:left;">
airline_rating ( )
</td>
<td style="text-align:left;">
State rating of an airline
</td>
</tr>
</tbody>
</table>

Note : some functions not mentioned above included in the package are
for the embedded R Shiny application purposes. Please refer to the link
in section : **“Want to know more about the package?”**

<br> <br>

### `safetydata` : Access the Airline Safety Data

The `airsafety` package includes a built-in dataset `safetydata`, a data
frame with **336 rows** and **5 variables**. Below is a glimpse of the
data set:

``` r
library(dplyr)
glimpse(safetydata)
#> Rows: 336
#> Columns: 5
#> $ airline                <chr> "Aer Lingus", "Aeroflot", "Aerolineas Argentina…
#> $ avail_seat_km_per_week <dbl> 320906734, 1197672318, 385803648, 596871813, 18…
#> $ year_range             <fct> 85_99, 85_99, 85_99, 85_99, 85_99, 85_99, 85_99…
#> $ type_of_event          <chr> "incidents", "incidents", "incidents", "inciden…
#> $ n_events               <int> 2, 76, 6, 3, 2, 14, 2, 3, 5, 7, 3, 21, 1, 5, 4,…
```

More details about this dataset can be found by using the function
`help(safetydata)`

<br>

### `rating_app()` : Run the R Shiny Application

To run the R shiny application, with the following code:

``` r
rating_app()
```

More information about how to use the app can be found at the **about**
section of the application.

<br>

### `airline_rating0()`& `airline_rating()` : Check Rating of An Airline

Without running the Shiny Application, you can also check the rating of
the airlines using the functions in the `airsafety` package. *Please
note only the 56 airlines listed in the built-in data set* `safetydata`
*are rated for the airline safety.*

-   `airline_rating0()` : calculate the rating

``` r
airline_rating0("Qantas")
#> [1] 5
```

For more details : `help(airline_rating0)`

<br>

-   `airline_rating()` : state the rating in sentence

``` r
airline_rating("Qantas")
#> [1] "QANTAS has rating of 5 / 5!"
```

For more details : `help(airline_rating)`

<br>

## Want to know more about the package?

Visit the `airsafety` [pkgdown
website](https://github.com/etc5523-2022/rpkg-jval0011) or the for more
information on the functions in this package.
