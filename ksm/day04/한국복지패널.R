install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)

install.packages("readxl")
library(readxl)

raw_welfare <- read.spss(file = "C:/ksm/day04/Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare <- raw_welfare

View(welfare)

head(welfare)

summary(welfare)

welfare <- rename(welfare, 
                  gender = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job=h10_eco9,
                  code_region=h10_reg7
)

head(welfare$gender)
head(welfare$marriage)
head(welfare$h_new)
head(welfare$income)
head(welfare$birth)

count(welfare, gender)
welfare$gender

welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)
table(is.na(welfare$gender))

welfare$gender <- ifels(welfare$gender == 1, "남", "여")
table(welfare$gender)

qplot(welfare$gender)

class(welfare$income)
summary(welfare$income)
qplot(welfare$income) + xlim(0,1000)

table(is.na(welfare$income))

welfare$income <- ifelse(welfare$income %in% c(0,9999),NA, welfare$income)
table(is.na(welfare$income))

#성별 월급의 기준
#1. NA는 빼고 분석
#2. 성별로 그룹!(dplyr)
#3. 평균

gender_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(gender) %>%
  summarise(mean_income = mean(income))
gender_income

ggplot(data=gender_income, aes(x=gender, y=mean_income)) + geom_col() 

qplot(welfare$birth)

#income에서 na제거
#나이별 평균 월급
#시각화까지(시계열로!:geom_line())

class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

summary(welfare$birth)
table(is.na(welfare$birth))
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)

qplot(welfare$age)

age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(mean_income = mean(income))

head(age_income)

ggplot(data = age_income, aes(x=age, y=mean_income)) + geom_line()

#연령대별
#평균 월급
welfare <- welfare %>%
      mutate(age2 = ifelse(age < 30, "young", 
                           ifelse(age <= 59, "middle", "old")))

table(welfare$age) #빈도수 정리 테이블
summary(welfare$age)
qplot(welfare$age)

age2_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(mean_income3 = mean(income))
age2_income

age2_income
qqplot(data=age_income2, aes(x=age2, y=mean_income3)) + geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

#연령대+성별 평균 수입
age3_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age2, gender) %>%
  summarise(mean_income4 = mean(income))
age3_income

qqplot(data=age3_income, aes(x=age2, y=mean_income3, fill=gender)) + geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

#나이_성별 평균 월급의 흐름을 알고 싶습니다
#분석 후 시각화(시계열로!)
#시계열인 경우 fill옵션 대신, "col="사용!

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

sex_income

age4_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, gender) %>%
  summarise(mean_income5 = mean(income))
age4_income

library(readxl)
list_job <- read_excel("C:/ksm/day04/Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(welfare$code_job)

dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")
head(welfare$job)

age5_income <- welfare %>%
  filter(!is.na(income) & !is.na(job)) %>%
  group_by(job) %>%
  summarise(mean_income6 = mean(income))
head(age5_income)

age5_income %>%
  arrange(desc(mean_income6)) %>%
  head(10)