## ui

library(shinydashboard)

dashboardPage(skin = "black",
              dashboardHeader(title = "NZ.STAT tables"),
              dashboardSidebar(sidebarMenu(
                menuItem("Create folders", tabName = "folders", icon = icon("folder-open-o")),
                menuItem("Create TXD", tabName = "txd", icon = icon("share-square-o")),
                menuItem("Create final data", tabName = "data", icon = icon("table"))
              )),
              dashboardBody(tabItems(
                tabItem(tabName = "folders"),
                tabItem(tabName = "txd")
              ))
)