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
colnames(dados)<-c("Trat","Rep","Var")

# Montando o histograma
annotations <- data.frame(
  x = c(round(min(dados$Var), 2), round(mean(dados$Var), 2), round(max(dados$Var), 2)),
  y = c(0.01, 0.02, 0.01),
  label = c("Min:", "Media:", "Max:")
) 

p<-ggplot(dados, aes(Var)) +
  geom_histogram(aes(y = after_stat(density)), color = "black", fill = "red",bins = 5) +
  geom_density(color = "black", fill = "green", alpha=0.6) +
  geom_vline(aes(xintercept = mean(Var)), color = "#000000", linewidth = 1.25) +
  geom_vline(aes(xintercept = mean(Var) + sd(Var)), color = "#000000", linewidth = 1, linetype = "dashed") +
  geom_vline(aes(xintercept = mean(Var) - sd(Var)), color = "#000000", linewidth = 1, linetype = "dashed") +
  geom_text(data = annotations, aes(x = x, y = y, label = paste(label, x)), size = 5, fontface = "bold") +
  theme_classic() +
  labs(
    title = "Histograma de Prova",
    subtitle = "Produtividade",
    caption = "Source: Dados inventados",
    x = "Sacos por hectare",
    y = "Densidade"
  ) +
  theme(
    plot.title = element_text(color = "red", size = 16, face = "bold", hjust=0.5),
    plot.subtitle = element_text(size = 10, face = "bold", hjust=0.5),
    plot.caption = element_text(face = "italic")
  )
p

# Salvando o grafico
pdf("Histograma.pdf")
print(p)
dev.off()

png("Histograma.png")
print(p)
dev.off()

jpeg("Histograma.jpg")
print(p)
dev.off()

tiff("Histograma.tiff")
print(p)
dev.off()