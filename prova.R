# Instalacao e carregamento dos pacotes
lista.de.pacotes <- c("rmarkdown","exams","knitr", "pdftools")
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in% installed.packages()[,"Package"])]
if(length(novos.pacotes)) install.packages(novos.pacotes)
lapply(lista.de.pacotes, require, character.only = TRUE)

# Definicao da trilha de dados
# Definindo a trilha SE o script estiver dentro da pasta
my.path <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.path)
# Campo Eléctrico de una carga puntual
generarPreguntaCampoElectrico1<-function(){
  carga1<-sprintf("%.2f", sample(seq(-5, 5, 0.3), 1))# Carga aleatoria entre -5 y 5
  carga2<-sprintf("%.2f", sample(seq(-5, 5, 0.3), 1))# Carga aleatoria entre -5 y 5
  x_S<-sprintf("%.2f", sample(seq(-2, 2, 0.1), 1))# Coordenada X de la segunda carga, aleatoria entre -2 y 2
  y_S<-sprintf("%.2f", sample(seq(-2, 2, 0.1), 1))# Coordenada Y de la segunda carga, aleatoria entre -2 y 2
  x_P<-sprintf("%.2f", sample(seq(-2, 2, 0.1), 1))# Coordenada X del punto P, aleatoria entre -2 y 2
  y_P<-sprintf("%.2f", sample(seq(-2, 2, 0.1), 1))# Coordenada Y del punto P, aleatoria entre -2 y 2
  list(
    pregunta=paste0("La carga puntual \\(q_1=", carga1," [nC]\\) se encuentra en el origen y la carga puntual \\(q_2=", carga2," [nC]\\) tiene coor-denadas \\(x_2=", x_S," [cm]\\), \\(y_2=", y_S," [cm]\\). El punto P tiene coordenadas \\(x_P=", x_P," [cm]\\), \\(y_P=", y_P," [cm]\\). a) Calcule los campos eléctricos \\(\\vec{\\mathbf{E_1}}\\) y \\(\\vec{\\mathbf{E_2}}\\) en el punto P debidos a las cargas \\(q_1\\) y \\(q_2\\) respectivamente. Exprese los resultados en componentes. b) Utilice los resultados del inciso a) para obtener el campo total resultante en P, expresado en compo-nentes.")
    )
  }
# Campo eléctrico en la esquina de un cuadrado
generarPreguntaCampoElectrico2<-function(){
  carga<-sprintf("%.2f", sample(seq(-5, 5, 0.3), 1))# Carga aleatoria entre -5 y 5
  lado<-sprintf("%.2f", sample(seq(1, 4, 0.3), 1))# Lado del cuadrado, aleatorio entre 1 y 4
  list(
    pregunta=paste0("Calcule el campo eléctrico en una esquina de un cuadrado de ", lado," [m] de lado si las otras tres esquinas están ocupadas por cargas de ", carga," [\\(\\mu C\\)]. Exprese el resultado en forma de componentes vectoriales (\\(\\vec{\\mathbf{E}} = E_x\\mathbf{\\hat{i}} + E_y\\mathbf{\\hat{j}} + E_z\\mathbf{\\hat{k}}\\)), y enforma de módulo y dirección (\\(\\vec{\\mathbf{E}} = E\\mathbf{\\hat{E}}\\)).")
    )
  }
# Movimiento de una partícula cargada en un campo eléctrico
generarPreguntaCampoElectrico3<-function(){
  tiempo<-sprintf("%.2f", sample(seq(2, 5, 0.3), 1))# Tiempo, aleatorio entre 2 y 5 segundos
  velocidad<-sprintf("%.2f", sample(seq(1, 4, 0.3), 1))# Velocidad inicial, aleatoria entre 1 y 4 m/s
  E_x<-sprintf("%.2f", sample(seq(1, 5, 0.1), 1))# Componente X del campo eléctrico, aleatorio entre 1 y 5 x10^11 N/C
  E_y<-sprintf("%.2f", sample(seq(1, 5, 0.1), 1))# Componente Y del campo eléctrico, aleatorio entre 1 y 5 x 10^11 N/C
  eje<-sample(c("x", "y"), 1)# Dirección del movimiento inicial, aleatoriamente elegida entre "x" y "y"
  list(
    pregunta=paste0("Un   electrón   está   viajando   a   través   de   un   campo   eléctrico   uniforme.   El   campo   es   constante   y   está   dado   por \\(\\vec{\\mathbf{E}} = ", E_x,"\\cdot 10^{11}[\\frac{N}{C}]\\mathbf{\\hat{i}} + ", E_y,"\\cdot 10^{11}[\\frac{N}{C}]\\mathbf{\\hat{j}}\\). En t=0 el electron  está  en  el  origen  y  está  viajando  en  la  dirección  del  eje \\(", eje,"\\)  con  una  velocidad  de  ", velocidad,"[m/s].  ¿Cuál  es  su  posición  ", tiempo,"[s] después?")
    )
  }
