installed.packages("dplyr")
library(dplyr)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

df_new <- rename(df_new, v2 = var2)
df_new

################################################

library("daymetr")

exam <- read.csv("C:/ksm/day03/excel_exam.csv")
View(exam)

exam %>% filter(class == 1) %>% head(3)

class1 <- exam %>% filter(class ==1)
class2 <- exam %>% filter(class ==2)
class3 <- exam %>% filter(class ==3)
class4 <- exam %>% filter(class ==4)

classNot1 <- exam %>% filter(calss != 1)
classNot1

exam %>% filter(english <= 80 & class == 3 )

exam %>% filter(math >= 80 & science >= 85)

exam %>% filter(math >= 80 | science >= 85) 
exam %>% filter(math >= 80 | science >= 85) 

#아래 두 줄은 1,3,5학년만 출력! 같은 결과로 출력!
exam %>% filter(class == 1 | class == 3 | class ==5)
exam %>% filter(class %in% c(1,3,5))

mean(class1$math)
max(class1$math)
min(class1$math)
sum(class1$math)

#dplyr package + dataset 연습하기 좋음
install.packages("ggplot2")
library("ggplot2")

mpg <- as.data.frame(ggplot2::mpg)
mpg %>% head(20)

#1.ford차량 row 추출
mpg %>% filter(manufacturer == "ford")

ford1 <- mpg %>% filter(manufacturer == "ford")
ford1

#2.고속도로 연비 추출
mean(ford1$hwy)
#3.평균

#1.class가 compact의 고속도로 연비
ford2 <- mpg %>% filter(class == "compact")
ford2
mean(ford2$hwy)

#2.class가 suv의 고속도로 평균 연비
ford3 <- mpg %>% filter(class == "suv")
ford3
mean(ford3$hwy)

exam

exam %>% select(math)
exam %>% select(-math)
exam %>% select(-english,science) 
exam %>% select(-math,-english,science) 

exam
exam %>% 
  filter(class == 1) %>% 
  select(english) %>%
  head()

#R은 들여쓰기 의미가 없음
#들여쓰는 이유는 가독성때문
#파이썬은 들여쓰기가 문법의 일부
#파이썬은 들여쓰기를 반드시 해야 함

exam %>% arrange(math)
#class를 먼저 정렬하고 math를 정렬
exam %>% arrange(class, math)
#desc 내림차순
exam %>% arrange(desc(class), math)

#파생변수 함수:mutate
exam <- exam %>% mutate(total = math + english + science)
View(exam)

#mean:평균
#median:중간값
exam %>% group_by(class)
exam %>%
  group_by(class) %>%
  summarise(meanMath = mean(math),
            sumMath = sum(math),
            median = median(math),
            n = n()
  )

View(mpg)

mpg %>% 
  group_by(manufacturer) %>%
  filter(class == "suv") %>%
  mutate(tot = (cty+hwy)/2) %>%
  summarise(meanTot = mean(tot)) %>%
  arrange(desc(meanTot)) %>%
  head(5)

