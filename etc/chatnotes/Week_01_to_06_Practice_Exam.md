# Week 1-6 Practice Exam

Use this as a closed-book practice exam first. The questions marked **(Exam)** are variations of question types that appear in the practice exam in the `Exam` folder.

Suggested time: 90-120 minutes.

## Question 1: Returns, log returns, dividends, and VaR

A stock has the following prices:

| Time | Price |
|---:|---:|
| 0 | 40.00 |
| 1 | 44.00 |
| 2 | 41.80 |
| 3 | 45.98 |

The stock pays a dividend of 0.60 at the end of period 2.

1. Compute the one-period simple return from time 0 to time 1.
2. Compute the one-period simple return from time 1 to time 2, including the dividend.
3. Compute the one-period simple return from time 2 to time 3.
4. If an investor starts with 1,000 dollars, compute the final value after the three periods.
5. Compute the three log price returns, ignoring dividends.
6. Explain why simple returns compound but log returns add.
7. Suppose a one-month return is normally distributed with mean 0.01 and standard deviation 0.06. Compute the 5% VaR on a 200,000 dollar investment using \(z_{0.05}=-1.645\).

## Question 2: Statistical properties of returns

You observe the following five monthly returns in percent:

| Month | Return |
|---:|---:|
| 1 | -2 |
| 2 | 4 |
| 3 | 1 |
| 4 | 7 |
| 5 | -3 |

1. Compute the sample mean return.
2. Compute the sample variance and sample standard deviation.
3. Suppose monthly returns are approximately normal with the sample mean and standard deviation from parts 1 and 2. Compute the \(z\)-score for a return below -5%.
4. Approximate the probability of a return below -5% if \(\Pr(Z<-1.54)\approx0.062\).
5. Explain what positive skewness and excess kurtosis would mean for financial returns.

## Question 3: Conditional expectations, covariance, and correlation

The economy can be in one of three states:

| State | Probability | Asset A return | Asset B return |
|---|---:|---:|---:|
| Boom | 0.30 | 12% | 6% |
| Normal | 0.50 | 5% | 4% |
| Recession | 0.20 | -8% | 2% |

1. Compute \(\mathbb E(R_A)\) and \(\mathbb E(R_B)\).
2. Compute \(\mathbb E(R_A\mid\text{not recession})\).
3. Compute \(\operatorname{Cov}(R_A,R_B)\).
4. Compute \(\operatorname{Corr}(R_A,R_B)\).
5. Briefly explain what the sign and size of the correlation mean.

## Question 4: Portfolio risk, GMV weights, and Sharpe ratios (Exam)

An investor allocates wealth between Asset A and Asset B. Expected returns and the covariance matrix are:

| Asset | Expected return |
|---|---:|
| A | 10% |
| B | 15% |

Covariance matrix:

| | A | B |
|---|---:|---:|
| A | 0.0400 | 0.0120 |
| B | 0.0120 | 0.0900 |

The risk-free rate is 3%.

1. Compute the two-asset global minimum variance weight in Asset A.
2. Compute the weight in Asset B.
3. Compute the expected return of the GMV portfolio.
4. Compute the variance and standard deviation of the GMV portfolio.
5. Compute the Sharpe ratio of the GMV portfolio.
6. Another portfolio, Portfolio C, has expected return 12% and standard deviation 16%. Which has the higher Sharpe ratio?
7. Explain why covariance matters for portfolio risk.

## Question 5: CAPM, factor models, and joint testing (Exam)

An OLS regression of a stock portfolio's monthly excess return on four factors gives:

| Coefficient | Estimate | Standard error |
|---|---:|---:|
| Intercept | 0.22 | 0.18 |
| MKT-RF | 1.15 | 0.10 |
| SMB | 0.48 | 0.16 |
| HML | -0.36 | 0.14 |
| MOM | 0.09 | 0.11 |

The four-factor regression has \(R^2=0.695\), residual standard error 4.80, and 213 degrees of freedom.

A restricted CAPM regression has residual standard error 5.40 and 216 degrees of freedom. The sample size is \(T=218\).

1. Write the fitted four-factor model.
2. Interpret the market beta.
3. Interpret the SMB coefficient.
4. Test whether the SMB coefficient is significant at the 1% level using a two-sided critical value of 2.576.
5. Test whether the stock tracks the market exactly, \(H_0:\beta_{MKT}=1\), at the 5% level using a two-sided critical value of 1.96.
6. Report the fraction of total variation that is systematic and idiosyncratic.
7. Recover \(RSS_0\) for CAPM and \(RSS_1\) for the four-factor model.
8. Compute

