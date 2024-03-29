<div class="header" style="margin-top:0 px;font-size:60%;">ITASUR: Eighth meeting</div>

Introduction to applied statistics using R
========================================================
author: David Sichinava
date: November 25, 2020
autosize: true
transition: none
css: css/style.css
font-family: 'BPG_upper'
<span style="font-weight:bold; font-family:BPG_upper;">Eighth meeting</span>



Today's plan
========================================================
- Bivariate analysis

How do we assess political polarization?
========================================================

- McCarthy, Poole & Rosenthal (2006): Polarized America: The Dance of Ideology and Unequal Riches. MIT Press
- Polarization of votes in the US congress

How do we assess political polarization?
========================================================

| Variable | Description     |
|----------|-------|
|name | congressman|
|state | state |
|district | district|
|party | party |
|congress | house |
|dwnom1 | DW-NOMINATE dimension 1|
|dwnom2 | DW-NOMINATE dimension 2|

Bivariate relations: 
========================================================

```r
congress <- read.csv("congress.csv")
rep <- congress[congress$party == "Republican", ]
dem <- congress[congress$party == "Democrat", ]
rep80 <- subset(rep, subset = (congress == 80))
dem80 <- subset(dem, subset = (congress == 80))
rep112 <- subset(rep, subset = (congress == 112))
dem112 <- subset(dem, subset = (congress == 112))
```

Bivariate relations: 
========================================================

```r
congress80112 <- subset(congress, subset = (congress == 80 | congress == 112))

ggplot(congress80112, aes(x=dwnom1, y=dwnom2))+
  geom_point(aes(color=party))+
  scale_color_manual(values=c("blue", "green", "red"))+
  facet_wrap(~congress)+
  labs(title="აშშ კონგრესის პოლარიზაცია",
       x="ეკონომიკური ლიბერალიზმი/კონსერვატიზმი",
       y="რასობრივი ლიბერალიზმი/კონსერვატიზმი")
```

Bivariate relations: 
========================================================

```r
dem.median <- tapply(dem$dwnom1, dem$congress, median)
rep.median <- tapply(rep$dwnom1, rep$congress, median)
median <- rbind(dem.median, rep.median)
## tapply() helps us to do calculations by group
```


Correlation: 
========================================================
* z-score
* $z{x}_{i} = \frac{x_{i}-\bar{x}}{S_{x}}$,
where $\bar{x}$ stands for the mean of a districution, $S_{x}$ - stands for the standard deviation

Correlation: 
========================================================
* Pearson's correlation:
* $Corr(x,y) = \frac{1}{n}\Sigma\frac{x_{i}-\bar{x}}{S_{x}}*\frac{y_{i}-\bar{y}}{S_{y}}$

Correlation: 
========================================================

```r
gini <- read.csv("USGini.csv")
```

Correlation: 
========================================================

```r
cor(gini$gini[seq(from = 2, to = nrow(gini), by = 2)],
rep.median - dem.median)
```
