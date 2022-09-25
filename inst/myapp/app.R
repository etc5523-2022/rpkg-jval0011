library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(DT)
library(bslib)
library(tidyr)
library(purrr)
library(airsafety)

air <- airsafety::safetydata

air2 <- airsafety::safetydata_ratePic(air)

air_stars <- air2 %>%
  mutate(stars = map(rating, ~paste(rep("⭐",
                                        times = .x), collapse="")))

# Define UI for applicationuse
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
                             unique(air_stars$airline),
                             selected = "Aer Lingus"),
                 selectInput("aero2",
                             "Choose a Airline 2:",
                             unique(air_stars$airline),
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
                              h2(textOutput("aeroname1"))),
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
                              h2(textOutput("aeroname2"))),
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
    updateSelectInput(session, "aero2",
                      choices = setdiff(unique(air$airline), input$aero1))
  })

  output$aeroname1 <- reactive({input$aero1})
  output$aeroname2 <- reactive({input$aero2})

  output$aeropic1 <- renderUI({airsafety::airline_pic(input$aero1)})
  output$aeropic2 <- renderUI({airsafety::airline_pic(input$aero2)})

  output$incPlot1 <- renderPlotly({
    airsafety::airline_plot(input$aero1, input$event1)
  })

  output$incPlot2 <- renderPlotly({
    airsafety::airline_plot(input$aero2, input$event1)
  })

  output$aerorate1 <- reactive({
    stars1 <- air_stars %>%
      filter(airline == input$aero1)
    stars1$stars
  })

  output$aerorate2 <- reactive({
    stars2 <- air_stars %>%
      filter(airline == input$aero2)
    stars2$stars
  })

  output$rat <- DT::renderDataTable({
    airsafety::airline_dt(input$rate)
  })

  output$about <- renderUI({
    knitr::knit("about.Rmd", quiet = TRUE) %>%
      markdown::markdownToHTML(fragment.only = TRUE) %>%
      HTML()
  })

}

shinyApp(ui = ui, server = server)
