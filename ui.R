library(shiny)

ui <- fluidPage(
selectInput(inputId = 'selected_store', 
            label = 'Select Store', 
            choices = unique(sales_df$scode)
    ),
selectInput(inputId = 'selected_sku', 
            label = 'Select SKU', 
            choices = unique(sales_df$pcode)
),
dateRangeInput(inputId = 'selected_date_range', label = 'Select Date Range',
               start = min(sales_df$date), end = max(sales_df$date),
               min = min(sales_df$date), max = max(sales_df$date)),
  plotOutput('ts_plot'),
      verbatimTextOutput('debug')

)
