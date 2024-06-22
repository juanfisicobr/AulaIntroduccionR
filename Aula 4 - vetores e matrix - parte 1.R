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

# Criando um vetor
vet1<-dados[,1]
vet2<-dados[1,]
vet3<-dados[,1]*3
vet4<-dados[,1]+10
vet5<-dados[,1]-5
vet6<-dados[,1]/2
vet7<-dados[,1]^3

# Criando uma matriz
matriz1<-as.matrix(cbind(dados[,1],dados[,3]))
matriz2<-as.matrix(rbind(dados[1,],dados[5,],dados[9,]))
matriz3<-as.matrix(dados[1:3,])
matriz4<-as.matrix(dados[c(1,3,7,9),])
matriz5<-as.matrix(dados[,1:2])
matriz6<-as.matrix(dados[,c(1,3)])
matriz7<-as.matrix(dados[c(1,3,5),c(1,3)])
matriz8<-as.matrix(dados[dados$`Var 1` > 56,])
matriz9<-as.matrix(dados[dados$`Var 1` < 56,])
matriz10<-as.matrix(dados[dados$`Var 1` == 40,])
