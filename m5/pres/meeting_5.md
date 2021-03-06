<div class="header" style="margin-top:0 px;font-size:60%;">ITASUR: Fifth Meeting</div>

Introduction to applied statistics using R
========================================================
author: David Sichinava, Ph.D.
date: October 28, 2020
autosize: true
transition: none
css: css/style.css
font-family: 'BPG_upper'
<span style="font-weight:bold; font-family:BPG_upper;">Fifth Meeting</span>


Today's plan
========================================================

* Uncertainty
	+ Parameters and estimates
	+ Hypothesis testing
* One and two samples t-test

Estimation
========================================================
* Parameters and estimates
* Random sample: we are trying to _estimate_ population parameters

Estimation: An ideal case
========================================================
* Estimation error = $\overline{X}_{n} - p$
* We almost _never_ know what real error of our estimates are, therefore it is important to calculate _an average magnitude of estimation error_
* In theory, we could've done multiple polls as the same time and then calculate magnitude of errors, but that's rarely the case.

Estimation: An ideal case
========================================================
* The key principe of _frequentist_ statistics is that our variables need to be random variables. For instance, if we are conducting the same experiment (or a survey) multiple times, and the results are indepdent from each other, these variables are _random variables_. Therefore, estimation errors are also _independent_
* This assumption is very important, as estimation error also will be a _random variable_

$\mathbb{E}(\overline{X}_{n}) = \frac{1}{n}\sum \mathbb{E}(X_{i}) = \mathbb{E}(X)$

Estimation: average treatment effect of sample and population
========================================================
* Unbiased and consistent estimate
	+ In case of repeated random samples, the expectation of an estimate conicides with the parameter;
	+ While estimate approaches the parameter in a large number of experiments;
* That is, sample mean is generally good way of estimating population parameters

