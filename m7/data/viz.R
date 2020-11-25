library(ggplot2) # install.packages("ggplot2")
windowsFonts()

setwd("D:\\Dropbox\\My projects\\Courses\\QT_Analysis\\website\\pages\\m8\\pres\\data")

data(diamonds)

my_chart <- ggplot(diamonds)

summary(my_chart)

my_chart +
  aes(carat, price)+
  geom_point()

ggplot(diamonds, aes(carat, price))+
  geom_point(aes(color=cut))+
  geom_smooth()+
  labs(title="Beautiful chart",
       x="Carat",
       y="Price, $")+
  facet_wrap(~cut)

minwage <- read.csv("minwage.csv")

restaurant_freq <- as.data.frame(table(minwage$chain, minwage$location))

names(restaurant_freq) <- c("chain", "area", "frequency")

ggplot(restaurant_freq, aes(chain, frequency))+
  geom_col(aes(fill=chain))+
  scale_fill_manual(values = c("#674A32", "#21252B", "#6B6C6A", "#BABABA"))+
  facet_wrap(~area)+
  labs(title="Fast food restaurants",
       subtitle = "წყარო: Card & Krueger, 1994",
       x="ქსელი",
       y="რ-ნობა")+
  theme_minimal()+
  theme(
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.title = element_blank(),
    title = element_text(family = "TT Times New Roman")
  )  

