# Curso Introducao ao Software R
# Script para analise de variancia

# Instalacao e carregamento dos pacotes
lista.de.pacotes <- c("data.table","rstudioapi","easyanova")
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in% installed.packages()[,"Package"])]
if(length(novos.pacotes)) install.packages(novos.pacotes)
lapply(lista.de.pacotes, require, character.only = TRUE)

# Definicao da trilha de dados
# Definindo a trilha SE o script estiver dentro da pasta
my.path <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.path)

# Ler o arquivo de dados
dados <- as.data.frame(fread("dados.csv"))
head(dados)
colnames(dados)<-c("Trat","Rep","Var")
dados$Trat<-as.factor(dados$Trat)

# Rodar anova em DIC só dois variaves para análses
dados1<-dados[,c(1,3)]
resultado<-ea1(dados1, design = 1, alpha = 0.05, plot = 2)
resultado$`Analysis of variance`
resultado$`Residual analysis`

fwrite(resultado$`Analysis of variance`, "ANOVA_DIC.csv")
capture.output(resultado$`Residual analysis`, file = "Residuo_ANOVA_DIC.txt")

# Rodar anova em DBC
resultado<-ea1(dados, design = 2, alpha = 0.05, plot = 2)
resultado$`Analysis of variance`
resultado$`Residual analysis`

fwrite(resultado$`Analysis of variance`, "ANOVA_DBC.csv")
capture.output(resultado$`Residual analysis`, file = "Residuo_ANOVA_DBC.txt")
