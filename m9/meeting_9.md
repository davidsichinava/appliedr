<div class="header" style="margin-top:0 px;font-size:60%;">ITASUR: Ninth meeting</div>

Introduction to applied statistics using R
========================================================
author: David Sichinava
date: December 16, 2022
autosize: true
transition: none
css: css/style.css
font-family: 'BPG_upper'
<span style="font-weight:bold; font-family:BPG_upper;">Ninth meeting</span>



Today's topic
========================================================
- Linear regression

Who is more competent?
========================================================
<img src="img/two_candidates.jpg" alt="Drawing" style="width: 600px; display: block; margin-left: auto; margin-right: auto; margin-top: 30px;"/>


Appearance and "electability"
========================================================
* Todorov et. al. (2005)
“Inferences of competence from faces predict election outcomes.” Science, vol. 308, no. 10 (June), pp. 1623–1626.

* How can one predict election results based on facial appearance?


Variables:
========================================================
| Variable   | Description                              |
|----------|-------------------------------------|
| congress | Session of Congress                   |
| year     | Year of the election                     |
| state    | State of the election                               |
| winner   | Name of the winner                        |
| loser    | Name of the runner-up                        |
| w.party  | Party of the winner      |
| l.party  | Party of the loser      |
| d.votes  | Number of votes for the Democratic candidate          |
| r.votes  | Number of votes for the Republican candidate       |
| d.comp   | Competence measure for the Democratic candidate    |
| r.comp   | Competence measure for the Republican candidate |

Data:
========================================================

```r
## Read your data
## Download it from here: https://goo.gl/xYSjCr
face <- read.csv("face.csv")
## two-party vote share for Democrats and Republicans
face$d.share <- face$d.votes / (face$d.votes + face$r.votes)
face$r.share <- face$r.votes / (face$d.votes + face$r.votes)
face$diff.share <- face$d.share - face$r.share
```
Correlation:
========================================================
* What is the correlation between perceived competence and vote share differential?


```r
cor(face$d.comp, face$diff.share)
```

Correlation:
========================================================

```r
library(ggplot2)
ggplot(face, aes(x=d.comp, y=diff.share)) +
         geom_point(aes(color=w.party))+
        labs(title="Facial competence and vote share",
             x="Competence scores for Democrats",
             y="Competence scores for Republicans")+
      scale_color_manual(name="Winning party",
                           values=c("blue", "red"))
```

Linear relationship:
========================================================

$Y = \alpha + \beta X + \epsilon$, 
where $\alpha$ is an intercept, $X$ independent (explanatory) variable, $\beta$ - regression coefficientS, $\epsilon$ error term.


Linear relationship:
========================================================
<img src="img/box.png" alt="Drawing" style="width: 600px; display: block; margin-left: auto; margin-right: auto; margin-top: 30px;"/>

Linear relationship:
========================================================

* All models are wrong, but some are useful;
* Our goal is to assess _data-generating process_
* Therefore, in all models, we present _estimated coefficients_

Linear relationship:
========================================================
$\hat{Y} = \hat{\alpha}+\hat{\beta} x$, where $x$ is some value of $X$;

Linear relationship:
========================================================
$\hat{\epsilon} = Y-\hat{Y}$, where $x$ is some value of $X$;

Linear relationship:
========================================================

```r
fit <- lm(diff.share ~ d.comp, data = face) # fit the model
fit
```

Regression plot:
========================================================

```r
ggplot(face, aes(x=d.comp, y=diff.share)) +
	geom_point(aes(color=w.party))+
	geom_smooth(method='lm')+
	labs(title="Facial competence and vote share",
		x="Competence scores for Democrats",
		y="Competence scores for Republicans")+
	scale_color_manual(name="Winning party",
		values=c("blue", "red"))
```


Linear relationship:
========================================================
$\hat{Y} = \hat{\alpha}+\hat{\beta} x$, where $x$ represents values of $X$ 

Linear relationship:
========================================================
$\hat{\epsilon} = Y-\hat{Y}$, where $x$ represents values of $X$ 

How do we interpret this?
========================================================
* Indeed, predicted and actual values differ;
* Our goal is to find _the best fit_, that is, a line that fits our data the best.

Least square method
========================================================
* Helps us to find the best linear fit
* We are picking those parameters which yield _least residuals_

Least square method
========================================================
* Sum of squared errors
* $SSR = \sum_{n}^{i=1}\hat\epsilon^2_{i}=\sum_{n}^{i=1}(Y_{i}-\hat{Y}_{i})=\sum_{n}^{i=1}(Y_{i}-\hat\alpha+\hat\beta X_{i})$
* Root mean square error
$RMSE=\sqrt{\frac{1}{n}SSR}=\sqrt{\frac{1}{n}\sum_{n}^{i=1}\hat\epsilon^2_{i}}$

Least square method
========================================================
* We can find a line with least squared errors
* $\hat\alpha=\frac{(\Sigma y) (\Sigma x^2)-(\Sigma x\Sigma xy)}{n\Sigma x^2-(\Sigma x)^2}$
* $\hat\beta=\frac{n(\Sigma xy)-(\Sigma x)(\Sigma y)}{n\Sigma x^2-(\Sigma x)^2}$

Regression coefficient
========================================================
$\beta = corr(X, Y) * \frac{SD(Y)}{SD(X)}$


Interpretation
========================================================
* One unit change in independent variable _is associated_ with $\hat\beta$ unit change in independent variable
* One unit change in Democrats' competence score is associated with  0.66 unit _increase_ in vote share

R-squared
========================================================
* How well does our model describe the data?
* $TSS=\Sigma(Y_{i}-\hat{Y})$
* $R^2=1-\frac{SSR}{TSS}$
* Proportion of variation in independent variable and residuals


