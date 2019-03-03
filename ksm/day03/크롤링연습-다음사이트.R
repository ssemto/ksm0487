install.packages("rvest")
library(rvest)

url <- "http://www.daum.net"
htmlText <- read_html(url)
htmlText

news <- html_nodes(html_text, "#news")
news

product1 <- html_nodes(htmlText, ".screen_out")
product1

#html_nodes:조건에 맞는태그 다 가져옴
product2 <- html_nodes(htmlText, "h2")
product2

product1Text <- html_text(product1)
product1Text

product4 <- html_nodes(htmlText, ".screen_out")
product4

product1Text4 <- html_text(product4)
product1Text4