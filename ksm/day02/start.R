a <- 100
b <- 200

print(a+b)

# 주석(설명)

#프로그램 전체 제어 
 #1. 프로그램은 순차적으로 실행
 #2. 조건
 #3. 반복
#데이터의 자료구조
 #데이터프레임=벡터(열)+리스트(행)

name <- C(1, 2, 3, 4, 5)

name[3] #인덱스[]사용
print(name[3])

name[3] <- 333

str(name) #구조
table(name) #요약
calss(name) #데이터의 타입
typeof(name) #데이터의 타입(상세)

name <- c("김지훈", "이유진", "박동현", "김민지")
eng <- c(90,80,60,70)
math <- c(50,60,100,20)

#자동완성(컨트롤+스페이스)
midTerm <- data.frame(eng, math)

str(midTerm) #구조
table(midTerm) #요약
class(midTerm) #데이터의 타입
typeof(midTerm) #데이터의 타입(상세)


View(midTerm)

#####################################################
#2. 직접 데이터프레임을 만들어봅시다.
lastTerm <- data.frame(name2 = c("song", "kim", "park"),
                       eng2 = c(100, 50, 80),
                       math2 = c(50,60,100))
  
View(lastTerm)

lastTerm$name2
lastTerm$eng2
lastTerm$math2

str(lastTerm$name2)
str(lastTerm$eng2)
table(lastTerm$math2)
table(lastTerm)

test <- c("apple", "banana", "kiwi", "apple", "banana", "apple")
table(test)

mean(lastTerm$eng2)
mean(lastTerm$math2)

midTerm2 <- read.csv("C:/ksm/day02/midTest2.csv")
View(midTerm2)

str(midTerm2)

name <- c('kim', 'park', 'moon')
name
name <- c(1, 2, 3, 4, 5)
name

library("readxl")
midTerm3 <- read_excel("C:/ksm/day02/midTest3.xlsx")
View(midTerm3)
str(midTerm3)

rm(midTerm3)   #변수 삭제
ls() #변수들의 리스트
list <- ls()
class(list)
rm(ls())
rm(list = ls())
ls()

midTerm3
midTerm3$name
midTerm3$age

subMidTerm <- data.frame(midTerm3$name,
                         midTerm3$tel
                         )
subMidTerm

subMidTerm2 <- data.frame(name2 = midTerm3$name,
                          tel2 = midTerm3$tel
                          )

subMidTerm2

write.csv(subMidTerm2, file = "subMidTerm2.csv")

subMidTerm2
subMidTerm2$age2 <- c(20,30,40)

addr <- c('서울', '부산', '경기도')
addr

# addr을 만들어야 함 
subMidTerm2$addr <- addr
subMidTerm2

names(subMidTerm2)

# 인덱스로 불러오는 것 반복문을 통해 편리하게 쓸수있음
#행과 열 추출
subMidTerm2[1] #열추출(열의 인덱스를 가져옴) => name2
subMidTerm2[1,]
subMidTerm2[2,]
subMidTerm2[1,1]
subMidTerm2
subMidTerm2[2,1]
subMidTerm2[1,3]
subMidTerm2[,3]
subMidTerm2[3,3]

#행,열삭제
subMidTerm2[,-1]
subMidTerm2
subMidTerm3 <- subMidTerm2[,-1]
subMidTerm3
subMidTerm2

subMidTerm4 <- subMidTerm2[-1,]
subMidTerm4

subMidTerm5 <- subMidTerm2[, -c(2:4)] # :의 의미는 ~
subMidTerm5

subMidTerm6 <- subMidTerm2[, -c(1,3)] #선택적으로 구분하려면 쉼표사용
subMidTerm6

temp1 <- c(1:100)
temp1

temp2 <- c(1,3,5,7,9)
temp2

a <- 100
b <- 200
c <- 100
print(a == b) #비교의 결과는 참(true)/거짓(false)이다.

# 제어문 안에 조건이 true일 때만 실행됨.
if(a != b){
  print("두수가 달라요")
  print("끝")
} 

##############################################
#순차적실행이 기본
#조건문(조건에따라서 다르게 처리해야하는 경우)
#반복문(여러번 반복해서 처리해야하는 경우)

i <- 2
if(i < 5){
  print("5보다 작아요")
} else{
  print("5보다 커요")
}

i2 <- '빅데이터'
if(i2 == '빅데이터'){
  print("빅데이터반이 맞군요")
} else if(i2 == '파이썬')
  {
  print("파이썬반이군요")
}else
  {
  print('아무 반도 아니군요')
}

i3 <- '사과'
if(i3 == '사과'){
  print("제철이군요")
} else if(i3 == '배'){
  print("설에 먹어요")
} else if(i3 == '키위'){
  print("수입이에요")
} else{
  print("아무것도 아니면 과일이 아닌가봐요")
} 

install.packages("lubridate")
library(lubridate)

now()
date <- now()
date

year(date)
month(date)
day(date)
wday(date, label = T)
wday(date, label = F)
hour(date)
minute(date)
second(date)

# 11시 전이면 굿모닝
# 15시 전이면 굿에프터눈
# 20시 전이면 굿이브닝
# 기타이면 굿나잇

date2 <- now()
date+minute(10) #date에 10분을 더한 날짜와 시각
date3 <- date+minute(10)
date3
if(date2 < date3){
  print('굿모닝')
} else if(date2 > date3){
  print('굿에프터눈')
} else if(date2 < date3){
  print('굿이브닝')
} else{
  print('굿나잇')
}

##########################################################
#입력받은 값 판별
input <- scan(what = "")

if(input == '100점'){
  print('만점입니다')
} else {
  print('다음 기회에')
}

#삼항 연산자
temp3 <- 80
result <- ifelse(temp3 >= 80, '통과','실패')
result

temp4 <- 10
while(temp4 > 7) {
  print('7보다 크군요')
  temp4 < temp4 - 1
} 

temp5 <- c(1:5)
temp5
for(temp6 in temp5){
  print(temp6)
}

name <- c('김아무개','박아무개','송아무개','정아무개')
for(temp8 in name){
  cat('당신의 이름은'+ temp8 + '이군요\n')
}
 
student <- data.frame(name2 = name,
                      age = c(30, 50, 15, 45)
                     )
student

for(temp9 in student$name2){
  print(temp9)
}

input2 <- scan()
while(TURE){
  input2 <- scan()
  print(input2)
  if(input2 == 0){
    print('종료합니다')
    break
  }
}