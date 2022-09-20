library(tidyverse)
library(shiny)
library(plotly)
library(DT)
library(bslib)

air <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-08-07/week19_airline_safety.csv") %>%
  select(-X) %>%
  mutate(airline = str_replace(airline,"\\*",""),
         year_range = factor(year_range, levels=c("85_99", "00_14")))

air2 <- air %>%
  pivot_wider(names_from = c(year_range, type_of_event),
              values_from = n_events) %>%
  mutate(across(.cols=3:8, .fns=as.numeric)) %>%
  rename("incident1" = "85_99_incidents",
         "fatal_accidents1" = "85_99_fatal_accidents",
         "fatalities1" = "85_99_fatalities",
         "incidents2" = "00_14_incidents",
         "fatal_accidents2" = "00_14_fatal_accidents",
         "fatalities2" = "00_14_fatalities"
  ) %>%
  mutate(tot = ((incident1 + fatal_accidents1 + fatalities1)/3) +
           2 * ((incidents2 + fatal_accidents2 + fatalities2)/3))

air_rate <- air2 %>%
  mutate(tot_rate = mean(tot) - tot,
         sqrt = tot_rate * sqrt(avail_seat_km_per_week),
         rating = cut(sqrt, breaks = 5, labels = c(1,2,3,4,5)))

air_stars <- air_rate %>%
  mutate(stars = map(rating, ~paste(rep("⭐",
                                        times = .x), collapse="")))

air_pic <- air_stars %>%
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



# Define UI for application
ui <- fluidPage(

  theme = bs_theme(version = 4, bootswatch = "minty"),

  titlePanel("Is Your Favorite Airline✈️ Safe?"),

  tabsetPanel(
    tabPanel("About the App",
             div(class = "about",
                 uiOutput('about'))
    ),
    tabPanel("Compare Mode",

             sidebarLayout(
               sidebarPanel(
                 selectInput("aero1",
                             "Choose a Airline 1:",
                             unique(air_pic$airline),
                             selected = "Aer Lingus"),
                 selectInput("aero2",
                             "Choose a Airline 2:",
                             unique(air_pic$airline),
                             selected = "Aeroflot"),
                 radioButtons("event1",
                              "Types of Event:",
                              c("Incidents" = "incidents",
                                "Fatal Accidents" = "fatal_accidents",
                                "Fatalities" = "fatalities"),
                              selected = "incidents")
               ),

               mainPanel(
                 splitLayout(
                   verticalLayout(
                     fluidRow(
                       column(8,
                              br(),
                              h1(textOutput("aeroname1"))),
                       column(4, uiOutput("aeropic1"))
                     ),
                     plotlyOutput("incPlot1"),
                     br(),
                     br(),
                     div( class = "rating",
                          h3("Rating"),
                          textOutput("aerorate1"))),
                   verticalLayout(
                     fluidRow(
                       column(8,
                              br(),
                              h1(textOutput("aeroname2"))),
                       column(4, uiOutput("aeropic2"))
                     ),
                     plotlyOutput("incPlot2"),
                     br(),
                     br(),
                     div(
                       class = "rating",
                       h3("Rating"),
                       textOutput("aerorate2")))
                 )

               )
             )),
    tabPanel("Rate Mode",
             sidebarLayout(
               sidebarPanel(
                 sliderInput("rate",
                             "Rating:",
                             min = 1,
                             max = 5,
                             value = 3)
               ),

               mainPanel(
                 DT::dataTableOutput("rat")
               ))
    )),
  includeCSS("styles.css")
)


server <- function(input, output, session) {


  observe({
    updateSelectInput(session, "aero2", choices = setdiff(unique(air$airline), input$aero1))
  })

  output$aeroname1 <- reactive({input$aero1})
  output$aeroname2 <- reactive({input$aero2})

  output$aeropic1 <- renderUI({
    pic1 <- air_pic %>%
      filter(airline == input$aero1)
    tags$img(src = pic1$logo, height="70%", width="70%")
  })

  output$aeropic2 <- renderUI({
    pic2 <- air_pic %>%
      filter(airline == input$aero2)
    tags$img(src = pic2$logo, height="70%", width="70%")
  })

  y_label <- reactive({
    req(input$event1)
    if(input$event1 == "incidents"){
      y_label <- "Number of Incidents"
    } else if(input$event1 == "fatal_accidents"){
      y_label <- "Number of Fatal Accidents"
    } else if(input$event1 == "fatalities"){
      y_label <- "Number of Fatalities"
    }})


  output$incPlot1 <- renderPlotly({
    p1 <- air %>%
      filter(airline == input$aero1, type_of_event == input$event1) %>%
      ggplot(aes(y = n_events,
                 x = year_range)) +
      geom_col(aes(fill = year_range)) +
      labs(y = y_label(),
           x = "Range of Year") +
      scale_x_discrete(labels = c("85_99" = "1985 to 1999", "00_14" = "2000 to 2014")) +
      theme_bw() +
      theme(legend.position="none")
    ggplotly(p1)
  })

  output$incPlot2 <- renderPlotly({
    p2 <- air %>%
      filter(airline == input$aero2, type_of_event == input$event1) %>%
      ggplot(aes(y = n_events,
                 x = year_range)) +
      geom_col(aes(fill = year_range)) +
      labs(y = y_label(),
           x = "Range of Year") +
      scale_x_discrete(labels = c("85_99" = "1985 to 1999", "00_14" = "2000 to 2014")) +
      theme_bw() +
      theme(legend.position="none")
    ggplotly(p2)
  })

  output$aerorate1 <- reactive({
    stars1 <- air_pic %>%
      filter(airline == input$aero1)
    stars1$stars
  })

  output$aerorate2 <- reactive({
    stars2 <- air_pic %>%
      filter(airline == input$aero2)
    stars2$stars
  })

  rateTable <- reactive({
    req(input$rate)
    if(input$rate == 1){
      rateTable <- air_pic %>%
        filter(rating == 1) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input$rate == 2){
      rateTable <- air_pic %>%
        filter(rating == 2) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input$rate == 3){
      rateTable <- air_pic %>%
        filter(rating == 3) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input$rate == 4){
      rateTable <- air_pic %>%
        filter(rating == 4) %>%
        select(airline, pictags) %>%
        tibble()
    } else if(input$rate == 5){
      rateTable <-  air_pic %>%
        filter(rating == 5) %>%
        select(airline, pictags) %>%
        tibble()
    }
  })

  output$rat <- DT::renderDataTable({
    DT::datatable(rateTable(),
                  colnames = c("Airline", "Logo"),
                  escape = FALSE)
  })

  output$about <- renderUI({
    knitr::knit("about.Rmd", quiet = TRUE) %>%
      markdown::markdownToHTML(fragment.only = TRUE) %>%
      HTML()
  })

}

shinyApp(ui = ui, server = server)
