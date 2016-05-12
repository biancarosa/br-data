library(data.table)
library(dplyr)
library(reshape)
library(ggplot2)

setwd("/home/bianca/development/br-data/data")
estatisticas_contribuintes <- "CTB22-1.csv"

data <- tbl_df(read.csv(estatisticas_contribuintes, encoding = "UTF-8", stringsAsFactors = FALSE,nrows = 1128))
colnames(data) <- c("ano","contribuintes","numero_medio_mensal","valor","idade", "estatistica", "sexo")
data$valor <- as.numeric(sub(",",".",data$valor))
data$numero_medio_mensal <- as.numeric(sub(",",".",data$numero_medio_mensal))
data$contribuintes <- as.numeric(sub(",",".",data$contribuintes))
data_por_ano <- data %>% group_by(ano) %>% summarise(sumvalor = sum(valor))
data_por_sexo <- data %>% group_by(sexo) %>% summarise(sumvalor = sum(valor))
data_por_ano_sexo <- data %>% group_by(ano, sexo) %>% summarise(sumvalor = sum(valor))