Estimation: average treatment effect of sample and population
========================================================
* In RCTs, the difference between treatment and control groups, is an unbiased estimate of the sample average treatment effect:
	+ remember we cannot directly observe SATE (a.k.a., Schroedinger's Cat), therefore, our difference-in-means estimator is an unbiased estimate of SATE
* Our estimate is also unbiased and consistent in case of population average treatmetn effect (PATE).

Standard error of an estimate
========================================================
* If unbiased estimates fluctuates greatly, then it has less practical value;
* We can take a look at the _standard error_ of estimate.
* $s^2 = \sqrt{\sum_{i=1}^n (y_i - \bar{y})^2}$

Confidence intervals
========================================================
* When studing the characteristics of estimates, we need to look on the whole sampling distribution, not only means and standard deviations.
* For this, we have to use so called _theoretical distribution_. In practice, we can assume that _central limit theorem_ works and the distribution of sample means approaches to normal.
* If we have independent and similarly distributed random values, their means approach sample distribution mean, when the number of these random variables increase to infinity
* If these assumptions are met, we can use _confidence intervals_

Confidence intervals
========================================================
* Confidence interval is an interval where according to an agreed probability, there exist our parameter of interest:
* $CI(\alpha) = [\overline{X}_{n}-z_{\alpha/2}*se; \overline{X}_{n}+z_{\alpha/2}*se; ]$
* As we can see, $z$-values depend on the _type of distribution_


Confidence intervals
========================================================

```r
n <- 1000 # Sample
x.bar <- 0.6 #  Point estimate
s.e. <- sqrt(x.bar * (1 - x.bar) / n) # Standard error
## 99% CI
c(x.bar - qnorm(0.995) * s.e., x.bar + qnorm(0.995) * s.e.)

## 95% CI
c(x.bar - qnorm(0.975) * s.e., x.bar + qnorm(0.975) * s.e.)

## 90% CI
c(x.bar - qnorm(0.95) * s.e., x.bar + qnorm(0.95) * s.e.)
```

Analysis of experiment
========================================================

```r
STAR <- read.csv("STAR.csv", head = TRUE)
```

Analysis of experiment
========================================================

```r
n.small <-
sum(STAR$classtype == 1 & !is.na(STAR$g4reading))
est.small <- mean(STAR$g4reading[STAR$classtype == 1], na.rm = TRUE)
se.small <- sd(STAR$g4reading[STAR$classtype == 1], na.rm = TRUE) /
sqrt(n.small)
est.small
se.small
n.regular <- sum(STAR$classtype == 2 & !is.na(STAR$classtype) &
!is.na(STAR$g4reading))
```

Analysis of experiment
========================================================

```r
est.regular <- mean(STAR$g4reading[STAR$classtype == 2], na.rm = TRUE)
se.regular <- sd(STAR$g4reading[STAR$classtype == 2], na.rm = TRUE) /
sqrt(n.regular)
est.regular
```

Analysis of experiment
========================================================

```r
alpha <- 0.05

ci.small <- c(est.small - qnorm(1 - alpha / 2) * se.small,
est.small + qnorm(1 - alpha / 2) * se.small)
ci.small

ci.regular <- c(est.regular - qnorm(1 - alpha / 2) * se.regular,
est.regular + qnorm(1 - alpha / 2) * se.regular)
ci.regular
```

Analysis of experiment
========================================================

```r
# Sample average treatment effect of an experiment
ate.est <- est.small - est.regular
ate.se <- sqrt(se.small^2 + se.regular^2)
ate.ci <- c(ate.est - qnorm(1 - alpha / 2) * ate.se,
ate.est + qnorm(1 - alpha / 2) * ate.se)
ate.ci
```

Analysis of experiment: Student's t-test
========================================================

```r
c(est.small - qt(0.975, df = n.small - 1) * se.small,
est.small + qt(0.975, df = n.small - 1) * se.small)
ci.small
c(est.regular - qt(0.975, df = n.regular - 1) * se.regular,
est.regular + qt(0.975, df = n.regular - 1) * se.regular)
ci.regular

t.ci <- t.test(STAR$g4reading[STAR$classtype == 1],
STAR$g4reading[STAR$classtype == 2])
t.ci
```

Hypothesis testing
========================================================
* Hypothesis testing of a phenomenon is based on a _probability approach_,
	+ or proving whether given phenomenon is a random or not
* _Reductio ad absurdum_
* Null hypothesis $H_{0}$

Hypothesis testing
========================================================
Null hypothesis ⇒ Test statistic ⇒ Reference statistic ⇒ Calculating probability of whether a test statistic is present in  reference statistic

Hypothesis testing
========================================================
| Result |Rejecting $H_{0}$ | Retaining $H_{0}$ |
|--------|-----------|------------------|-------------------|
| $H_{0}$ True | Type I error | True        |
| $H_{0}$ False    | True       | Type II error |

Hypothesis testing
========================================================
* How do we decide whether we have to accept or reject null hypothesis?
	+ We have to quantify the degree to which the existence of a test statistic is very low, given null hypothesis
	+ p-values


Hypothesis testing
========================================================
> Little p-value, What are you trying to say, Of significance?

_Stephen T. Ziliak, Roosvelt University_


Hypothesis testing
========================================================
* Statistical significance;
* Probability of having an extreme value that is as extreme as test statistic, given null hypothesis.
* [For instance:](http://blog.minitab.com/blog/adventures-in-statistics-2/how-to-correctly-interpret-p-values): 
* We are checking a new COVID-19 🦠 vaccince, for which we have conducted an experiment. Imagine, that temperature decreased in the treatment group, although p-value equals to 0.04.
* What this means is that if _the faccine was ineffective (that is, null hypothesis was correct)_, we would receive a difference between treatment and control groups in the 4% of all future experiments.
* $p$-value is not a probability of making a mistake!


Hypothesis testing
========================================================
* Similar to confidence intervals, we also choose a specific level:
	+ 95% or 99%
<img src="img/neyman.PNG" alt="Drawing" style="width: 600px; display: block; margin-left: auto; margin-right: auto; margin-top: 30px;"/>

Neyman, J. (1937). Outline of a theory of statistical estimation based on the classical theory of probability. _Philosophical Transactions of the Royal Society of London._ Series A, Mathematical and Physical Sciences, 236(767), 333-380.


Hypothesis testing
========================================================
* P-values for one and two sample tests

Hypothesis testing
========================================================
* One sample t-test:
	+ Population mean equals to a particular number;
* Two samples t-test:
	+ Means of two populations are equal.

Hypothesis testing and confidence intervals
========================================================
* z-scores for confidence intervals:
	+ $\frac{\overline{X}_{n}-\mathbb{E}_{X}}{Standard\ Error}$
* z-scores for $p$-values:
	+ $\frac{\overline{X}_{n}-\mu_{0}}{Standard\ Error}$


STAR-project
========================================================
One sample t-test

```r
t.test(STAR$g4reading, mu = 710)
```

STAR-project
========================================================
Two samples t-test

```r
t.test(STAR$g4reading[STAR$classtype == 1],
STAR$g4reading[STAR$classtype == 2])
```

Labor marker discrimination
========================================================


```r
resume <- read.csv("resume.csv")
x <- table(resume$race, resume$call)
prop.test(x, alternative = "greater")
```

