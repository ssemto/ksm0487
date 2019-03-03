library(dplyr)
exam <- read.csv("excel_exam - 1.csv")
exam

exam %>% filter(class == 2) #row selection
exam %>% filter(class != 3)
exam %>% filter(math > 50)
exam %>% filter(english >= 80)
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class==1|class==3|class==5)
result <- exam %>% filter(class %in% c(1,3,5))

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
class3 <- exam %>% filter(class == 3)
class5 <- exam %>% filter(class == 5)

mean(class1$math)
mean(class2$math)
max(class3$english)
max(class5$english)



##
library(ggplot2)
mpg <- ggplot2::mpg


exam %>% 
  filter(class == 3) %>%
  select(math) 

exam %>% 
  select(math, english) %>% 
  head(10)

exam %>% 
  select(math, english) %>% 
  tail(10)

str(mpg)

mpg <- as.data.frame(ggplot2::mpg)
df <- mpg %>% select(class, cty)
df
str(df)

df_suv <- df %>%  filter(class == "suv")
df_compact <- df %>%  filter(class == "compact")

df_suv
df_compact

mean(df_suv$cty)
mean(df_compact$cty)

df_suv %>% arrange(desc(cty))

exam %>% arrange(class, math)

mpg %>%
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)  


exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
  head



# math > 70,pass, fail
# ifelse(Á¶°Ç, true, false)
# 
exam %>% 
  mutate(result = ifelse(math > 70, "pass" , "fail")) %>% 
  head()






















