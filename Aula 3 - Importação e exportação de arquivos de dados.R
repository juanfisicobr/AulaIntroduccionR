# Curso Introducao ao Software R
# Script para importacao e exportacao de arquivos de dados 
lista.de.pacotes <- c("data.table", "rstudioapi", "easyanova", "ggplot2", "agricolae", "ggpubr", "polynom")
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in% installed.packages()[,"Package"])]
if(length(novos.pacotes)) install.packages(novos.pacotes) 
lapply(lista.de.pacotes, require, character.only = TRUE)
# Defini??o da trilha de dados
# Usando a fun??o setwd
setwd("C:/Users/juanf/OneDrive/Documentos/curriculo/moocs/machine learning com R/introduccion")

# Definindo a trilha SE o script estiver dentro da pasta onde estiver os dados
my.path <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.path)

# Ler o arquivo de dados no formato .csv
dados <- as.data.frame(fread("dados.csv"))

# Ler o arquivo de dados no formato .txt
dados <- as.data.frame(fread("dados.txt"))

# Salvar um arquivo de dados no formato de data frame
fwrite(dados, "jfisico.csv")
fwrite(dados, "jfisico.txt", sep=" ")

# Salvar um arquivo no formato de lista
resultado<-ea1(dados, design = 2)

capture.output(resultado, file = "Resultado_Anova.txt")

# Salvar gr?ficos
# Salvar em .pdf
# Abrir o arquivo em pdf
pdf("Exemplo.pdf") 
# Criar o gr?fico
plot(x = dados$Trat, y = dados$`Var 1`,
     pch = 16, frame = FALSE,
     xlab = "Trat", ylab = "", col = "#2E9FDF")
# Fechar o arquivo em pdf
dev.off() 

# Salvar em .jpeg
# Abrir o arquivo em jpeg
jpeg("Exemplo.jpg", width = 350, height = 350)
# Criar o gr?fico
plot(x = dados$Trat, y = dados$`Var 1`,
     pch = 16, frame = FALSE,
     xlab = "Trat", ylab = "", col = "#2E9FDF")
# Fechar o arquivo em jpeg
dev.off() 

# Salvar em .png
# Abrir o arquivo em png
png("Exemplo.png", width = 350, height = 350)
# Criar o gr?fico
plot(x = dados$Trat, y = dados$`Var 1`,
     pch = 16, frame = FALSE,
     xlab = "Trat", ylab = "", col = "#2E9FDF")
# Fechar o arquivo em jpeg
dev.off() 

# Salvar em .tiff
# Abrir o arquivo em png
tiff("Exemplo.tiff", width = 350, height = 350)
# Criar o gr?fico
plot(x = dados$Trat, y = dados$`Var 1`,
     pch = 16, frame = FALSE,
     xlab = "Trat", ylab = "", col = "#2E9FDF")
# Fechar o arquivo em jpeg
dev.off() 