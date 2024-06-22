# Curso Introducao ao Software R
# Script para criacao de objetos 

# Instalacao e carregamento dos pacotes
lista.de.pacotes <- c("data.table", "rstudioapi")
novos.pacotes <- lista.de.pacotes[!(lista.de.pacotes %in% installed.packages()[,"Package"])]
if(length(novos.pacotes)) install.packages(novos.pacotes) 
lapply(lista.de.pacotes, require, character.only = TRUE)

# Definicao da trilha de dados
# Definindo a trilha SE o script estiver dentro da pasta
my.path <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.path)

# Ler o arquivo de dados no formato .csv
dados <- as.data.frame(fread("dados.csv"))

# Criando data frames
dados1<-data.frame(Trat=dados[1:3,1], Var=dados[1:3,3])
dados2<-data.frame(Trat=dados[c(1,3,5,7,9),1], Var=dados[c(1,3,5,7,9),3])
dados3<-data.frame(Trat=dados[dados$`Var 1`>30,1], Var=dados[dados$`Var 1`>30,3])

# Criando listas
estatistica_descritiva<-list(media=colMeans(dados),
                             mediana=median(dados[,3]),
                             variancia=var(dados[,3]),
                             coeficiente_de_variacao=100*(mean(dados[,3])/sd(dados[,3])),
                             Top=dados[dados$`Var 1`>50,])
