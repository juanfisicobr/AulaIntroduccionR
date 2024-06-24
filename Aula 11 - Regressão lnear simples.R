# Curso Introducao ao Software R
# Script para analise de regressao linear simples

# Instalacao e carregamento dos pacotes
lista.de.pacotes <- c("data.table","rstudioapi","ggplot2","dplyr","ggpubr")
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

# Rodar analise de regressao
resultado<-lm(Var~Trat, dados)
anova(resultado)
summary(resultado)

# Rodar a analise utilizando o ggplot2
dados1 <- dados %>% group_by(Trat) %>% 
  summarise(mean=mean(Var),
            sd=sd(Var)) 

p<-ggplot(data=dados1, aes(x=Trat, y=mean)) +
  geom_smooth(method = "lm", se = TRUE)+
  geom_point() +
  geom_errorbar(aes(ymin=mean-3*sd, ymax=mean+3*sd), width=0.2) +
  labs(
    title = "Efeito da dose na produtividade",
    subtitle = "",
    caption = "Source: Dados experimentais",
    x = "Tratamento",
    y = "Produtividade em sacos por hectare"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold", colour = "red", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.x = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 0, vjust = 0, lineheight = 1),
    axis.text.y = element_text(hjust = 0.5, size = 12, face = "plain", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold", colour = "black", family = "sans", angle = 90, vjust = 0, lineheight = 1),
    plot.subtitle = element_text(size = 10, face = "bold", hjust=0.5),
    plot.caption = element_text(face = "italic")) +
  stat_regline_equation(label.x=0, label.y=80) +
  stat_cor(aes(label=after_stat(rr.label)), label.x=0, label.y=75)

p
