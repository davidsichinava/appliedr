n <- 1000 # Sample

x.bar <- 0.6 #  Point estimate

s.e. <- sqrt(x.bar * (1 - x.bar) / n) # Standard error

## 99% CI

(1-0.995)*2

c(x.bar - qnorm(0.995) * s.e., x.bar + qnorm(0.995) * s.e.)

## 95% CI
c(x.bar - qnorm(0.975) * s.e., x.bar + qnorm(0.975) * s.e.)

## 90% CI
c(x.bar - qnorm(0.95) * s.e., x.bar + qnorm(0.95) * s.e.)


### STAR

setwd("D:\\Dropbox\\My projects\\Courses\\Applied-R\\presentations\\m5\\pres\\data")

star <- read.csv("STAR.csv")

table(star$classtype)

t.test(star$g4math[star$classtype == 1], star$g4math[star$classtype == 2])

t.test(star$g4reading[star$classtype == 1], star$g4reading[star$classtype == 2])

resume <- read.csv("resume.csv")

names(resume)

summary(resume)

chisq.test(resume$call, resume$race)
