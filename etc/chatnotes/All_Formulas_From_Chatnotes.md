# All Formulas From Chatnotes

This sheet consolidates the formulas, model equations, hypothesis tests, and exam templates contained in the `chatnotes` folder. Repeated worked-example substitutions are consolidated into their underlying formula so the sheet is usable for PDF export.

## Conventions

$$
t,T,h,k,n,p,q,N
$$

Variables: $t$ is a time index; $T$ is sample size or the final observed time; $h$ is a forecast horizon; $k$ is a lag or number of model parameters depending on context; $n$ is a return horizon; $p,q$ are lag orders; $N$ is the number of assets.

$$
F_t
$$

Variables: $F_t$ is the information set available at time $t$.

Returns may be written as decimals or percentages. Check the scale before applying VaR or standard deviation formulas.

## Prices, Returns, and VaR

### Simple return

$$
R_t=\frac{P_t-P_{t-1}}{P_{t-1}}=\frac{P_t}{P_{t-1}}-1
$$

Variables: $R_t$ is the simple return from $t-1$ to $t$; $P_t$ is the price at time $t$; $P_{t-1}$ is the previous price.

### Gross return

$$
1+R_t=\frac{P_t}{P_{t-1}}
$$

Variables: $1+R_t$ is the gross return, the multiplier applied to wealth.

### Return with dividends

$$
R_t=\frac{P_t+D_t-P_{t-1}}{P_{t-1}}
$$

Variables: $D_t$ is the dividend paid during period $t$.

### Log return

$$
r_t=\log(1+R_t)=\log(P_t)-\log(P_{t-1})=\log\left(\frac{P_t}{P_{t-1}}\right)
$$

Variables: $r_t$ is the log return; $\log$ is the natural logarithm.

### Small-return approximation

$$
\log(1+R_t)\approx R_t
$$

Variables: $R_t$ is the simple return; the approximation works best when $R_t$ is small.

### Multi-period gross return

$$
1+R_t(k)=\prod_{j=0}^{k-1}(1+R_{t-j})
$$

Variables: $R_t(k)$ is the $k$-period simple return ending at $t$; $j$ indexes the returns being multiplied.

### Multi-period simple return

$$
R_t(k)=\prod_{j=0}^{k-1}(1+R_{t-j})-1
$$

Variables: $R_t(k)$ is the total simple return over $k$ periods.

### Equity curve for one dollar

$$
V_t(k)=\prod_{j=0}^{k-1}(1+R_{t-j})
$$

Variables: $V_t(k)$ is the value at time $t$ of one dollar invested over $k$ periods.

### Wealth growth

$$
V_T=V_0\prod_{t=1}^{T}(1+R_t)
$$

Variables: $V_0$ is starting wealth; $V_T$ is ending wealth after $T$ periods.

### Multi-period log return

$$
r_t(k)=\sum_{j=0}^{k-1}r_{t-j}=r_t+r_{t-1}+\cdots+r_{t-k+1}
$$

Variables: $r_t(k)$ is the $k$-period log return.

### Total log return between two prices

$$
r(1,T)=\sum_{t=1}^{T}r_t=\log\left(\frac{P_T}{P_0}\right)
$$

Variables: $P_0$ is the starting price; $P_T$ is the ending price.

### Index log return

$$
r_t=\log(Index_t)-\log(Index_{t-1})
$$

Variables: $Index_t$ is the index level at time $t$.

### Excess returns

$$
\begin{aligned}
\text{asset excess return} &= \text{asset return}-R_f \\
\text{market excess return} &= \text{market return}-R_f
\end{aligned}
$$

Variables: $R_f$ is the risk-free return.

### Market beta interpretation

$$
\begin{aligned}
\beta>1 &\Rightarrow \text{aggressive, more sensitive than the market} \\
\beta=1 &\Rightarrow \text{tracks the market} \\
0<\beta<1 &\Rightarrow \text{defensive, less sensitive than the market} \\
\beta=0 &\Rightarrow \text{unrelated to market movements}
\end{aligned}
$$

Variables: $\beta$ is market sensitivity.

### Market capitalisation

$$
\text{market capitalisation}=\text{share price}\times\text{number of shares outstanding}
$$

Variables: market capitalisation is firm size measured using market value.

### Book-to-market ratio

$$
\operatorname{BtM}=\frac{\text{book value of equity}}{\text{market value of equity}}
$$

Variables: $\operatorname{BtM}$ is the book-to-market ratio.

### Normal return model

$$
R\sim\mathcal N(\mu,\sigma^2)
$$

Variables: $R$ is a return; $\mu$ is mean return; $\sigma^2$ is variance; $\sigma$ is standard deviation.

### Normal quantile

$$
q_\alpha=\mu+\sigma z_\alpha
$$

Variables: $q_\alpha$ is the lower-tail return quantile; $\alpha$ is the tail probability; $z_\alpha$ is the standard normal cutoff.

### Common normal cutoffs

$$
\begin{aligned}
z_{0.05}&=-1.645\\
z_{0.025}&=-1.96
\end{aligned}
$$

Variables: $z_{0.05}$ is the 5 percent lower-tail cutoff; $z_{0.025}$ is the 2.5 percent lower-tail cutoff.

### One-asset VaR

$$
\operatorname{VaR}_\alpha=|W_0q_\alpha|
$$

Variables: $\operatorname{VaR}_\alpha$ is Value at Risk at tail probability $\alpha$; $W_0$ is the dollar value invested.

### Zero-mean 5 percent normal VaR

$$
\begin{aligned}
q_{0.05}&=-1.645\sigma\\
\operatorname{VaR}_{0.05}&=|W_0(-1.645\sigma)|
\end{aligned}
$$

Variables: $q_{0.05}$ is the 5 percent return cutoff; $\sigma$ is return volatility.

## Random Variables and Distribution Properties

### Probability under a density

$$
\Pr(a\le X\le b)=\text{area under }f(x)\text{ from }a\text{ to }b
$$

Variables: $X$ is a random variable; $a,b$ are cutoffs; $f(x)$ is the probability density.

### Normal distribution notation

$$
X\sim\mathcal N(\mu,\sigma^2)
$$

Variables: $X$ is a random variable; $\mu$ is the mean; $\sigma^2$ is the variance.

### Expected value

$$
\mathbb E[X]=\mu
$$

Variables: $\mathbb E[\cdot]$ means expected value.

### State-contingent expected return

$$
\mathbb E(R)=\sum_s R_s\Pr(S=s)
$$

Variables: $R_s$ is the return in state $s$; $S$ is the state variable.

### Expected value linearity

$$
\begin{aligned}
\mathbb E(a)&=a\\
\mathbb E(aX)&=a\mathbb E(X)\\
\mathbb E(a+X)&=a+\mathbb E(X)\\
\mathbb E(X+Y)&=\mathbb E(X)+\mathbb E(Y)
\end{aligned}
$$

Variables: $a$ is a constant; $X,Y$ are random variables.

### Variance

$$
\operatorname{Var}(X)=\mathbb E[(X-\mu)^2]
$$

Variables: $\operatorname{Var}(X)$ is the variance of $X$.

### Standard deviation

$$
\operatorname{sd}(X)=\sqrt{\operatorname{Var}(X)}
$$

Variables: $\operatorname{sd}(X)$ is the standard deviation of $X$.

### Variance rules

$$
\begin{aligned}
\operatorname{Var}(a)&=0\\
\operatorname{Var}(aX)&=a^2\operatorname{Var}(X)\\
\operatorname{Var}(a+X)&=\operatorname{Var}(X)
\end{aligned}
$$

Variables: $a$ is a constant.

### Variance of a sum

$$
\operatorname{Var}(X+Y)=\operatorname{Var}(X)+\operatorname{Var}(Y)+2\operatorname{Cov}(X,Y)
$$

Variables: $\operatorname{Cov}(X,Y)$ is covariance between $X$ and $Y$.

### Standardising a normal variable

$$
Z=\frac{X-\mu}{\sigma}\sim\mathcal N(0,1)
$$

Variables: $Z$ is a standard normal variable; $\sigma$ is the standard deviation of $X$.

### Probability conversion after standardising

