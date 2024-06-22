# Curso Introducao ao Software R
# Script para elaboracao de graficos boxplot

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
dados$Trat<-as.factor(dados$Trat)

# Fazendo o boxplot
get_box_stats <- function(y, upper_limit = max(y) * 1.3) {
  return(data.frame(
    y = 0.95 * upper_limit,
    label = paste(
      "N =", length(y), "\n",
      "Média =", round(mean(y), 2), "\n",
      "Mediana =", round(median(y), 2), "\n"
    )
  ))
}

p<-ggplot(dados, aes(x = Trat, y = Var, fill=Trat)) +
  geom_boxplot() +
  scale_fill_manual(values = c("red", "green", "blue","yellow")) +
  stat_summary(fun.data = get_box_stats, geom = "text", hjust = 0.5, vjust = 0.9) +
  theme_classic()
p

p<-ggplot(dados, aes(x = Trat, y = Var, fill=Trat)) +
  geom_boxplot() +
  scale_fill_manual(values = c("red", "green", "blue","yellow")) +
  stat_summary(fun.data = get_box_stats, geom = "text", hjust = 0.5, vjust = 0.9) +
  labs(
    title = "Produtividade em cada tratamento",
    subtitle = "",
    caption = "Source: Dados experimentais",
    x = "Tratamentos",
    y = "Produtividade"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold", colour = "red", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.x = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.y = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    plot.subtitle = element_text(size = 10, face = "bold", hjust=0.5),
    plot.caption = element_text(face = "italic"))
p

p<-ggplot(dados, aes(x = Trat, y = Var, fill=Trat)) +
  geom_boxplot() +
  scale_fill_manual(values = c("red", "green", "blue","yellow")) +
  stat_summary(fun.data = get_box_stats, geom = "text", hjust = 0.5, vjust = 0.9) + 
  stat_summary(fun = "mean", geom = "point", shape = 2, size = 3, color = "black") +
  labs(
    title = "Produtividade em cada tratamento",
    subtitle = "",
    caption = "Source: Dados experimentais",
    x = "Tratamentos",
    y = "Produtividade"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold", colour = "red", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.x = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.y = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    plot.subtitle = element_text(size = 10, face = "bold", hjust=0.5),
    plot.caption = element_text(face = "italic"))
p
# Criando o gráfico de dispersão com cores monocromáticas
q<-ggplot(dados, aes(x = Trat, y = Var, fill=Trat)) +
  geom_boxplot() + 
  scale_fill_manual(values = c("#434343","#5d5d5d","#808080","#999999")) +
  stat_summary(fun.data = get_box_stats, geom = "text", hjust = 0.5, vjust = 0.9) + 
  stat_summary(fun = "mean", geom = "point", shape = 2, size = 3, color = "black") +
  labs(
    title = "Produtividade em cada tratamento",
    subtitle = "",
    caption = "Source: Dados experimentais",
    x = "Tratamentos",
    y = "Produtividade"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold", colour = "red", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.x = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.y = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    plot.subtitle = element_text(size = 10, face = "bold", hjust=0.5),
    plot.caption = element_text(face = "italic"))
q
# Salvando o grafico
pdf("Boxplot.pdf")
print(p)
dev.off()

png("Boxplot.png")
print(p)
dev.off()

jpeg("Boxplot.jpg")
print(p)
dev.off()

tiff("Boxplot.tiff")
print(p)
dev.off()