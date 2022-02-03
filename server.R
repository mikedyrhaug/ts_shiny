library(shiny)

server <- function(input, output) {
  output$debug <- renderPrint({
    input$selected_date_range
   #input$selected_store
   #input$selected_sku
   #
   #sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_sku, ]
  })
  output$ts_plot <- renderPlot({
    min_date <- input$selected_date_range[1]
    max_date <- input$selected_date_range[2]
    plot_df <- sales_df[sales_df$scode == input$selected_store & 
                          sales_df$pcode == input$selected_sku,
    ]
    plot_df <- plot_df[plot_df$date >= min_date, ]
    plot_df <- plot_df[plot_df$date <= max_date, ]
    autoplot(plot_df)
  })
}