install.packages("pdftools")
install.packages("tesseract")
install.packages("tidyverse")
install.packages("stringr")
install.packages("tabulizer")
install.packages("wordcloud")
install.packages("wordcloud2")
install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("utf8")
install.packages("rvest")
install.packages("tidytext")
install.packages("tm")  
install.packages("SnowballC") 
install.packages("wordcloud")  
install.packages("RColorBrewer") 

library("pdftools")
library("tesseract")
library("tidyverse")
library("stringr")
library("tabulizer")
library("tm")
library("SnowballC")
library("wordcloud")
library("utf8")
library("rvest")
library("tidytext")
library("tm")
library("SnowballC")
library("RColorBrewer")
library("wordcloud")


pdf <- 'http://divulgacandcontas.tse.jus.br/candidaturas/oficial/2018/BR/BR/2022802018/280000602477//proposta_1533849607885.pdf'

txt <- pdf_text(pdf)

processamentoTexto <- str_replace(txt, pattern = ",",replacement = "")

#processamentoTexto <- stringr::str_replace_all(processamentoTexto,"[^a-zA-Z\\s]", " ")

processamentoTexto <- removePunctuation(processamentoTexto)

processamentoTexto <- tm_map(processamentoTexto, removeWords, stopwords("portuguese"))

write.table(processamentoTexto, "C:/Users/Andre/Desktop/Governo -  Análise de dados/texto.txt",sep='\n')

write.csv(processamentoTexto,"C:/Users/Andre/Desktop/Governo -  Análise de dados/texto.csv" ,sep = ',')

tetst <- 'C:/Users/Andre/Desktop/Governo -  Análise de dados/texto.txt'

book <- readLines(tetst)

book <- removePunctuation(book)

book <- removeNumbers(book)


write.table(book, "C:/Users/Andre/Desktop/Governo -  Análise de dados/book.txt",sep='\n')

docs <- Corpus(VectorSource(book))


