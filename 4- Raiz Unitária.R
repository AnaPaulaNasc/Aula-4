
#Aula 4 - Raizes Unit�rias

#obs. data na forma de ano-m�s-dia  aaaa-mm-dd

                                                      #Instala pacote "Urca"
library("urca"install.packages("urca")  )                                                                 #Carrega Pacote 
library(readxl)
interdaay <- read_excel("C:/Econometria/interdaay.xls",
                        col_types = c("date", "numeric", "numeric", "numeric")) #Le o arquivo xls "Interday"
colnames(interdaay)[3] <- "variacao"                                            #Altera o nome da terceira coluna para variacao
interdaay <- interdaay[,-1]                                                     #Deleta a primeira coluna
dados_diarios <- ts(interdaay, start = 2017-01-10, frequency = 365)             #Cria a Serie Temporal com as tr�s variaveis
plot(dados_diarios, col= "blue", main="Dados do Indice Bovespa", xlab="Dias")   #Plota os tr�s gr�ficos em azul e com as legendas
variacao <- ts(interdaay$variacao, start = 2017-01-10, frequency = 365)               #Cria a serie temporal "variacao" somente da variavel "variacao"
Ibovespa <- ts(interdaay$Ibovespa, start = 2017-01-10, frequency = 365)               #Cria a serie temporal "Ibovespa" somente da variavel "Ibovespa"
Quantidade <- ts(interdaay$Quantidade, start = 2017-01-10, frequency = 365)           #Cria a serie temporal "Quantidade" somente da variavel "Quantidade"
plot(variacao, main="Percentual de Varia��o")                             #Grafico da variacao, com legendas especificadas
plot(Ibovespa, main="Indice do Dia",col="red")                            #Grafico da Ibovespa, com cores e legendas especificadas
plot(Quantidade, main="Indice do Dia", xlab="Dias", col="blue")           #Grafico da Quantidade, com cores, legendas e eixo "x" especificados

                              #Realizando teste DF-Dick-Fuller para Raiz Unit�ria

TesteDF_Variacao_none <- ur.df(variacao, "none",lags = 0)            #Teste DF-DickFuller sem drift e sem tendencia
summary(TesteDF_Variacao_none)                                       #Resumo Estat�stico do Teste
TesteDF_Variacao_drift <- ur.df(variacao, "drift", lags=0)           #Teste DF-DickFuller com drift e sem tendencia
summary(TesteDF_Variacao_drift)                                      #Resumo Estat�stico do Teste
TesteDF_Variacao_trend <- ur.df(variacao, "trend", lags = 0)         #Teste DF-DickFuller com drift e com tendencia
summary(TesteDF_Variacao_trend)                                      #Resumo Estat�stico do Teste

TesteDF_Ibovespa_none <- ur.df(Ibovespa, "none",lags = 0)            #Teste DF-DickFuller sem drift e sem tendencia
summary(TesteDF_Variacao_none)                                       #Resumo Estat�stico do Teste
TesteDF_Ibovespa_drift <- ur.df(Ibovespa, "drift", lags=0)           #Teste DF-DickFuller com drift e sem tendencia
summary(TesteDF_Ibovespa_drift)                                      #Resumo Estat�stico do Teste
TesteDF_Ibovespa_trend <- ur.df(Ibovespa, "trend", lags = 0)         #Teste DF-DickFuller com drift e com tendencia
summary(TesteDF_Ibovespa_trend)                                      #Resumo Estat�stico do Teste

TesteDF_Quantidade_none <- ur.df(Ibovespa, "none",lags = 0)            #Teste DF-DickFuller sem drift e sem tendencia
summary(TesteDF_Variacao_none)                                       #Resumo Estat�stico do Teste
TesteDF_Ibovespa_drift <- ur.df(Ibovespa, "drift", lags=0)           #Teste DF-DickFuller com drift e sem tendencia
summary(TesteDF_Ibovespa_drift)                                      #Resumo Estat�stico do Teste
TesteDF_Ibovespa_trend <- ur.df(variacao, "trend", lags = 0)         #Teste DF-DickFuller com drift e com tendencia
summary(TesteDF_Ibovespa_trend)                                      #Resumo Estat�stico do Teste 


                                             