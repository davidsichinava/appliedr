<div class="header" style="margin-top:0 px;font-size:60%;">ITASUR: Twelveth Meeting</div>

Introduction to Applied Statistics Using R
========================================================
author: David Sichinava
date: December 30, 2020
autosize: true
transition: none
css: css/style.css
font-family: 'BPG_upper'
<span style="font-weight:bold; font-family:BPG_upper;">Twelveth Meeting</span>





Today's plan
========================================================

- Regression models for binary variables
- Based on Sandy Eckel (usc.edu)

Categorical variables
========================================================
* Binomial probability distribution:
	+ $Y=binomial(n,p)$, where $n$ denotes the number of successes, while $p$ is the probability of sucess.
* Coin toss
	+ $P(Y=y)=\binom{n}{y}p^{y}(1-p)^{n-y}$

How does most social science data look like?
========================================================
* Scale?
* Should we use linear models for categorical and binary response variables?
	+ Assumptions of linear models
* Variance of $Y$ _is not contant_ and depends on the expected values of $Y$


How does most social science data look like?
========================================================
* What's the plan, Stan?
	+ We need to predict not an expected outcome, but the probability of having a particular outcome.
	
Examples
========================================================