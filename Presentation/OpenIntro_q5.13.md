OpenIntro_q5.13
========================================================
author: David Simbandumwe
date: October 13, 2021
autosize: true

Question 5.13
========================================================
**5.13 Website registration. A website is trying to increase registration for first-time visitors, exposing 1% of these visitors to a new site design. Of 752 randomly sampled visitors over a month who saw the new design, 64 registered.**

a) Check any conditions required for constructing a confidence interval.

b) Compute the standard error.

c) Construct and interpret a 90% confidence interval for the fraction of first-time visitors of the site who would register under the new design (assuming stable behaviors by new visitors over time).




a) confidence interval conditions
========================================================
Check any conditions required for constructing a confidence interval.
- **confidence interval = 95% or 90% or 99%**
- **point estimate = $success/n$ = $64/752$**
- **standard error = $SE = \sqrt{p(1-p)/n}$ = $SE = \sqrt{8.5% * (1-8.5%) / 64}$** 

b) standard error
========================================================
Compute the standard error.

**$SE = \sqrt{p(1-p)/n}$**


```r
x <- 64
n <- 752

p_hat = x/n
se = round(sqrt(p_hat * ( 1 - p_hat) / n),4)

se
```

```
[1] 0.0102
```




c) 90% confidence interval
========================================================
Construct and interpret a 90% confidence interval for the fraction of first-time visitors of the site who would register under the new design (assuming stable behaviors by new visitors over time).

**p_hat (+-) z * se**


```r
z <- -round(qnorm(0.05), 2)
ci <- c( round(p_hat - z * se,4),round(p_hat + z * se,4))
ci
```

```
[1] 0.0684 0.1018
```



