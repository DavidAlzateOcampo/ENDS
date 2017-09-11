## SHINY SERVER #########

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
library(ROCR)
### ACTUALIZAR ANTES DE EJECUTAR EN OTRO  COMPUTADOR ####
setwd("~/CancerShiny")
#ENDS15 = read.spss("COIR71FL.sav", to.data.frame=TRUE)
#attr(ENDS15,"variable.labels")
#names<-gsub(pattern=" ",attr(ENDS15,"variable.labels"),fixed=T,replacement=".")
#names(ENDS15)<-names

ENDS1<-ENDS15[,c(1,102,3636,3620,4481,4487,4633,4634,4711,4712,4713,5652,5660,5664,5665,5666,
                 5667,5673)]

# Configuracion de la presentacion en Shiny
shinyServer(
  function(input, output){
  #  output$ARBOL<-renderPlot({
  #    ARBOL(input$VariablesX, input$Prune_X, input$Subregion, input$Colombia)
  #  })
    # Grafico que muestra opciones para analizar relaciÃÂ³n entre parejas de variables, 
    # especialmente util para ver la relaciÃÂ³n del ESTADO_ENDS1 frente a las demÃÂ¡s 
    # variables y hacer comparaciones por las categorias de las otras variables
    output$plot.1 <- renderPlot({
      plot.1(input$Colombia1, input$Resultado, (input$Var_Y1), (input$Var_X1))
    })
  }
)
#}

##############################################################
#### Desarrollo de funciones para mostrar graficos de analisis por variable

plot.1<-function(Total1, Resultado,varY1, varX1){
  SUBDATA1 <- filter(ENDS1, Result.of.last.cytology==Resultado) # SelecciÃÂ³n de Subregion de educiÃÂ³n mediante input de usuario
  s <- ggplot(SUBDATA1, aes_string(varX1, fill = varY1)) + geom_bar(position = "dodge")
  if(Total1){
    s <- ggplot(ENDS1, aes_string(varX1, fill = varY1)) + geom_bar(position = "dodge")
  }
  s
}