$$
J=\frac{RSS_0-RSS_1}{RSS_1/(T-K-1)}.
$$

9. Compare your result to \(\chi_3^2=7.815\). Which model is preferred?

## Question 6: EMH, residual autocorrelation, and ETF tracking (Exam)

An investor estimates a four-factor model for a stock and wants to check whether the residuals still contain predictable patterns. There are \(T=132\) monthly observations. The first three residual autocorrelations are:

| Lag | Autocorrelation |
|---:|---:|
| 1 | 0.11 |
| 2 | -0.06 |
| 3 | 0.09 |

1. State the weak-form EMH idea being tested.
2. Write the null and alternative hypotheses for testing residual autocorrelation up to lag 3.
3. Compute the portmanteau statistic:

$$
Q=T(T+2)\sum_{k=1}^3\frac{\hat\rho_k^2}{T-k}.
$$

4. Compare your result to \(\chi_3^2=7.815\). What do you conclude?
5. A leveraged inverse ETF is supposed to have beta \(-2\) relative to its index. A tracking regression gives \(\hat\beta=-1.72\), \(SE(\hat\beta)=0.13\), and \(R^2=0.91\). Test whether the ETF has exact \(-2\) exposure at the 5% level.
6. Explain why a high \(R^2\) does not necessarily mean the beta target is exactly achieved.
7. Briefly describe the weak, semi-strong, and strong forms of EMH.

# Worked Solutions

## Solution 1

1. Time 0 to 1:

$$
R_1=\frac{44-40}{40}=0.10=10\%.
$$

2. Time 1 to 2, including dividend:

$$
R_2=\frac{41.80+0.60-44}{44}=-0.03636=-3.636\%.
$$

3. Time 2 to 3:

$$
R_3=\frac{45.98-41.80}{41.80}=0.10=10\%.
$$

4. Final value:

$$
V_3=1000(1.10)(1-0.03636)(1.10)=1166.
$$

5. Log price returns:

$$
r_1=\log(44/40)=0.0953,
$$

$$
r_2=\log(41.80/44)=-0.0513,
$$

$$
r_3=\log(45.98/41.80)=0.0953.
$$

6. Simple returns compound because each return applies to the wealth level created by the previous return:

$$
R(1,T)=\prod_{t=1}^T(1+R_t)-1.
$$

Log returns add because logarithms turn multiplication into addition:

$$
r(1,T)=\sum_{t=1}^T r_t.
$$

7. The 5% return quantile is:

$$
q_{0.05}=0.01+0.06(-1.645)=-0.0887.
$$

So:

$$
\operatorname{VaR}_{0.05}=|200000(-0.0887)|=17740.
$$

The 5% monthly VaR is about 17,740 dollars.

## Solution 2

1. Sample mean:

$$
\bar r=\frac{-2+4+1+7-3}{5}=1.4\%.
$$

2. Deviations from the mean are:

$$
-3.4,\;2.6,\;-0.4,\;5.6,\;-4.4.
$$

The squared deviations sum to:

$$
11.56+6.76+0.16+31.36+19.36=69.20.
$$

Sample variance:

$$
s^2=\frac{69.20}{4}=17.30.
$$

Sample standard deviation:

$$
s=\sqrt{17.30}=4.16\%.
$$

3. Standardise -5%:

$$
z=\frac{-5-1.4}{4.16}=-1.54.
$$

4. Therefore:

$$
\Pr(r<-5)\approx \Pr(Z<-1.54)=0.062.
$$

There is about a 6.2% chance of a monthly return below -5% under the normal approximation.

5. Positive skewness means unusually large positive returns are more common or more extreme than unusually large negative returns. Excess kurtosis means fat tails, so extreme returns occur more often than under a normal distribution.

## Solution 3

1. Expected returns:

$$
\mathbb E(R_A)=0.30(0.12)+0.50(0.05)+0.20(-0.08)=0.045=4.5\%.
$$

$$
\mathbb E(R_B)=0.30(0.06)+0.50(0.04)+0.20(0.02)=0.042=4.2\%.
$$

2. Conditional expectation given not recession:

$$
\mathbb E(R_A\mid\text{not recession})
=\frac{0.30(0.12)+0.50(0.05)}{0.80}=0.06125=6.125\%.
$$

3. Covariance:

$$
\operatorname{Cov}(R_A,R_B)
=\sum_s p_s(R_{A,s}-0.045)(R_{B,s}-0.042).
$$

Using the table:

$$
\operatorname{Cov}(R_A,R_B)=0.00095.
$$

4. Variances:

