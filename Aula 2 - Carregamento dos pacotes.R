# Curso Introducao ao Software R
# Script para instalacao dos pacotes 

# Instalacao e carregamento dos pacotes
lista.de.pacotes <- c("data.table", "rstudioapi", "easyanova", "ggplot2", "agricolae", "ggpubr", "polynom")
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in% installed.packages()[,"Package"])]
if(length(novos.pacotes)) install.packages(novos.pacotes) 
lapply(lista.de.pacotes, require, character.only = TRUE)