# Momento dipolar y torque bajo la acción de un campo en un dipolo eléctrico
generarPreguntaCampoElectrico4<-function(){
  separacion<-sprintf("%.2f", sample(seq(0.1, 1, 0.01), 1))# Separación entre cargas, aleatoria entre 0.1 y 1 nm
  eje<-sample(c("i", "j"), 1)# Dirección del campo eléctrico, aleatoriamente elegida entre "i" y "j"
  E_u<-sprintf("%.2f", sample(seq(1, 5, 0.1), 1))# Intensidad del campo eléctrico, aleatoria entre 1 y 5 x 10^4 N/C
  angulo<-sprintf("%.2f", sample(seq(20, 70, 1), 1))# Ángulo con respecto al campo, aleatorio entre 20 y 70 grados
  list(
    pregunta=paste0("Un   dipolo   consiste   de   cargas   +e   y -e   separadas   por   ", separacion,"[nm].   Está   en   un   campo   eléctrico   uniforme \\(\\vec{\\mathbf{E}} = ", E_u,"\\cdot 10^{4}[\\frac{N}{C}]\\mathbf{\\hat{", eje,"}}\\). a) ¿Cuál es el valor del momento dipolar? b) ¿Cuál es el torque en el dipolo cuando es perpendicular al campo (expresado en forma vectorial)? c) ¿Cuál es la magnitud del torque en el dipolocuando forma un ángulo de ", angulo,"[grados] con respecto al campo?")
  )
  }
# Función para generar exámenes aleatorios
generarExamenAleatorio<-function(numeroExamen){
  preguntasPorExamen<-4# Número de preguntas por examen
  # Lista de preguntas
  tiposDePregunta<-c(
    generarPreguntaCampoElectrico1,
    generarPreguntaCampoElectrico2,
    generarPreguntaCampoElectrico3,
    generarPreguntaCampoElectrico4)
  
  # Seleccionar preguntas según los requisitos
  preguntasSeleccionadas<-sample(tiposDePregunta, preguntasPorExamen, replace=FALSE)
  
  # Preparar las preguntas seleccionadas
  preguntasExamen<-preguntasSeleccionadas
  examen<-lapply(preguntasExamen, function(f)f())
  # Crear un directorio temporal para almacenar archivos de preguntas
  directorioTemporal<-tempdir()
  # Crear el archivo Rmd del examen
  archivoExamenRmd<-file.path(directorioTemporal, paste0("examen_", numeroExamen, ".Rmd"))
  
  # Escribir el encabezado y las preguntas en el archivo Rmd del examen
  cat("---\noutput: pdf_document\n---\n\n", file=archivoExamenRmd)
  cat("# Campos Eléctricos: \n\nNombre: ________________________\n\nFecha: ____________\n\n", file=archivoExamenRmd, append=TRUE)
  for(iinseq_along(examen)){
    cat("## Pregunta ", i, "\n\n", examen[[i]]$pregunta, "\n\n", file=archivoExamenRmd, append=TRUE)
    }
  # Compilar el examen en PDF usando rmarkdown::render()
  archivoExamenPdf<-file.path(directorioTemporal, paste0("examen_", numeroExamen, ".pdf"))
  rmarkdown::render(input=archivoExamenRmd, output_file=archivoExamenPdf, quiet=TRUE)
  archivoExamenPdf
  }
combinarPDFs<-function(archivosPdf, archivoSalida){
  pdf_combine(archivosPdf, output=archivoSalida)
  }
numExamenes<-10
archivosExamenes<-lapply(1:numExamenes, generarExamenAleatorio)
pdfCombinado<-"1_campo_electrico.pdf"
combinarPDFs(unlist(archivosExamenes), pdfCombinado)
  