$$
\Pr(X>a)=\Pr\left(\frac{X-\mu}{\sigma}>\frac{a-\mu}{\sigma}\right)=\Pr(Z>z)
$$

Variables: $z=(a-\mu)/\sigma$ is the standardised cutoff.

### Lower-tail normal probability

$$
\Pr(r_t<x)=\Pr\left(Z<\frac{x-\mu}{\sigma}\right)
$$

Variables: $r_t$ is a return; $x$ is a cutoff.

### Return scale convention

$$
\begin{aligned}
0.01&=1\text{ percent, if returns are decimals}\\
1&=1\text{ percent, if returns are stored as percentage points}
\end{aligned}
$$

Variables: the same economic return can be represented on different numeric scales.

### Sample mean

$$
\bar r=\frac{1}{T}\sum_{t=1}^{T}r_t
$$

Variables: $\bar r$ is the sample average return.

### Sample variance and standard deviation

$$
s^2=\frac{1}{T-1}\sum_{t=1}^{T}(r_t-\bar r)^2,\qquad s=\sqrt{s^2}
$$

Variables: $s^2$ is sample variance; $s$ is sample standard deviation.

### Skewness and kurtosis

$$
\text{skewness}=\frac{\mathbb E[(r_t-\mu)^3]}{\sigma^3},\qquad
\text{kurtosis}=\frac{\mathbb E[(r_t-\mu)^4]}{\sigma^4}
$$

Variables: skewness measures asymmetry; kurtosis measures tail thickness.

## Co-Movement, Conditional Moments, and Factors

### Joint probability

$$
\Pr(X=x,Y=y)
$$

Variables: $X,Y$ are random variables; $x,y$ are outcomes.

### Marginal probability

$$
\Pr(X=x)=\sum_y\Pr(X=x,Y=y)
$$

Variables: the sum is over all possible values of $Y$.

### Conditional probability

$$
\Pr(X=x\mid Y=y)=\frac{\Pr(X=x,Y=y)}{\Pr(Y=y)}
$$

Variables: $\Pr(X=x\mid Y=y)$ is the probability of $X=x$ given $Y=y$.

### Independence

$$
\Pr(X=x\mid Y=y)=\Pr(X=x)
$$

Variables: independence means knowing $Y$ does not change the probability distribution of $X$.

### Conditional expectation

$$
\mathbb E[X\mid Y]
$$

Variables: $\mathbb E[X\mid Y]$ is the expected value of $X$ conditional on $Y$.

### Law of iterated expectations

$$
\mathbb E[X]=\mathbb E[\mathbb E[X\mid Y]]
$$

Variables: $Y$ is the conditioning variable.

### Conditional variance

$$
\operatorname{Var}(Y\mid X)=\mathbb E[(Y-\mathbb E[Y\mid X])^2\mid X]
$$

Variables: $\operatorname{Var}(Y\mid X)$ is remaining uncertainty about $Y$ after conditioning on $X$.

### Law of total variance

$$
\operatorname{Var}(Y)=\mathbb E[\operatorname{Var}(Y\mid X)]+\operatorname{Var}(\mathbb E[Y\mid X])
$$

Variables: the first term is average conditional variance; the second is variance of conditional means.

### Information reduces conditional variance

$$
\operatorname{Var}(Y\mid \text{information})<\operatorname{Var}(Y)
$$

Variables: information is any conditioning set that improves prediction.

### Covariance

$$
\operatorname{Cov}(X,Y)=\mathbb E[(X-\mathbb E[X])(Y-\mathbb E[Y])]
$$

Variables: covariance measures linear co-movement.

### State covariance

$$
\operatorname{Cov}(R_A,R_B)=\sum_s p_s(R_{A,s}-\mu_A)(R_{B,s}-\mu_B)
$$

Variables: $R_A,R_B$ are asset returns; $p_s$ is the probability of state $s$; $\mu_A,\mu_B$ are expected returns.

### Covariance from correlation

$$
\operatorname{Cov}(R_A,R_B)=\rho_{AB}\sigma_A\sigma_B
$$

Variables: $\rho_{AB}$ is the correlation between assets A and B; $\sigma_A,\sigma_B$ are standard deviations.

### Correlation

$$
\operatorname{Corr}(X,Y)=\frac{\operatorname{Cov}(X,Y)}{\operatorname{sd}(X)\operatorname{sd}(Y)}
$$

Variables: $\operatorname{Corr}(X,Y)$ is the standardised covariance.

### Correlation from covariance

$$
\rho_{AB}=\frac{\operatorname{Cov}(R_A,R_B)}{\sigma_A\sigma_B}
$$

Variables: $\rho_{AB}$ is the correlation coefficient.

### Covariance sign interpretation

$$
\begin{aligned}
\operatorname{Cov}(X,Y)>0&\Rightarrow X\text{ and }Y\text{ tend to move together}\\
\operatorname{Cov}(X,Y)<0&\Rightarrow X\text{ and }Y\text{ tend to move oppositely}\\
\operatorname{Cov}(X,Y)=0&\Rightarrow \text{no linear co-movement}
\end{aligned}
$$

Variables: the sign of covariance gives direction of linear co-movement.

### Group mean return

$$
\bar r_g=\frac{1}{T}\sum_{t=1}^{T}r_{g,t}
$$

Variables: $\bar r_g$ is the mean return for group $g$; $r_{g,t}$ is group return at time $t$.

### Generic factor long-short return

$$
r_{\text{factor},t}=r_{\text{long},t}-r_{\text{short},t}
$$

Variables: $r_{\text{long},t}$ is the return on the long leg; $r_{\text{short},t}$ is the return on the short leg.

### SMB factor

$$
SMB_t=R_{\text{small},t}-R_{\text{big},t}
$$

Variables: $SMB_t$ is Small Minus Big at time $t$.

### HML factor

$$
HML_t=R_{\text{high BtM},t}-R_{\text{low BtM},t}
$$

Variables: $HML_t$ is High Minus Low book-to-market at time $t$.

### Fama-French two-by-three SMB construction

$$
SMB=\operatorname{average}(S/L,S/N,S/H)-\operatorname{average}(B/L,B/N,B/H)
$$

Variables: $S$ means small; $B$ means big; $L,N,H$ mean low, neutral, and high book-to-market portfolios.

### Fama-French two-by-three HML construction

$$
HML=\operatorname{average}(S/H,B/H)-\operatorname{average}(S/L,B/L)
$$

Variables: $S/H$ is the small high-BtM portfolio; $B/H$ is the big high-BtM portfolio; $S/L,B/L$ are low-BtM portfolios.

## Portfolio Risk and Sharpe Ratios

### Two-asset portfolio return

$$
R_p=wR_1+(1-w)R_2
$$

Variables: $R_p$ is portfolio return; $w$ is the weight in asset 1; $R_1,R_2$ are asset returns.

### Two-asset expected return

$$
\mathbb E[R_p]=w\mathbb E[R_1]+(1-w)\mathbb E[R_2]
$$

Variables: $\mathbb E[R_p]$ is expected portfolio return.

### Two-asset expected return using means

$$
\mu_p=w\mu_1+(1-w)\mu_2
$$

Variables: $\mu_p$ is portfolio mean return; $\mu_1,\mu_2$ are asset mean returns.

### Two-asset portfolio variance

$$
\operatorname{Var}(R_p)=w^2\sigma_1^2+(1-w)^2\sigma_2^2+2w(1-w)\sigma_{12}
$$

Variables: $\sigma_1^2,\sigma_2^2$ are asset variances; $\sigma_{12}$ is covariance.

### Two-asset portfolio variance using explicit weights

$$
\sigma_p^2=w_1^2\sigma_1^2+w_2^2\sigma_2^2+2w_1w_2\sigma_{12}
$$

Variables: $w_1,w_2$ are portfolio weights; $\sigma_p^2$ is portfolio variance.

### Covariance from correlation

$$
\sigma_{12}=\rho_{12}\sigma_1\sigma_2
$$

Variables: $\rho_{12}$ is correlation between assets 1 and 2.

### Sharpe ratio

$$
SR=\frac{\operatorname{mean\ return}-\text{risk-free rate}}{\text{standard deviation}}
$$

Variables: $SR$ is the Sharpe ratio.

### Asset Sharpe ratio

