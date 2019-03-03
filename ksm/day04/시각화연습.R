library(ggplot2)

mpg <- ggplot2::midwest

mpg <- as.data.frame(ggplot2::mpg)
mpg

ggplot(data= mpg, aes(x=displ, y=hwy)) + geom_point()

midwest <- as.data.frame(ggplot2::midwest)
midwest

ggplot(data = midwest, aes(x=poptotal, y=popasian)) + geom_point()+xlim(0,500000)+ylim(0,10000)

library(dplyr)
df_mpg <- mpg %>% 
          group_by(drv) %>%
          summarise(mean_hwy = mean(hwy))
ggplot(data= df_mpg, aes(x=drv, y=mean_hwy)) + 
        geom_col()

ggplot(data = mpg, aes(x=drv, y=hwy)) + geom_boxplot()
