library(shiny)
library(ggplot2)

future_value <- function(amount, rate, years) {
  return((amount * ((1 + rate) ^ years)))
}
annuity <- function(contrib, rate, years) {
  return(contrib * ((((1 + rate) ^ years) - 1) / rate))
}
growing_annuity <- function(contrib, rate, growth, years) {
  return(contrib * ((((1 + rate) ^ years) - ((1 + growth) ^ years)) / (rate - growth)))
}
light_red <- rgb(255, 0, 0, max = 255, alpha = 125, names = "light_red")
light_green <- rgb(0, 255, 0, max = 255, alpha = 125, names = "light_red")
light_blue <- rgb(0, 0, 255, max = 255, alpha = 125, names = "light_red")

titlePanel("Investment Timelines")

ui <- fluidPage(
  fluidRow(
    column(3, 
           sliderInput(inputId = "init",
                       label = "Initial Amount",
                       value = 1000, min = 0, max = 100000, step = 500)),
    column(3,
           sliderInput(inputId = "return",
                       label = "Return Rate (in %)",
                       value = 5, min = 0, max = 20, step = 0.1)),
    column(3,
           sliderInput(inputId = "years",
                       label = "Years",
                       value = 20, min = 0, max = 50, step = 1))
  ),
  fluidRow(
    column(3,
           sliderInput(inputId = "annual",
                       label = "Annual Contribution",
                       value = 2000, min = 0, max = 50000, step = 500)),
    column(3,
           sliderInput(inputId = "growth",
                       label = "Growth Rate (in %)",
                       value = 2, min = 0, max = 20, step = 0.1)),
    column(3,
           selectInput(inputId = "facet",
                       label = "Facet?",
                       choices = c("No", "Yes")))
  ),
  
  h4("Timelines"),
  plotOutput("timelines"),
  
  h4("Balances"),
  tableOutput("balances")
)


server <- function(input, output) {
  output$timelines <- renderPlot({
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    for (i in 0:input$years) {
      no_contrib[i+1] <- future_value(input$init, input$return/100, i)
      fixed_contrib[i+1] <- future_value(input$init, input$return/100, i) + annuity(input$annual, input$return/100, i)
      growing_contrib[i+1] <- future_value(input$init, input$return/100, i) + growing_annuity(input$annual, input$return/100, input$growth/100, i)
    }
    modalities_2 <- data.frame(
      year = 0:input$years,
      modality = rep(c('no_contrib', 'fixed_contrib', 'growing_contrib'), each = input$years + 1),
      balance = c(no_contrib, fixed_contrib, growing_contrib)
    )
    modalities_2$modality <- factor(modalities_2$modality, levels = c('no_contrib', 'fixed_contrib', 'growing_contrib'))
    if (input$facet == "No") {
      ggplot(data = modalities_2, aes(x = year, y = balance, col = modality)) +
        geom_line() +
        geom_point() +
        labs(title = 'Three modes of investing', y = 'amount of money')
    }
    else {
      ggplot(data = modalities_2, aes(x = year, y = balance, col = modality)) +
        geom_line() +
        geom_point() +
        geom_area(aes(fill = modality)) +
        theme_bw() +
        labs(title = 'Timeline Graph of Investments', y = 'amount of money') +
        facet_wrap(~modality)
    }

  })
  output$balances <- renderTable({
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    for (i in 0:input$years) {
      no_contrib[i+1] <- future_value(input$init, input$return/100, i)
      fixed_contrib[i+1] <- future_value(input$init, input$return/100, i) + annuity(input$annual, input$return/100, i)
      growing_contrib[i+1] <- future_value(input$init, input$return/100, i) + growing_annuity(input$annual, input$return/100, input$growth/100, i)
    }
    modalities <- data.frame(
      year = 0:input$years,
      no_contrib,
      fixed_contrib,
      growing_contrib
    )
    head(modalities, n = 11)
  })
}

shinyApp(server = server, ui = ui)