$$
SR_i=\frac{\mu_i-r_f}{\sigma_i}
$$

Variables: $\mu_i$ is expected return on asset $i$; $r_f$ is the risk-free rate; $\sigma_i$ is standard deviation.

### Portfolio Sharpe ratio

$$
SR_p=\frac{\mu_p-r_f}{\sigma_p}
$$

Variables: $SR_p$ is portfolio Sharpe ratio; $\sigma_p$ is portfolio standard deviation.

### Two-asset GMV weight

$$
w_1^{GMV}=\frac{\sigma_2^2-\sigma_{12}}{\sigma_1^2+\sigma_2^2-2\sigma_{12}}
$$

Variables: $w_1^{GMV}$ is the global minimum variance weight in asset 1.

### Second GMV weight

$$
w_2^{GMV}=1-w_1^{GMV}
$$

Variables: $w_2^{GMV}$ is the GMV weight in asset 2.

### Regression trick for GMV weights

$$
r_{2,t}=\beta_0+\beta_1(r_{2,t}-r_{1,t})+e_t
$$

Variables: $r_{1,t},r_{2,t}$ are asset returns; $\beta_0,\beta_1$ are regression coefficients; $e_t$ is the error.

$$
\beta_1=w_1,\qquad w_2=1-\beta_1
$$

Variables: $\beta_1$ gives the weight in asset 1 under the regression trick.

### Regression slope form used in practice

$$
b=\frac{\operatorname{Cov}(R_1,R_2)}{\operatorname{Var}(R_2)}
$$

Variables: $b$ is a regression slope in the practice note.

### Many-asset GMV weights

