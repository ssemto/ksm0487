install.packages("rvest")
library(rvest)
library(dplyr)
##1. 네트워크로 연결
##2. 문서를 읽어야 한다
url <- "http://music.naver.com/listen/top100.nhn?domain=DOMESTIC&duration=1h"
download.file(url, destfile = "navermusic.html", quest = T) 
naver_music <- read_html("navermusic.html");

naver_music
##3. 전처리를 해라(일부데이터 추출 > 열을 뽑아내라) 열:벡터, 전처리
#1. 순위
#2. 순위변동
#3. 노래 제목
#4. 가수
##4. 데이타 프레임에 넣어라

file <- read.csv("C:/ksm/day04/naData.csv")
file
str(file)

mean(file$english)
mean(file$math)
mean(file$class)
mean(file$X)

file$math <- ifelse(is.na(file$math), 0, file$math)
mean(file$math)

