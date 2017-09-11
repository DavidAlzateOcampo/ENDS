# CONFIGURACIÃN DE LA PRESENTACIÃN DEL ANÃLISIS EN SHINY

library(shiny)
library(ggplot2)
library(plotly)
library(foreign)
library(rattle)
library(RColorBrewer)
library(party)
library(dplyr)
library(tidyr)
library(partykit)

### ACTUALIZAR ANTES DE EJECUTAR EN OTRO  COMPUTADOR ####
setwd("~/CancerShiny")
#ENDS15 = read.spss("COIR71FL.sav", to.data.frame=TRUE)
#ENDS1<-ENDS15[,c(1,102,3636,3620,4481,4487,4633,4634,4711,4712,4713,5652,5660,5664,5665,5666,
#                 5667,5673)]

## SHINY UI #########
shinyUI(fluidPage(
  titlePanel("CANCER"), 
  tabsetPanel(
    tabPanel("GRAFICO ANALISIS POR VARIABLES", 
             sidebarLayout(
               sidebarPanel(
                 
                 # La siguiente opciÃ³n permite seleccionar la Secretaria de EducaciÃ³n especÃ�fica
                 
                 selectInput("Resultado", "Resultado:", levels(ENDS1$Result.of.last.cytology), selected = levels(ENDS1$Result.of.last.cytology)[1]),
                 
                 # Esta opciÃ³n permite elegir el anÃ¡lisis a nivel de Colombia
                 
                 checkboxInput("Colombia1", "Total Colombia", FALSE),
                 hr(),
                 selectInput("Var_Y1", "Variable Y", names(ENDS1), selected = names(ENDS1)[6]),
                 selectInput("Var_X1", "Variable X", names(ENDS1), selected = names(ENDS1)[10])), 
               mainPanel(wellPanel(plotOutput("plot.1"))),
               position = c("left"), 
               fluid = TRUE
             )
    )
  )
)
)