$$
\mathbf w^{GMV}=\frac{\Sigma^{-1}\mathbf 1}{\mathbf 1'\Sigma^{-1}\mathbf 1}
$$

Variables: $\mathbf w^{GMV}$ is the GMV weight vector; $\Sigma$ is the covariance matrix; $\mathbf 1$ is a vector of ones.

### Portfolio return from GMV weights

$$
r_{p,t}=w_1r_{1,t}+(1-w_1)r_{2,t}
$$

Variables: $r_{p,t}$ is portfolio return at time $t$.

## Asset Pricing Models

### CAPM pricing equation

$$
\mathbb E(R_i)-r_f=\beta_i[\mathbb E(R_m)-r_f]
$$

Variables: $R_i$ is asset return; $R_m$ is market return; $\beta_i$ is market beta.

### CAPM regression

$$
r_{i,t}-r_{f,t}=\alpha_i+\beta_i(r_{m,t}-r_{f,t})+e_{i,t}
$$

Variables: $r_{i,t}-r_{f,t}$ is asset excess return; $r_{m,t}-r_{f,t}$ is market excess return; $\alpha_i$ is abnormal return; $e_{i,t}$ is the residual.

### CAPM alpha restriction

$$
\alpha_i=0
$$

Variables: $\alpha_i$ is abnormal return relative to CAPM.

### CAPM total risk decomposition

$$
\operatorname{Var}(r_{i,t}-r_f)=\beta_i^2\operatorname{Var}(r_{m,t}-r_f)+\operatorname{Var}(e_{i,t})
$$

Variables: total excess-return variance equals systematic variance plus idiosyncratic variance.

### Systematic and idiosyncratic fractions

$$
\begin{aligned}
\text{systematic fraction}&=R^2\\
\text{idiosyncratic fraction}&=1-R^2
\end{aligned}
$$

Variables: $R^2$ is the regression explained-variation statistic.

### Fama-French three-factor model

$$
r_{i,t}-r_{f,t}=\alpha_i+\beta_{i1}(r_{m,t}-r_{f,t})+\beta_{i2}SMB_t+\beta_{i3}HML_t+e_{i,t}
$$

Variables: $\beta_{i1}$ is market loading; $\beta_{i2}$ is SMB loading; $\beta_{i3}$ is HML loading.

### Carhart four-factor model

$$
r_{i,t}-r_{f,t}=\alpha_i+\beta_{i1}(r_{m,t}-r_{f,t})+\beta_{i2}SMB_t+\beta_{i3}HML_t+\beta_{i4}MOM_t+e_{i,t}
$$

Variables: $MOM_t$ is the momentum factor; $\beta_{i4}$ is momentum loading.

### CAPM nested in the four-factor model

$$
\beta_{i2}=\beta_{i3}=\beta_{i4}=0
$$

Variables: setting the extra factor loadings to zero reduces the four-factor model to CAPM.

### Single-coefficient t-test

$$
\begin{aligned}
H_0&:\beta=\beta_0\\
H_1&:\beta\ne\beta_0\\
t&=\frac{\hat\beta-\beta_0}{\operatorname{se}(\hat\beta)}
\end{aligned}
$$

Variables: $\hat\beta$ is the estimated coefficient; $\beta_0$ is the hypothesised value; $\operatorname{se}(\hat\beta)$ is the standard error.

### Test whether a factor matters

$$
\begin{aligned}
H_0&:\beta_{SMB}=0\\
H_1&:\beta_{SMB}\ne0\\
t&=\frac{\hat\beta_{SMB}}{\operatorname{se}(\hat\beta_{SMB})}
\end{aligned}
$$

Variables: $\beta_{SMB}$ is the SMB coefficient.

### Joint test of CAPM against a multi-factor model

$$
\begin{aligned}
H_0&:\beta_{SMB}=\beta_{HML}=\beta_{MOM}=0\\
H_1&:\text{at least one extra }\beta\ne0\\
J&=\frac{RSS_0-RSS_1}{RSS_1/(T-K-1)}
\end{aligned}
$$

Variables: $RSS_0$ is restricted-model residual sum of squares; $RSS_1$ is unrestricted-model residual sum of squares; $K$ is the number of regressors in the unrestricted model.

### Residual standard error and RSS

$$
RSS=(\text{residual standard error})^2df
$$

Variables: $df$ is residual degrees of freedom.

$$
\text{residual standard error}=\sqrt{\frac{RSS}{df}}
$$

Variables: residual standard error estimates residual standard deviation.

$$
df=T-K-1
$$

Variables: $T$ is sample size; $K$ is the number of regressors excluding the intercept.

## Regression Diagnostics and EMH Tests

### Regression residual properties

$$
\begin{aligned}
\mathbb E(e_{i,t})&=0\\
\operatorname{Var}(e_{i,t})&\text{ is constant}\\
\mathbb E(e_{i,t}e_{i,t-k})&=0,\quad k=1,2,\ldots
\end{aligned}
$$

Variables: $e_{i,t}$ is a regression disturbance or residual.

### Original model and residual

$$
y_t=\alpha+\beta x_t+e_t
$$

Variables: $y_t$ is the dependent variable; $x_t$ is the regressor; $\alpha,\beta$ are coefficients.

$$
\hat e_t=y_t-\hat\alpha-\hat\beta x_t
$$

Variables: $\hat e_t$ is the fitted residual.

### Heteroskedasticity hypotheses

$$
\begin{aligned}
H_0&:\operatorname{Var}(e_{i,t})\text{ is constant}\\
H_1&:\operatorname{Var}(e_{i,t})\text{ is not constant}
\end{aligned}
$$

Variables: the null is homoskedasticity; the alternative is heteroskedasticity.

### Heteroskedasticity auxiliary regression

$$
\hat e_t^2=\gamma_0+\gamma_1x_t+\gamma_2x_t^2+v_t
$$

Variables: $\gamma_j$ are auxiliary-regression coefficients; $v_t$ is the auxiliary error.

### LM statistic for heteroskedasticity

$$
W=TR^2
$$

Variables: $R^2$ comes from the auxiliary regression; compare $W$ with a chi-square critical value.

### Residual autocorrelation hypotheses

$$
\begin{aligned}
H_0&:\text{no autocorrelation}\\
H_1&:\text{at least one lagged residual matters}
\end{aligned}
$$

Variables: the alternative means residual serial correlation remains.

### Residual autocorrelation auxiliary regression

$$
\hat e_t=\gamma_0+\gamma_1\hat e_{t-1}+\gamma_2\hat e_{t-2}+\cdots+v_t
$$

Variables: $\hat e_{t-j}$ are lagged residuals.

### LM statistic for autocorrelation

$$
AR(p)=TR^2
$$

Variables: $p$ is the number of residual lags; under the null compare to $\chi_p^2$.

### HAC definition

$$
HAC=\text{heteroskedasticity and autocorrelation consistent}
$$

Variables: HAC/Newey-West changes standard errors, not fitted coefficients.

### ETF tracking regression

$$
r_{\text{ETF},t}=\alpha+\beta r_{\text{index},t}+e_t
$$

Variables: $\beta$ measures the ETF's exposure to the index.

### Leveraged ETF target test

$$
\begin{aligned}
H_0&:\beta=-2\\
H_1&:\beta\ne-2\\
t&=\frac{\hat\beta-(-2)}{\operatorname{se}(\hat\beta)}
\end{aligned}
$$

Variables: $\hat\beta$ is the estimated tracking slope.

### EMH return model

$$
r_t=\mu+e_t
$$

Variables: $\mu$ is constant mean return; $e_t$ is the unpredictable return component.

### White noise notation

$$
e_t\sim WN(0,\sigma^2)
$$

Variables: $WN(0,\sigma^2)$ means white noise with zero mean and variance $\sigma^2$.

### White noise conditions

$$
\begin{aligned}
\mathbb E(e_t)&=0\\
\operatorname{Var}(e_t)&=\sigma^2\\
\operatorname{Corr}(e_t,e_{t-k})&=0,\quad k\ge1
\end{aligned}
$$

Variables: no autocorrelation means past shocks do not linearly predict current shocks.

### Autocorrelation

$$
\rho(k)=\operatorname{Corr}(r_t,r_{t-k})
$$

Variables: $\rho(k)$ is autocorrelation at lag $k$.

### Correlogram confidence band

$$
\pm\frac{2}{\sqrt T}
$$

Variables: $T$ is sample size; the band is an approximate 5 percent individual significance guide.

### Q-test hypotheses

$$
\begin{aligned}
H_0&:\rho_1=\rho_2=\cdots=\rho_k=0\\
H_1&:\text{at least one autocorrelation is non-zero}
\end{aligned}
$$

Variables: $\rho_j$ is autocorrelation at lag $j$.

### Portmanteau/Ljung-Box statistic from the practice exam

$$
Q=T(T+2)\sum_{k=1}^{m}\frac{\hat\rho_k^2}{T-k}
$$

Variables: $m$ is the largest lag tested; $\hat\rho_k$ is the sample autocorrelation at lag $k$; compare $Q$ with $\chi_m^2$.

### Single autocorrelation large-sample test

$$
\sqrt T\,\hat\rho(k)\approx\mathcal N(0,1)
$$

Variables: $\hat\rho(k)$ is the sample autocorrelation at lag $k$.

$$
\begin{aligned}
H_0&:\rho(k)=0\\
H_1&:\rho(k)\ne0\\
\left|\sqrt T\,\hat\rho(k)\right|&>1.96\Rightarrow \text{reject at approximately 5 percent}
\end{aligned}
$$

Variables: $1.96$ is the two-sided 5 percent normal cutoff.

### Demeaned returns for LM predictability tests

$$
e_t=r_t-\bar r
$$

Variables: $\bar r$ is the sample mean return.

### LM return predictability regression

$$
e_t=\gamma_0+\gamma_1e_{t-1}+\gamma_2e_{t-2}+\cdots+v_t
$$

Variables: lagged demeaned returns test predictability.

### LM return predictability hypotheses and statistic

$$
\begin{aligned}
H_0&:\gamma_1=\gamma_2=\cdots=\gamma_k=0\\
H_1&:\text{at least one }\gamma_j\text{ differs from zero}\\
AR(k)&=TR^2\sim\chi_k^2
\end{aligned}
$$

Variables: $\gamma_j$ are lag coefficients; $\chi_k^2$ is chi-square with $k$ degrees of freedom.

### Variance-ratio one-period log return

$$
r_t=\log(P_t)-\log(P_{t-1})
$$

Variables: $r_t$ is one-period log return.

### Variance-ratio n-period log return

$$
r_t(n)=r_t+r_{t-1}+\cdots+r_{t-(n-1)}
$$

Variables: $r_t(n)$ is the $n$-period log return.

### Variance scaling under independence

$$
\operatorname{Var}[\text{n-period return}]=n\operatorname{Var}[\text{1-period return}]
$$

Variables: this holds approximately when returns are independent over time.

### Variance ratio

$$
VR_n=\frac{\text{variance of n-period returns}}{n\times\text{variance of 1-period returns}}
$$

Variables: $VR_n=1$ suggests no autocorrelation; $VR_n>1$ suggests positive autocorrelation; $VR_n<1$ suggests negative autocorrelation.

## Stationarity, Random Walks, ADF, and AR Models

### Covariance stationarity

$$
\begin{aligned}
\mathbb E(Y_t)&=\mu\\
\operatorname{Var}(Y_t)&=\sigma^2\\
\operatorname{Cov}(Y_t,Y_{t-j})&=\gamma_j
\end{aligned}
$$

Variables: stationarity means constant mean, constant variance, and autocovariance depending only on lag $j$.

### Stationarity rule of thumb

$$
\begin{aligned}
\log\text{ prices}&\quad \text{often non-stationary}\\
\log\text{ returns}&\quad \text{often stationary}
\end{aligned}
$$

Variables: this is a modelling guide, not a formal test.

### Random walk

$$
p_t=p_{t-1}+\epsilon_t
$$

Variables: $p_t$ is usually log price; $\epsilon_t$ is the shock.

### Random walk successive substitution

$$
p_t=p_0+\epsilon_1+\cdots+\epsilon_t
$$

Variables: $p_0$ is the initial value.

### Random walk moments

$$
\mathbb E(p_t)=p_0,\qquad \operatorname{Var}(p_t)=\sigma^2t
$$

Variables: $\sigma^2$ is shock variance. If $p_0=0$, the note's simplified mean is $\mathbb E(p_t)=0$.

### Random walk with drift

$$
p_t=\mu+p_{t-1}+\epsilon_t
$$

Variables: $\mu$ is drift.

### Random walk with drift successive substitution

$$
p_t=p_0+\mu t+\epsilon_1+\cdots+\epsilon_t
$$

Variables: drift accumulates linearly over time.

### Random walk with drift moments

$$
\mathbb E(p_t)=p_0+\mu t,\qquad \operatorname{Var}(p_t)=\sigma^2t
$$

Variables: if $p_0=0$, the note's simplified mean is $\mu t$.

### Unit-root AR form

$$
y_t=\phi_1y_{t-1}+\text{error}_t
$$

Variables: $\phi_1$ is the autoregressive coefficient.

### Unit root condition

$$
\phi_1=1
$$

Variables: a unit root implies random-walk-type non-stationarity.

### ADF regression

$$
\Delta y_t=c_t+\phi_cy_{t-1}+\beta_1\Delta y_{t-1}+\cdots+\beta_p\Delta y_{t-p}+\epsilon_t
$$

Variables: $\Delta y_t=y_t-y_{t-1}$; $c_t$ is deterministic component; $\phi_c$ is the unit-root test coefficient; $\beta_j$ controls lagged differences.

### ADF coefficient relationship

$$
\phi_c=\phi_1-1
$$

Variables: $\phi_c=0$ corresponds to $\phi_1=1$.

### ADF hypotheses

$$
\begin{aligned}
H_0&:\phi_c=0\quad \text{unit root / non-stationary}\\
H_1&:\phi_c<0\quad \text{stationary}
\end{aligned}
$$

Variables: the ADF alternative is one-sided and negative.

### ADF statistic

$$
\operatorname{ADF}=\frac{\hat\phi_c}{\operatorname{se}(\hat\phi_c)}
$$

Variables: $\hat\phi_c$ is the estimated ADF coefficient.

### ADF decision rule

$$
\operatorname{ADF}<\text{ADF critical value}\Rightarrow \text{reject }H_0
$$

Variables: "less than" means more negative than the critical value.

### Drift-only ADF deterministic component

$$
c_t=c
$$

Variables: $c$ is a constant drift/intercept.

### Trend ADF deterministic component

$$
c_t=c_0+c_1t
$$

Variables: $c_0$ is an intercept; $c_1$ is deterministic trend slope.

### Martingale difference sequence

$$
\mathbb E(\epsilon_t\mid F_{t-1})=0
$$

Variables: $\epsilon_t$ has zero conditional mean given past information.

### AR(1) model

$$
y_t=c+\phi_1y_{t-1}+\epsilon_t
$$

Variables: $c$ is intercept; $\phi_1$ is the AR(1) coefficient.

### AR(1) conditional mean

$$
\mathbb E(y_t\mid F_{t-1})=c+\phi_1y_{t-1}
$$

Variables: the conditional mean is the one-step forecast given past information.

### AR(1) unconditional mean

$$
\mathbb E(y_t)=\frac{c}{1-\phi_1}
$$

Variables: this requires stationarity, typically $|\phi_1|<1$.

### AR(1) conditional variance

$$
\operatorname{Var}(\epsilon_t\mid F_{t-1})=\sigma_\epsilon^2
$$

Variables: $\sigma_\epsilon^2$ is innovation variance.

$$
\operatorname{Var}(y_t\mid F_{t-1})=\sigma_\epsilon^2
$$

Variables: uncertainty in $y_t$ conditional on $F_{t-1}$ comes from the new shock.

### AR(1) unconditional variance

$$
\operatorname{Var}(y_t)=\frac{\sigma_\epsilon^2}{1-\phi_1^2}
$$

Variables: this requires stationarity.

### AR(1) one-step forecast

$$
\mathbb E(y_{t+1}\mid F_t)=c+\phi_1y_t
$$

Variables: $y_t$ is known at time $t$.

### AR(1) two-step forecast

$$
\mathbb E(y_{t+2}\mid F_t)=c+\phi_1\mathbb E(y_{t+1}\mid F_t)=c(1+\phi_1)+\phi_1^2y_t
$$

Variables: the unknown future $y_{t+1}$ is replaced by its forecast.

### AR(1) long-horizon forecast

$$
\mathbb E(y_{t+h}\mid F_t)\to \frac{c}{1-\phi_1}
$$

Variables: forecasts mean-revert to the unconditional mean when the AR(1) is stationary.

## ARCH and Volatility Models

### White noise

$$
\begin{aligned}
\mathbb E(u_t)&=0\\
\operatorname{Var}(u_t)&=\sigma^2\\
\operatorname{Corr}(u_t,u_{t-k})&=0,\quad k\ge1
\end{aligned}
$$

Variables: $u_t$ is a white-noise shock.

### MDS conditional mean

$$
\mathbb E(u_t\mid F_{t-1})=0
$$

Variables: an MDS is unpredictable from past information.

### MDS implies zero unconditional mean

$$
\mathbb E(u_t)=\mathbb E[\mathbb E(u_t\mid F_{t-1})]=0
$$

Variables: this uses the law of iterated expectations.

### MDS implies no autocovariance

$$
\operatorname{Cov}(u_t,u_{t-k})=0,\quad k\ge1
$$

Variables: $u_{t-k}$ is known at time $t-1$.

### AR(p) model

$$
y_t=c+\phi_1y_{t-1}+\cdots+\phi_py_{t-p}+\epsilon_t
$$

Variables: $p$ is the autoregressive lag order.

### AR(p) unconditional mean

$$
\mathbb E(y_t)=\frac{c}{1-\phi_1-\cdots-\phi_p}
$$

Variables: denominator uses the sum of AR coefficients.

### AR(p) one-step forecast

$$
\mathbb E(y_{t+1}\mid F_t)=c+\phi_1y_t+\phi_2y_{t-1}+\cdots+\phi_py_{t-p+1}
$$

Variables: all lagged $y$ values on the right are known at time $t$.

### AR(p) selection

$$
\text{lowest }\operatorname{AIC}=\text{preferred model}
$$

Variables: $\operatorname{AIC}$ is Akaike information criterion.

### Mean equation with residual

$$
r_t=\mathbb E(r_t\mid F_{t-1})+\epsilon_t
$$

Variables: $\epsilon_t$ is the return shock after using information at $t-1$.

### Constant-variance benchmark

$$
\operatorname{Var}(\epsilon_t\mid F_{t-1})=\sigma_\epsilon^2
$$

Variables: this benchmark has no time-varying conditional volatility.

### ARCH LM mean model

$$
y_t=x_t'\beta+\epsilon_t
$$

Variables: $x_t$ is a regressor vector; $\beta$ is a coefficient vector.

### ARCH LM auxiliary regression

$$
\hat\epsilon_t^2=\rho_0+\rho_1\hat\epsilon_{t-1}^2+\cdots+\rho_q\hat\epsilon_{t-q}^2+v_t
$$

Variables: $\hat\epsilon_t^2$ is squared residual; $q$ is the number of ARCH lags tested.

### ARCH LM hypotheses and statistic

$$
\begin{aligned}
H_0&:\rho_1=\cdots=\rho_q=0\quad \text{no ARCH effects}\\
H_1&:\text{at least one }\rho_j\ne0\quad \text{ARCH effects exist}\\
TR^2&\sim\chi_q^2
\end{aligned}
$$

Variables: $R^2$ comes from the auxiliary regression.

### ARCH LM decision rule

$$
TR^2>\chi_q^2\text{ critical value}\Rightarrow \text{reject }H_0
$$

Variables: rejecting means volatility is time-varying and predictable.

### ARCH model structure

$$
\epsilon_t=\sigma_tu_t,\qquad u_t\sim\mathrm{iid}(0,1)
$$

Variables: $\sigma_t$ is conditional standard deviation; $u_t$ is a standardised shock.

### ARCH conditional moments

$$
\mathbb E(\epsilon_t\mid F_{t-1})=0,\qquad \operatorname{Var}(\epsilon_t\mid F_{t-1})=\sigma_t^2
$$

Variables: $\sigma_t^2$ is conditional variance.

### ARCH(1)

$$
\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2
$$

Variables: $\alpha_0$ is variance intercept; $\alpha_1$ is the ARCH coefficient.

### ARCH(1) conditions

$$
\alpha_0>0,\qquad \alpha_1\ge0,\qquad \alpha_1<1
$$

Variables: these keep variance positive and finite.

### ARCH(q)

$$
\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2+\cdots+\alpha_q\epsilon_{t-q}^2
$$

Variables: $q$ is the number of lagged squared shocks.

### ARCH(q) conditions

$$
\alpha_0>0,\qquad \alpha_i\ge0,\qquad \sum_{i=1}^{q}\alpha_i<1
$$

Variables: $\sum\alpha_i$ measures volatility persistence in ARCH(q).

### ARCH(1) unconditional moments

$$
\begin{aligned}
\mathbb E(\epsilon_t)&=0\\
\operatorname{Cov}(\epsilon_t,\epsilon_{t-k})&=0,\quad k\ge1\\
\operatorname{Var}(\epsilon_t)&=\frac{\alpha_0}{1-\alpha_1}
\end{aligned}
$$

Variables: ARCH errors are uncorrelated, but squared errors can be autocorrelated.

### Information criteria

$$
AIC=-2\ell+2k,\qquad BIC=-2\ell+k\log(T)
$$

Variables: $\ell$ is log-likelihood; $k$ is number of estimated parameters; lower is better.

## GARCH, Forecasting Volatility, and Model Comparison

### ARCH(q) variance equation

$$
\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2+\cdots+\alpha_q\epsilon_{t-q}^2
$$

Variables: this is the pure ARCH variance equation.

### GARCH(p,q)

$$
\begin{aligned}
\epsilon_t&=\sigma_tu_t,\qquad u_t\sim\mathrm{iid}(0,1)\\
\sigma_t^2&=\alpha_0+\alpha_1\epsilon_{t-1}^2+\cdots+\alpha_q\epsilon_{t-q}^2\\
&\quad+\beta_1\sigma_{t-1}^2+\cdots+\beta_p\sigma_{t-p}^2
\end{aligned}
$$

Variables: $\beta_j$ are coefficients on lagged conditional variances; $p$ is GARCH order; $q$ is ARCH order.

### GARCH(1,1)

$$
\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2
$$

Variables: $\alpha_1$ is the shock reaction; $\beta_1$ is volatility persistence from lagged variance.

### GARCH(1,1) conditions

$$
\alpha_0>0,\qquad \alpha_1\ge0,\qquad \beta_1\ge0,\qquad \alpha_1+\beta_1<1
$$

Variables: $\alpha_1+\beta_1<1$ gives finite unconditional variance and mean reversion.

### GARCH persistence

$$
\rho=\alpha_1+\beta_1
$$

Variables: $\rho$ measures persistence of volatility shocks.

### GARCH long-run variance and volatility

$$
\operatorname{Var}(\epsilon_t)=\bar\sigma^2=\frac{\alpha_0}{1-\alpha_1-\beta_1},\qquad
\bar\sigma=\sqrt{\frac{\alpha_0}{1-\alpha_1-\beta_1}}
$$

Variables: $\bar\sigma^2$ is long-run variance; $\bar\sigma$ is long-run volatility.

### GARCH conditional and unconditional moments

$$
\begin{aligned}
\mathbb E(\epsilon_t\mid F_{t-1})&=0\\
\operatorname{Var}(\epsilon_t\mid F_{t-1})&=\sigma_t^2\\
\operatorname{Cov}(\epsilon_t,\epsilon_{t-k}\mid F_{t-1})&=0
\end{aligned}
$$

Variables: conditional variance changes over time even when conditional mean is zero.

$$
\begin{aligned}
\mathbb E(\epsilon_t)&=0\\
\operatorname{Cov}(\epsilon_t,\epsilon_{t-k})&=0\\
\operatorname{Var}(\epsilon_t)&=\frac{\alpha_0}{1-\alpha_1-\beta_1}
\end{aligned}
$$

Variables: standard GARCH errors are uncorrelated but not independent in squares.

### Normal GARCH innovation skewness

$$
u_t\sim\mathrm{iid}\mathcal N(0,1),\qquad \epsilon_t\mid F_{t-1}\sim\mathcal N(0,\sigma_t^2)
$$

Variables: conditional normality makes conditional skewness zero.

$$
\mathbb E(\epsilon_t^3\mid F_{t-1})=0,\qquad
\mathbb E(\epsilon_t^3)=\mathbb E[\mathbb E(\epsilon_t^3\mid F_{t-1})]=0
$$

Variables: the unconditional third moment is zero under symmetric normal innovations.

$$
\text{skewness}=\frac{\mathbb E(\epsilon_t^3)}{[\operatorname{Var}(\epsilon_t)]^{3/2}}=0
$$

Variables: skewness is zero for standard symmetric GARCH innovations.

### Mean equation plus GARCH volatility equation

$$
\begin{aligned}
r_t&=c+\phi_1r_{t-1}+\epsilon_t\\
\sigma_t^2&=\alpha_0+\alpha_1\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2
\end{aligned}
$$

Variables: $c,\phi_1$ define the mean equation; the second line defines volatility.

### Constant-mean return equation

$$
r_t=\mu+\epsilon_t
$$

Variables: $\mu$ is constant mean return.

### Mean-adjusted AR form

$$
r_t-\mu=\phi(r_{t-1}-\mu)+\epsilon_t
$$

Variables: $\phi$ is the AR coefficient around mean $\mu$.

$$
r_t=c+\phi r_{t-1}+\epsilon_t,\qquad c=\mu(1-\phi)
$$

Variables: $c$ is the equivalent intercept.

$$
r_t=\mu+\phi(r_{t-1}-\mu)+\epsilon_t=\mu(1-\phi)+\phi r_{t-1}+\epsilon_t
$$

Variables: these are algebraically equivalent AR(1) mean forms.

### AR(1)-GARCH(1,1) one-step mean forecast

$$
\mathbb E(r_{T+1}\mid F_T)=\hat r_{T+1}=c+\phi r_T
$$

Variables: $r_T$ is the latest known return.

### GARCH one-step variance forecast

$$
\hat\sigma_{T+1}^2=\mathbb E(\sigma_{T+1}^2\mid F_T)=\alpha_0+\alpha_1\epsilon_T^2+\beta_1\sigma_T^2
$$

Variables: $\epsilon_T^2$ is the latest squared shock; $\sigma_T^2$ is the latest conditional variance.

### Prediction interval using forecast variance

$$
r_{T+1}\mid F_T\sim\mathcal N(\text{mean forecast},\text{variance forecast})
$$

Variables: mean forecast is $\hat r_{T+1}$; variance forecast is $\hat\sigma_{T+1}^2$.

$$
\text{mean forecast}\pm1.96\sqrt{\text{variance forecast}}
$$

Variables: $1.96$ is the approximate 95 percent normal cutoff.

### Likelihood-ratio comparison of ARCH and GARCH

$$
LR=2(LL_{GARCH}-LL_{ARCH})=2(\ell_1-\ell_0)
$$

Variables: $LL_{GARCH}$ is the unrestricted log likelihood; $LL_{ARCH}$ is the restricted log likelihood.

$$
LR\sim\chi_p^2
$$

Variables: $p$ is the number of restrictions or extra parameters tested.

### Model comparison rules

$$
\begin{aligned}
\text{higher log likelihood}&\Rightarrow \text{better}\\
\text{lower AIC/BIC}&\Rightarrow \text{better}\\
\text{squared standardised residuals with no autocorrelation}&\Rightarrow \text{better diagnostics}
\end{aligned}
$$

Variables: these compare fitted volatility models.

## Asymmetric Volatility Models

### Standard GARCH symmetry

$$
\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2
$$

Variables: squaring removes the sign of the shock.

$$
(+a)^2=(-a)^2=a^2
$$

Variables: $a$ is any shock size.

### GJR-GARCH model

$$
\begin{aligned}
r_t&=\mu+\epsilon_t\\
\epsilon_t&=\sigma_tu_t\\
\sigma_t^2&=\alpha_0+\alpha_1\epsilon_{t-1}^2+\lambda I_{t-1}\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2
\end{aligned}
$$

Variables: $\lambda$ is the leverage/asymmetry coefficient; $I_{t-1}$ is a bad-news indicator.

### GJR indicator

$$
I_{t-1}=
\begin{cases}
1,&\epsilon_{t-1}\le0\\
0,&\text{otherwise}
\end{cases}
$$

Variables: the indicator switches on for non-positive shocks.

### GJR good-news and bad-news effects

$$
\begin{aligned}
\epsilon_{t-1}>0&:\quad \text{effect}=\alpha_1\epsilon_{t-1}^2\\
\epsilon_{t-1}\le0&:\quad \text{effect}=(\alpha_1+\lambda)\epsilon_{t-1}^2
\end{aligned}
$$

Variables: good news uses only $\alpha_1$; bad news uses $\alpha_1+\lambda$.

$$
\text{good news effect}=\alpha_1,\qquad \text{bad news effect}=\alpha_1+\lambda
$$

Variables: a positive $\lambda$ means bad news has a larger variance effect in GJR.

### GJR leverage test

$$
\begin{aligned}
H_0&:\lambda=0\\
H_1&:\lambda\ne0\\
t&=\frac{\hat\lambda}{\operatorname{se}(\hat\lambda)}
\end{aligned}
$$

Variables: $\hat\lambda$ is the estimated leverage coefficient.

$$
|t|>1.96\Rightarrow \text{reject }H_0\text{ at approximately 5 percent}
$$

Variables: rejecting means statistically significant asymmetry.

### GJR parameter conditions

$$
\alpha_0>0,\qquad \alpha_1\ge0,\qquad \beta_1\ge0,\qquad \alpha_1+\lambda\ge0
$$

Variables: these keep conditional variance non-negative for good and bad news.

### GJR unconditional variance

$$
\operatorname{Var}(\epsilon_t)=\frac{\alpha_0}{1-\alpha_1-\beta_1-\lambda/2}
$$

Variables: $\lambda/2$ appears when positive and negative shocks are equally likely.

### EGARCH model

$$
\log(\sigma_t^2)=\omega+\alpha_1u_{t-1}+\gamma_1(|u_{t-1}|-\mathbb E|u_{t-1}|)+\beta_1\log(\sigma_{t-1}^2)
$$

Variables: $\omega$ is intercept; $\alpha_1$ captures signed shock asymmetry; $\gamma_1$ captures magnitude effects; $\beta_1$ captures log-volatility persistence.

### EGARCH standardised shock

$$
u_{t-1}=\frac{\epsilon_{t-1}}{\sigma_{t-1}}
$$

Variables: $u_{t-1}$ standardises the shock by conditional volatility.

### Expected absolute standard normal shock

$$
\mathbb E|u_t|=\sqrt{\frac{2}{\pi}}\approx0.7979
$$

Variables: this value is used when $u_t$ is standard normal.

### EGARCH positivity

$$
\log(\sigma_t^2)\text{ is modelled }\Rightarrow \sigma_t^2\text{ is automatically positive}
$$

Variables: modelling log variance avoids non-negativity constraints on coefficients.

### EGARCH leverage sign in the notes

$$
\lambda<0\Rightarrow \text{negative shocks raise volatility more than positive shocks}
$$

Variables: $\lambda$ is the asymmetry coefficient in the note's EGARCH interpretation.

### News impact curve for ARCH(1)

$$
NIC(\epsilon_{t-1})=\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2
$$

Variables: $NIC$ maps yesterday's shock into today's conditional variance.

### News impact curve for GARCH(1,1)

$$
\bar\sigma^2=\frac{\alpha_0}{1-\alpha_1-\beta_1}
$$

Variables: $\bar\sigma^2$ is the variance level used to hold lagged variance fixed.

$$
NIC(\epsilon_{t-1})=\alpha_0+\alpha_1\epsilon_{t-1}^2+\beta_1\bar\sigma^2
$$

Variables: the curve varies with $\epsilon_{t-1}$ while holding $\sigma_{t-1}^2=\bar\sigma^2$.

$$
NIC(\epsilon_{t-1})=\alpha_0+\beta_1\frac{\alpha_0}{1-\alpha_1-\beta_1}+\alpha_1\epsilon_{t-1}^2
$$

Variables: this substitutes the long-run variance into the NIC.

### News impact curve for GJR-GARCH

$$
A=\alpha_0+\beta_1\frac{\alpha_0}{1-\alpha_1-\lambda/2-\beta_1}
$$

Variables: $A$ is the intercept-like NIC component after fixing lagged variance at the GJR long-run variance.

$$
\begin{aligned}
\epsilon_{t-1}>0&:\quad \sigma_t^2=A+\alpha_1\epsilon_{t-1}^2\\
\epsilon_{t-1}\le0&:\quad \sigma_t^2=A+(\alpha_1+\lambda)\epsilon_{t-1}^2
\end{aligned}
$$

Variables: the two branches show asymmetric curvature for good and bad news.

## IGARCH, RiskMetrics, MA, and ARMA

### IGARCH persistence

$$
\alpha_1+\beta_1=1
$$

Variables: IGARCH has unit volatility persistence.

### IGARCH(1,1) from GARCH(1,1)

$$
\sigma_t^2=\alpha_0+\alpha_1\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2,\qquad \alpha_1=1-\beta_1
$$

Variables: the second condition enforces $\alpha_1+\beta_1=1$.

### IGARCH with zero intercept

$$
\alpha_0=0
$$

Variables: RiskMetrics/EWMA uses zero variance intercept.

$$
\sigma_t^2=(1-\beta_1)\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2
$$

Variables: $\beta_1$ is the decay weight on old variance.

### IGARCH using returns as shocks

$$
\sigma_t^2=(1-\beta_1)r_{t-1}^2+\beta_1\sigma_{t-1}^2
$$

Variables: this uses $r_{t-1}$ as the shock when the conditional mean is zero.

### IGARCH unconditional variance issue

$$
\operatorname{Var}(\epsilon_t)=\frac{\alpha_0}{1-\alpha_1-\beta_1},\qquad \alpha_1+\beta_1=1
$$

Variables: the denominator is zero, so stationary unconditional variance is not finite.

### RiskMetrics conditional normal model

$$
r_t\mid F_{t-1}\sim\mathcal N(0,\sigma_t^2)
$$

Variables: RiskMetrics often assumes zero conditional mean.

### RiskMetrics variance update

$$
\sigma_t^2=\lambda\sigma_{t-1}^2+(1-\lambda)r_{t-1}^2
$$

Variables: $\lambda$ is the decay factor; $1-\lambda$ is the latest squared-return weight.

### RiskMetrics one-step forecast

$$
\sigma_{T+1}^2=\lambda\sigma_T^2+(1-\lambda)r_T^2
$$

Variables: $r_T$ is the latest observed return.

### Conditional-normal VaR

$$
r_{T+1}\mid F_T\sim\mathcal N(\mu_{T+1\mid T},\sigma_{T+1}^2)
$$

Variables: $\mu_{T+1\mid T}$ is the conditional mean forecast.

$$
q_\alpha=\mu_{T+1\mid T}+\sigma_{T+1}z_\alpha
$$

Variables: $q_\alpha$ is the conditional return quantile.

$$
\operatorname{VaR}_\alpha=|W_0q_\alpha|
$$

Variables: $W_0$ is dollar exposure.

$$
q_{0.05}=-1.645\sigma_{T+1},\qquad \operatorname{VaR}_{0.05}=|W_0(-1.645\sigma_{T+1})|
$$

Variables: this zero-mean form uses $z_{0.05}=-1.645$.

### AR-GARCH VaR model

$$
\begin{aligned}
r_t&=\mu_t+\epsilon_t\\
\mu_t&=c+\phi_1r_{t-1}+\cdots+\phi_pr_{t-p}\\
\sigma_t^2&=\alpha_0+\alpha_1\epsilon_{t-1}^2+\beta_1\sigma_{t-1}^2
\end{aligned}
$$

Variables: $\mu_t$ is conditional mean; $p$ is AR order.

### AR-GARCH mean forecast

$$
\mu_{T+1\mid T}=c+\phi_1r_T+\cdots+\phi_pr_{T-p+1}
$$

Variables: all returns on the right are known at time $T$.

### AR-GARCH VaR quantile

$$
q_{0.05}=\mu_{T+1\mid T}-1.645\sigma_{T+1},\qquad \operatorname{VaR}_{0.05}=|W_0q_{0.05}|
$$

Variables: $\sigma_{T+1}=\sqrt{\sigma_{T+1}^2}$.

### Persistence versus volatility level

$$
\text{persistence}=\alpha_1+\beta_1,\qquad \text{long-run variance}=\frac{\alpha_0}{1-\alpha_1-\beta_1}
$$

Variables: persistence controls shock decay; $\alpha_0$ also affects the volatility level.

### MA(1) model

$$
y_t=\phi_0+u_t+\theta_1u_{t-1}
$$

Variables: $\phi_0$ is mean/intercept; $\theta_1$ is MA coefficient; $u_t$ is shock.

$$
u_t\sim\mathrm{iid}(0,\sigma_u^2)
$$

Variables: $\sigma_u^2$ is innovation variance.

### MA(1) mean, variance, and autocorrelation

$$
\mathbb E(y_t)=\phi_0,\qquad \operatorname{Var}(y_t)=(1+\theta_1^2)\sigma_u^2
$$

Variables: MA(1) variance depends on $\theta_1^2$.

$$
\rho_1=\frac{\theta_1}{1+\theta_1^2},\qquad \rho_k=0\text{ for }k>1
$$

Variables: MA(1) autocorrelation cuts off after lag 1.

### MA(1) forecasts

$$
y_{T+1}=\phi_0+u_{T+1}+\theta_1u_T
$$

Variables: $u_T$ is the latest known/estimated shock.

$$
\hat y_{T+1}=\hat\phi_0+\hat\theta_1\hat u_T,\qquad \hat y_{T+h}=\hat\phi_0\text{ for }h\ge2
$$

Variables: future shocks have zero expected value.

### ARMA(p,q)

$$
y_t=\phi_0+\phi_1y_{t-1}+\cdots+\phi_py_{t-p}+u_t+\theta_1u_{t-1}+\cdots+\theta_qu_{t-q}
$$

Variables: $p$ is AR order; $q$ is MA order.

$$
\text{lowest }\operatorname{AIC}=\text{preferred}
$$

Variables: use AIC to choose among candidate ARMA models.

## Multi-Step Forecasting and Portfolio VaR

### Future squared shocks equal future variance in expectation

$$
\mathbb E(\epsilon_{t+h-1}^2\mid F_t)=\mathbb E(\sigma_{t+h-1}^2\mid F_t)
$$

Variables: future squared shocks are unknown, so use their conditional expectation.

$$
\epsilon_{t+h-1}=\sigma_{t+h-1}u_{t+h-1},\qquad \mathbb E(u_{t+h-1}^2\mid F_{t+h-2})=1
$$

Variables: $u$ is standardised to have conditional second moment 1.

### Recursive h-step GARCH variance forecast

$$
\rho=\alpha_1+\beta_1
$$

Variables: $\rho$ is GARCH persistence.

$$
\mathbb E(\sigma_{t+h}^2\mid F_t)=\alpha_0+\rho\mathbb E(\sigma_{t+h-1}^2\mid F_t)
$$

Variables: the $h$-step forecast uses the previous horizon's variance forecast.

### Closed-form h-step GARCH forecast

$$
\begin{aligned}
\mathbb E(\sigma_{t+h}^2\mid F_t)
&=\alpha_0\frac{1-\rho^{h-1}}{1-\rho}\\
&\quad+\rho^{h-1}\mathbb E(\sigma_{t+1}^2\mid F_t)
\end{aligned}
$$

Variables: $h$ is forecast horizon; $\rho^{h-1}$ controls mean reversion speed.

### Closed-form forecast using long-run variance

$$
\bar\sigma^2=\frac{\alpha_0}{1-\alpha_1-\beta_1}
$$

Variables: $\bar\sigma^2$ is long-run variance.

$$
\mathbb E(\sigma_{t+h}^2\mid F_t)=\bar\sigma^2+\rho^{h-1}\left[\mathbb E(\sigma_{t+1}^2\mid F_t)-\bar\sigma^2\right]
$$

Variables: forecasts converge to $\bar\sigma^2$ when $\rho<1$.

$$
\mathbb E(\sigma_{t+h}^2\mid F_t)\to\bar\sigma^2
$$

Variables: this is the long-horizon mean-reversion result.

### Prediction interval for returns

$$
r_{T+1}\mid F_T\sim\mathcal N(\mu_{T+1\mid T},\sigma_{T+1}^2)
$$

Variables: $\mu_{T+1\mid T}$ is the one-step mean forecast; $\sigma_{T+1}^2$ is the one-step variance forecast.

$$
\mu_{T+1\mid T}\pm1.96\sqrt{\sigma_{T+1}^2}
$$

Variables: this is an approximate 95 percent prediction interval.

### One-asset VaR with forecast variance

$$
q_{0.05}=\mu_{T+1\mid T}-1.645\sqrt{\sigma_{T+1}^2}
$$

Variables: $q_{0.05}$ is the 5 percent bad-return quantile.

$$
\operatorname{VaR}_{0.05}=|W_0q_{0.05}|
$$

Variables: $W_0$ is position value.

$$
\operatorname{VaR}_{0.05}=|W_0(-1.645\sqrt{\sigma_{T+1}^2})|
$$

Variables: this is the zero-mean special case.

### Asset-specific RiskMetrics forecast

$$
\sigma_{i,t+1}^2=(1-\lambda_i)r_{i,t}^2+\lambda_i\sigma_{i,t}^2
$$

Variables: $i$ indexes the asset; $\lambda_i$ is asset-specific decay factor.

### Asset-specific RiskMetrics VaR

$$
\operatorname{VaR}_i=\left|W_i(-1.645)\sqrt{\sigma_{i,t+1}^2}\right|
$$

Variables: $W_i$ is the dollar exposure to asset $i$.

### Two-asset portfolio return for VaR

$$
r_{p,t}=wr_{m,t}+(1-w)r_{c,t}
$$

Variables: $w$ is the portfolio weight in asset $m$; $1-w$ is the weight in asset $c$.

$$
w=\frac{\text{amount in asset }m}{\text{total portfolio value}},\qquad
1-w=\frac{\text{amount in asset }c}{\text{total portfolio value}}
$$

Variables: weights are based on dollar values.

### Two-asset portfolio variance for VaR

$$
\sigma_p^2=w^2\sigma_m^2+(1-w)^2\sigma_c^2+2w(1-w)\rho\sigma_m\sigma_c
$$

Variables: $\rho$ is correlation between the two asset returns.

### Portfolio VaR from portfolio volatility

$$
\operatorname{VaR}_p=\left|\text{total value}\times(-1.645)\times\sigma_p\right|
$$

Variables: $\sigma_p=\sqrt{\sigma_p^2}$ is portfolio standard deviation.

### Portfolio VaR from individual VaRs

$$
\operatorname{VaR}_p=\sqrt{\operatorname{VaR}_m^2+\operatorname{VaR}_c^2+2\rho\operatorname{VaR}_m\operatorname{VaR}_c}
$$

Variables: $\operatorname{VaR}_m,\operatorname{VaR}_c$ are stand-alone asset VaRs.

### Generic two-asset portfolio variance and VaR notation

$$
\sigma_p^2=w_A^2\sigma_A^2+w_B^2\sigma_B^2+2w_Aw_B\rho_{AB}\sigma_A\sigma_B
$$

Variables: $A,B$ are generic assets.

$$
\operatorname{VaR}_p=W_0(1.645)\sigma_p
$$

Variables: this writes VaR as a positive loss number when mean return is zero.

$$
\operatorname{VaR}_p=\sqrt{\operatorname{VaR}_A^2+\operatorname{VaR}_B^2+2\rho_{AB}\operatorname{VaR}_A\operatorname{VaR}_B}
$$

Variables: this is the same normal portfolio VaR logic expressed using individual VaRs.

## Essential Exam Answer Templates

### ADF template

$$
\begin{aligned}
H_0&:\text{unit root / non-stationary}\\
H_1&:\text{stationary}\\
\operatorname{ADF}&=\frac{\text{coefficient}}{\text{standard error}}\\
\text{reject only if ADF is more negative than the critical value}
\end{aligned}
$$

Variables: the coefficient is the ADF coefficient on lagged level.

### General t-test template

$$
\begin{aligned}
H_0&:\beta=\beta_0\\
H_1&:\beta\ne\beta_0\\
t&=\frac{\hat\beta-\beta_0}{\operatorname{se}(\hat\beta)}\\
\text{compare }|t|\text{ to the critical value}
\end{aligned}
$$

Variables: $\beta_0$ is the hypothesised value.

### CAPM versus multi-factor template

$$
\begin{aligned}
H_0&:\text{all extra factor }\beta\text{s}=0\\
H_1&:\text{at least one extra }\beta\ne0\\
J&=\frac{RSS_0-RSS_1}{RSS_1/(T-K-1)}\\
J&>\chi^2_{\text{restrictions}}\Rightarrow\text{reject }H_0
\end{aligned}
$$

Variables: $RSS_0$ is restricted-model RSS; $RSS_1$ is unrestricted-model RSS.

### ARCH test template

$$
\begin{aligned}
&\text{estimate mean model}\\
&\text{square residuals}\\
&\text{regress squared residuals on }q\text{ lags}\\
&TR^2\sim\chi_q^2\\
&\text{reject means ARCH effects / time-varying volatility}
\end{aligned}
$$

Variables: $q$ is number of lagged squared residuals in the auxiliary regression.

### One-step GARCH forecast template

$$
\begin{aligned}
\text{mean forecast}&=\text{fitted mean equation using known latest returns}\\
\text{variance forecast}&=\alpha_0+\alpha_1\epsilon_T^2+\beta_1\sigma_T^2
\end{aligned}
$$

Variables: the latest return, shock, and variance are known at time $T$.

### Prediction interval template

$$
\text{mean forecast}\pm1.96\sqrt{\text{variance forecast}}
$$

Variables: use 1.96 for an approximate 95 percent interval under normality.

### 5 percent VaR template

$$
\begin{aligned}
q_{0.05}&=\text{mean forecast}-1.645\sqrt{\text{variance forecast}}\\
\operatorname{VaR}_{0.05}&=|\text{position value}\times q_{0.05}|
\end{aligned}
$$

Variables: 1.645 is the one-sided 5 percent normal cutoff.
