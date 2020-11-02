n <- 1000

x.bar <- 0.6

s.e. <- sqrt(x.bar * (1 - x.bar) / n)

## 99%
c(x.bar - qnorm(0.995) * s.e., x.bar + qnorm(0.995) * s.e.)

## 95%

c(x.bar - qnorm(0.975) * s.e., x.bar + qnorm(0.975) * s.e.)

## 90%

c(x.bar - qnorm(0.95) * s.e., x.bar + qnorm(0.95) * s.e.)

setwd("D:\\Dropbox\\My projects\\Courses\\ST_R\\website\\meetings\\m5\\pres\\data")
STAR <- read.csv("STAR.csv")

n.small <- sum(STAR$classtype == 1 & !is.na(STAR$g4reading))
est.small <- mean(STAR$g4reading[STAR$classtype == 1], na.rm = TRUE)
est.small
se.small <- sd(STAR$g4reading[STAR$classtype == 1], na.rm = TRUE) / sqrt(n.small)
est.small
se.small

n.regular <- sum(STAR$classtype == 2 & !is.na(STAR$classtype) &
                   !is.na(STAR$g4reading))
est.regular <- mean(STAR$g4reading[STAR$classtype == 2], na.rm = TRUE)
se.regular <- sd(STAR$g4reading[STAR$classtype == 2], na.rm = TRUE) /
  sqrt(n.regular)
est.regular

alpha <- 0.05

ci.small <- c(est.small - qnorm(1 - alpha / 2) * se.small,
              est.small + qnorm(1 - alpha / 2) * se.small)
ci.small

ci.regular <- c(est.regular - qnorm(1 - alpha / 2) * se.regular,
                est.regular + qnorm(1 - alpha / 2) * se.regular)
ci.regular

t.test(STAR$g4reading, mu=710)

t.test(STAR$g4reading[STAR$classtype == 1],
       STAR$g4reading[STAR$classtype == 2])



