# Exam and Workshop Map

Use this as the quickest route through the notes.

Each weekly note now starts with a **Plain-English Roadmap** explaining what the ideas actually mean and why the formulas are being used. The notes also include a **Visual Guide** Mermaid chart or diagram near the top, followed by a **Formula Symbol Guide** that explains the variables used in that week's formulas. Short **Concept** and **Example** lines appear inside the individual sections before the formulas. Each note ends with an **Exam-Style Practice Questions** section matching the practice exam style. Every question now has a **Relevant Formulas** block directly under the question heading, followed by the question text and its **Worked Answer**.

For a combined early-unit practice paper, use:

```text
Week_01_to_06_Practice_Exam.md
```

Questions marked `(Exam)` are variations of question types from the practice exam in the `Exam` folder.

## Week 2 workshop

Main skills:

```text
simple returns
gross returns
equity curves
log returns
```

Read:

```text
Week_01_Financial_Asset_Prices_and_Returns.md
Week_02_Statistical_Properties_of_Financial_Data.md
```

## Week 3 workshop

Main skills:

```text
Fama-French size/value tables
small versus big
growth versus value
mean excess returns
```

Read:

```text
Week_03_Co_movements_of_Financial_Data.md
Week_05_Asset_Pricing_Models.md
```

## Week 4 workshop and Practice Exam Q1.1

Main skills:

```text
Sharpe ratio
covariance and correlation matrices
GMV weights
regression slope as GMV weight
```

Read:

```text
Week_04_Mitigating_Risk.md
```

## Week 5 workshop and Practice Exam Q1.2-Q1.3

Main skills:

```text
CAPM regression
beta and alpha interpretation
systematic versus idiosyncratic risk
R^2 as systematic risk fraction
SMB/HML/MOM interpretation
t-tests
J test comparing CAPM to four-factor model
```

Read:

```text
Week_05_Asset_Pricing_Models.md
```

## Week 6 workshop and Practice Exam Q4

Main skills:

```text
EMH forms
autocorrelation and predictability
LM/BG-style residual autocorrelation tests
ETF tracking beta tests
```

Read:

```text
Week_06_EMH_and_Implications.md
```

## Week 7 workshops and Practice Exam Q2.1-Q2.2

Main skills:

```text
random walk with drift
successive substitution
stationarity
ADF unit-root test
AR(1) conditional mean
AR(1) unconditional mean and variance
variance ratio
```

Read:

```text
Week_06_EMH_and_Implications.md
Week_07_Modelling_Predictable_Returns.md
```

## Week 8 workshop

Main skills:

```text
white noise versus MDS
prove MDS has mean zero and no autocorrelation
AR(p) selection by AIC
residual correlogram diagnostics
ARCH test setup
```

Read:

```text
Week_08_Modelling_Volatility_ARCH.md
```

## Week 9 workshop and Practice Exam Q2.3, Q3.1, Q5

Main skills:

```text
ARCH(1) moments
ARCH LM test
write fitted ARCH/GARCH models
one-step AR-GARCH forecasts
prediction intervals
ARCH versus GARCH model comparison
GARCH skewness conclusion
```

Read:

```text
Week_09_ARCH_GARCH.md
```

## Week 10 and Practice Exam Q3.2-Q3.3

Main skills:

```text
GARCH parameter conditions
leverage effect
GJR-GARCH model
GJR news impact curve
positive versus negative shock curvature
EGARCH interpretation
```

Read:

```text
Week_10_Asymmetry_in_Volatility.md
```

## Week 11 workshop

Main skills:

```text
GARCH persistence
long-run variance
IGARCH
RiskMetrics
MA(1) and ARMA basics
```

Read:

```text
Week_11_IGARCH_RiskMetrics_ARMA.md
```

## Week 12 workshop and Practice Exam Q2.4

Main skills:

$$
\begin{aligned}
h-step GARCH variance forecasts \\
one-step \operatorname{VaR} \\
RiskMetrics asset \operatorname{VaR} \\
two-asset portfolio \operatorname{VaR} \\
portfolio \operatorname{VaR} equivalence formula \\
GJR leverage test
\end{aligned}
$$

Read:

```text
Week_12_Forecasting_Volatility.md
```

## Essential exam answer templates

\operatorname{ADF}:

$$
\begin{aligned}
H_0: unit root / non-stationary \\
H_1: stationary \\
\operatorname{ADF} = coefficient / standard error \\
reject only \text{ if } \operatorname{ADF} is more negative than the critical value
\end{aligned}
$$

t-test:

$$
\begin{aligned}
H_0: \beta = \beta_0 \\
H_1: \beta \ne \beta_0 \\
t = (\hat{\beta} - \beta_0) / \operatorname{se}(\hat{\beta}) \\
compare |t| to critical value
\end{aligned}
$$

CAPM versus multi-factor:

$$
\begin{aligned}
H_0: extra factor coefficients are all zero \\
H_1: at least one is non-zero \\
J = (RSS0 - RSS1) / [RSS1 / (T - K - 1)] \\
compare to chi-square \text{ with } number of restrictions degrees of freedom
\end{aligned}
$$

ARCH test:

```text
estimate mean model
square residuals
regress squared residuals on q lags
TR^2 ~ chi-square_q
reject means ARCH effects / time-varying volatility
```

One-step GARCH forecast:

$$
\begin{aligned}
\operatorname{mean} forecast = fitted \operatorname{mean} equation using known latest returns \\
variance forecast = \alpha_0 + \alpha_1 \epsilon_T^2 + \beta_1 \sigma_T^2
\end{aligned}
$$

Prediction interval:

$$
\operatorname{mean} forecast \pm 1.96 \sqrt{variance forecast}
$$

5 percent VaR:

$$
\begin{aligned}
q_{0.05} = \operatorname{mean} forecast - 1.645 \sqrt{variance forecast} \\
\operatorname{VaR}_{0.05} = | position value \times q_{0.05} |
\end{aligned}
$$
