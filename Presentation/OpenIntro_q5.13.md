OpenIntro_q5.13
========================================================
author: David Simbandumwe
date: October 13, 2021
font-family: 'Helvetica'
autosize: TRUE

Question 5.13
========================================================
**5.13 Website registration. A website is trying to increase registration for first-time visitors, exposing 1% of these visitors to a new site design. Of 752 randomly sampled visitors over a month who saw the new design, 64 registered.**

a) Check any conditions required for constructing a confidence interval.

b) Compute the standard error.

c) Construct and interpret a 90% confidence interval for the fraction of first-time visitors of the site who would register under the new design (assuming stable behaviors by new visitors over time).




a) confidence interval conditions
========================================================
Check any conditions required for constructing a confidence interval.

**1. Independence: Sampled observations must be independent**
- **random sampling/assignment is used, and**
- **if sampling without replacement, n < 10% of the population.**

**2. Sample size: There should be at least 10 expected successes and 10 expected failures in the observed sample.**  **{np >= 10}** - **{n(1-p) >= 10}**

========================================================

```r
n <- 752
x <- 64
(p_hat <- x/n)
```

```
[1] 0.08510638
```

```r
(p_hat * n >= 10)
```

```
[1] TRUE
```

```r
(n * (1 - p_hat) >= 10)
```

```
[1] TRUE
```



b) standard error
========================================================
Compute the standard error.

**$SE = \sqrt{p(1-p)/n}$**


```r
x <- 64
n <- 752

(p_hat = x/n)
```

```
[1] 0.08510638
```

```r
(se = round(sqrt(p_hat * ( 1 - p_hat) / n),4))
```

```
[1] 0.0102
```




c) 90% confidence interval
========================================================
Construct and interpret a 90% confidence interval for the fraction of first-time visitors of the site who would register under the new design (assuming stable behaviors by new visitors over time).

**p_hat (+/-) z * se**


```r
(z <- -qnorm(0.05))
```

```
[1] 1.644854
```

```r
(ci <- c( round(p_hat - z * se,4),round(p_hat + z * se,4)))
```

```
[1] 0.0683 0.1019
```



