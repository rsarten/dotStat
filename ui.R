## ui

library(shinydashboard)


module_names = c('Cigarette smoking', 'Culture & Identity', 'Education & Training', 'Families & Household', 'Housing', 'Income',
                 'Population', 'Transport & Communications', 'Work & unpaid activities')

dashboardPage(skin = "black",
              dashboardHeader(title = "dotStat"),
              dashboardSidebar(sidebarMenu(
                menuItem("Create folders", tabName = "folders", icon = icon("folder-open-o")),
                menuItem("Create TXD", tabName = "txd", icon = icon("share-square-o")),
                menuItem("Create final data", tabName = "data", icon = icon("table"))
              )),
              dashboardBody(tabItems(
                tabItem(tabName = "folders",
                        fluidRow(
                          box(title = "Select destination folder", status = "warning",
                              selectInput(inputId = 'Module',label = '', choices = module_names)),
                          box(title = "Specify table code", status = "warning",
                              textInput(inputId = 'ModuleCode', label = '', placeholder = '0000'))
                        ),
                        fluidRow(tabBox(
                          title = "Set up background folders",
                          # The id lets us use input$tabset1 on the server to find the current tab
                          id = "tabset1", height = "250px", width = 12,
                          tabPanel("Dimension Index", "generate basics"),
                          tabPanel("Dimension Lookup", "find classification lookup")
                        )),
                        fluidRow(column(align = "centre", width = 6,
                                        box(status = "warning",
                                            actionButton("submit", label = "Submit", style = "float:centre", width = "30%"))
                        ))),
                tabItem(tabName = "txd"),
                tabItem(tabName = "data")
              )
              )
)