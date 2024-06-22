# Curso Introducao ao Software R
# Script para elaboracao de graficos de barras

# Instalacao e carregamento dos pacotes
lista.de.pacotes <- c("data.table","rstudioapi","ggplot2")
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

# Criando o arquivo de medias
dados1<-aggregate.data.frame(dados[,3], by = list(dados$Trat), FUN = mean)
colnames(dados1)<-c("Trat","Var")
dados1

dados1$Trat<-as.factor(dados1$Trat)

# Grafico de barras tradicional
p <- ggplot(dados1,aes(x=Trat, y=Var)) +
  geom_bar(stat="identity", fill= "yellow", color="black") +
  xlab("Tratamento") +
  ylim(0,100) +
  # xlim(0,100) +
  ylab("Variavel 1") +
  ggtitle("Distribuicao dos dados") +
  geom_text(aes(label = Var), hjust = -0.25, angle=90) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold", colour = "red", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.x = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.y = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1))

p

# Grafico de barras com adicao da linha horizontal
p <- ggplot(dados1,aes(x=Trat, y=Var)) +
  geom_bar(stat="identity", fill= "yellow", color="black") +
  xlab("Tratamento") +
  ylim(0,100) +
  # xlim(0,100) +
  ylab("Variavel 1") +
  ggtitle("Distribuicao dos dados") +
  geom_text(aes(label = Var), hjust = -0.25, angle=90) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold", colour = "red", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.x = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.y = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1)) +
  geom_hline(yintercept = mean(dados1$Var), color="green", linewidth=1)

p

# Salvando o grafico
pdf("Grafico de barras.pdf")
print(p)
dev.off()

png("Grafico de barras.png")
print(p)
dev.off()

jpeg("Grafico de barras.jpg")
print(p)
dev.off()

tiff("Grafico de barras.tiff")
print(p)
dev.off()