$$
\operatorname{Var}(R_A)=0.004825,\qquad \sigma_A=0.06946.
$$

$$
\operatorname{Var}(R_B)=0.000196,\qquad \sigma_B=0.014.
$$

Correlation:

$$
\rho_{AB}=\frac{0.00095}{0.06946(0.014)}=0.977.
$$

5. The correlation is positive and very close to 1. The two assets tend to move strongly in the same direction across states, so diversification benefits are limited.

## Solution 4

1. GMV weight in Asset A:

$$
w_A^{GMV}=\frac{\sigma_B^2-\sigma_{AB}}{\sigma_A^2+\sigma_B^2-2\sigma_{AB}}
=\frac{0.0900-0.0120}{0.0400+0.0900-2(0.0120)}=0.7358.
$$

2. Weight in Asset B:

$$
w_B^{GMV}=1-0.7358=0.2642.
$$

3. Expected return:

$$
\mathbb E(R_p)=0.7358(0.10)+0.2642(0.15)=0.1132=11.32\%.
$$

4. Portfolio variance:

$$
\sigma_p^2=0.7358^2(0.0400)+0.2642^2(0.0900)+2(0.7358)(0.2642)(0.0120)=0.03260.
$$

Standard deviation:

$$
\sigma_p=\sqrt{0.03260}=0.1806=18.06\%.
$$

5. Sharpe ratio:

$$
SR_{GMV}=\frac{0.1132-0.03}{0.1806}=0.461.
$$

6. Portfolio C:

$$
SR_C=\frac{0.12-0.03}{0.16}=0.563.
$$

Portfolio C has the higher Sharpe ratio.

7. Covariance matters because portfolio variance depends not only on each asset's own variance, but also on whether the assets move together. Low or negative covariance reduces portfolio risk.

## Solution 5

1. Fitted four-factor model:

$$
r_i-r_f=0.22+1.15MKT_t+0.48SMB_t-0.36HML_t+0.09MOM_t+\hat\epsilon_t.
$$

2. The market beta is 1.15. A 1 percentage point increase in the market excess return is associated with a 1.15 percentage point increase in this portfolio's excess return.

3. The SMB coefficient is 0.48. The portfolio behaves more like small stocks than big stocks, holding other factors fixed.

4. SMB t-test:

$$
t=\frac{0.48}{0.16}=3.00.
$$

Since \(3.00>2.576\), reject \(H_0:\beta_{SMB}=0\). SMB is significant at the 1% level.

5. Market tracking test:

$$
t=\frac{1.15-1}{0.10}=1.50.
$$

Since \(1.50<1.96\), fail to reject \(H_0:\beta_{MKT}=1\). There is not enough evidence that the market beta differs from 1.

6. Systematic fraction:

$$
R^2=0.695=69.5\%.
$$

Idiosyncratic fraction:

$$
1-R^2=0.305=30.5\%.
$$

7. Recover RSS:

$$
RSS_0=5.40^2(216)=6298.56.
$$

$$
RSS_1=4.80^2(213)=4907.52.
$$

8. Joint statistic:

$$
J=\frac{6298.56-4907.52}{4907.52/213}=60.38.
$$

9. Since \(60.38>7.815\), reject the restricted CAPM. The four-factor model is preferred.

## Solution 6

1. Weak-form EMH says past prices, returns, and return patterns should not help predict future abnormal returns. If residuals still have autocorrelation, the model has left predictable structure behind.

2. Hypotheses:

$$
H_0:\rho_1=\rho_2=\rho_3=0.
$$

$$
H_1:\text{at least one residual autocorrelation is non-zero.}
$$

3. Portmanteau statistic:

$$
Q=132(134)\left(\frac{0.11^2}{131}+\frac{(-0.06)^2}{130}+\frac{0.09^2}{129}\right).
$$

$$
Q=3.23.
$$

4. Since \(3.23<7.815\), fail to reject \(H_0\). There is not enough evidence of residual autocorrelation up to lag 3, so this test does not find evidence against weak-form EMH for this model/sample.

5. ETF beta test:

$$
H_0:\beta=-2,\qquad H_1:\beta\ne -2.
$$

$$
t=\frac{-1.72-(-2)}{0.13}=2.15.
$$

Since \(2.15>1.96\), reject \(H_0\). The ETF does not appear to have exact \(-2\) exposure.

6. A high \(R^2\) means the ETF moves closely with the index, but it does not guarantee the slope equals the target value. The slope must be tested directly.

7. Weak-form EMH: prices reflect past prices and returns. Semi-strong form EMH: prices reflect all public information. Strong-form EMH: prices reflect all public and private information.
