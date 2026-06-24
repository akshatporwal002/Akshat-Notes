platform.apilevel = '2.0'

local screen = "menu"
local choice = 1
local inputIndex = 1
local inputText = ""
local values = {}
local output = {}
local outScroll = 1
local examQ = 1
local examPart = 1
local examScroll = 1

local BLUE = {30, 80, 180}
local GREEN = {20, 120, 60}
local RED = {170, 30, 30}
local ORANGE = {190, 95, 10}
local GREY = {90, 90, 90}
local BLACK = {0, 0, 0}

local function prompt(key, label, help, example)
  return {key=key, label=label, help=help, example=example or ""}
end

local exam = {
  {q="Q1", short="Portfolios + Fama-French", topic="GMV weights, R2 risk split, SMB t-test, CAPM vs factors",
    parts={
      {label="All Q1", topic="Command map + answer shapes", lines={"Q1 command map:", "1.1a: read R slope to get AAPL weight;", "use 1-slope to get MSFT weight.", "1.1b: use R cov matrix 2x2/gmv2 to get", "GMV weights from variances and covariance.", "1.2a: no CAS; write risk decomposition.", "1.2b: use risk to get systematic/idiosyn %.", "1.3a: use R lm coefficient/ttest to get", "t statistic, reject/fail, SMB sentence.", "1.3b: use CAPM vs FF workflow to get", "RSSr/RSSu, J statistic, and model choice."}},
      {label="1.1a", topic="Regression slope as GMV weight", lines={"Question:", "Allocate wealth across AAPL and MSFT using", "Figure 1(a) R regression output.", "CAS working:", "R slope = 0.78408 gives AAPL weight.", "Use 1-0.78408 to get MSFT weight.", "Answer:", "w_AAPL=0.78408, w_MSFT=0.21592.", "Sentence:", "Allocate about 78.4% to AAPL and 21.6%", "to MSFT, subject to rounding."}},
      {label="1.1b", topic="Verify GMV from covariance output", lines={"Question:", "Verify Q1.1a using Figure 1(b) covariance", "matrix and risk-minimising weights.", "CAS working:", "Use R cov matrix 2x2 to get GMV weights.", "Enter v1=.015820443, v2=.007323076,", "cov=.004093765, mode=1.", "Use w1 output as asset 1 weight and", "w2 output as asset 2 weight.", "Answer:", "w1 about .216, w2 about .784.", "Sentence: matches Q1.1a up to labelling/rounding."}},
      {label="1.2a", topic="Risk decomposition proof", lines={"Question:", "Show total risk decomposition from the", "four-factor model when only market factor", "risk remains.", "Full working:", "Model reduces to excess r = beta1*m + e.", "Take variance of both sides.", "Var(r)=Var(beta1*m+e).", "If Cov(m,e)=0, Var(r)=beta1^2 Var(m)+Var(e).", "Answer:", "Systematic risk = beta1^2 Var(m).", "Idiosyncratic risk = Var(e)."}},
      {label="1.2b", topic="R2 risk fractions", lines={"Question:", "Use Figure 2(a) R2 to report systematic", "and idiosyncratic risk fractions.", "CAS working:", "Use risk to get systematic % and idio %.", "Enter R2=.6951 and mode=1.", "Use systematic output for explained risk.", "Use idiosyn output for residual risk.", "Answer:", "Systematic=.6951=69.51%.", "Idiosyncratic=.3049=30.49%.", "Sentence: most risk is explained by factors."}},
      {label="1.3a", topic="SMB interpretation + t-test", lines={"Question:", "Interpret SMB and test significance at 1%.", "CAS working:", "Use R lm coefficient to get t stat and", "reject/fail sentence.", "Enter est=.54912, se=.15918, h0=0,", "crit=2.576, type=4, mode=1.", "Use t output to compare with critical value.", "Answer:", "t=3.450, reject H0 at 1%.", "Sentence: SMB is positive and significant,", "so DUR has a small-stock tilt."}},
      {label="1.3b", topic="CAPM vs four-factor", lines={"Question:", "Test CAPM against the four-factor model.", "CAS working:", "Use CAPM vs FF workflow to get RSSr/RSSu", "and the chi-square J statistic.", "Enter restricted RSE=5.728, df=216,", "unrestricted RSE=5.33, df=213, crit=7.81.", "Workflow uses RSS=RSE^2*df, then", "J=(RSSr-RSSu)/(RSSu/dfu).", "Answer:", "J about 36.45, reject restrictions.", "Sentence: four-factor model is preferred."}},
      {label="2020-FF3", topic="Manufacturing FF3 + EMH variant", lines={"Question:", "2020 FF3 asks for SMB test, joint SMB/HML", "test, and residual EMH check.", "CAS working:", "Use R lm coefficient to get SMB t stat and", "interpret size exposure.", "Use jf to get F stat if comparing restricted", "and unrestricted RSS for SMB/HML jointly.", "Use jchi to get chi-square version if the", "exam frames it as large-sample restrictions.", "Use emh to get AR(p)=T*R2 for residuals.", "For R2=.56 and p=5, enter n=T, R2=.56.", "Answer:", "Rejecting residual autocorr means evidence", "against weak-form EMH."}},
      {label="2021-GMV+HiTec", topic="Two-asset GMV + FF4 tests", lines={"Question:", "2021 asks two-asset GMV weights, then", "hitec FF4 alpha/beta/joint factor tests.", "CAS working:", "Compute vA=.14^2, vB=.27^2,", "cov=.2*.14*.27.", "Use gmv2 to get risk-minimising weights.", "Use port2 only if return/variance asked.", "Use R lm coefficient to get alpha test,", "beta=1 test, and factor t-tests.", "Use jchi/jf to get joint market+MOM test.", "Answer shape:", "Report weights, then reject/fail for each", "coefficient or joint restriction."}}
    }},
  {q="Q2", short="ADF + AR-GARCH + VaR", topic="Unit root, AR(1), forecasts, prediction interval, VaR",
    parts={
      {label="All Q2", topic="Command map + answer shapes", lines={"Q2 command map:", "2.1: use R ADF output/adf to get unit-root", "decision and stationarity sentence.", "2.2: use ar1m to get unconditional mean", "and variance; write conditional parts.", "2.3: use R GARCH output to get forecast", "mean/variance; use PI logic for interval.", "2.4: use AR-GARCH PI + VaR or varp to", "get q5 percent and VaR dollars."}},
      {label="2.1", topic="ADF unit root test", lines={"Question:", "Use Figure 3(a) ADF test for AAPL log price.", "CAS working:", "Use R ADF output to get unit-root decision.", "Enter stat=-2.4021, crit=-3.41, mode=1.", "Use decision output in the written answer.", "Full working:", "Reject unit root only if stat is more negative", "than critical: -2.4021 is not < -3.41.", "Answer:", "Fail to reject H0 of unit root.", "Sentence: log price appears non-stationary."}},
      {label="2.2", topic="AR(1) conditional/unconditional moments", lines={"Question:", "For r_t=.1+.5r_{t-1}+u_t, Var(u|F)=4,", "find conditional/unconditional moments.", "CAS working:", "Use ar1m to get unconditional mean/variance.", "Enter c=.1, phi=.5, s2=4, mode=1.", "Use mean output for E(r_t).", "Use var output for Var(r_t).", "Full working:", "E(r|F)=.1+.5r_{t-1}; Var(r|F)=4.", "Answer: E(r)=.2, Var(r)=5.333333.", "Unconditional variance > conditional variance."}},
      {label="2.3", topic="AR-GARCH forecast and PI", lines={"Question:", "Use Figure 3(b) and Table 1 to compute", "one-step 95% prediction interval.", "CAS working:", "Use R GARCH output to get mean forecast,", "next variance, next sd, and persistence.", "Enter mu=.089917, ar1=-.078809,", "omega=.163413, alpha=.103810, beta=.848849,", "last=.309, resid=.2660, var=4.6638.", "Then use AR-GARCH PI + VaR to get PI", "directly with zpi=1.96.", "Answer:", "Mean about .0726, variance about 4.129.", "Use PI lower/upper output in final sentence."}},
      {label="2.4", topic="One-day 5 percent VaR", lines={"Question:", "Calculate 1-day-ahead 5% VaR on $1m AAPL.", "CAS working:", "Use AR-GARCH PI + VaR to get q5 percent", "and VaR dollars in one run.", "Use Q2.3 inputs, position=1000000,", "zvar=1.645, mode=1.", "The command computes q5=mean-1.645*sd.", "It then computes VaR=abs(value*q5/100).", "Answer:", "q5 about -3.2701%.", "VaR about $32,701.", "Sentence: 5% one-day loss threshold is about $32.7k."}},
      {label="2020-AR2", topic="Stationarity + AR(2) forecasts", lines={"Question:", "2020 asks stationarity, AR(2) choice,", "conditional/unconditional mean, 3-step", "forecast, and autocovariances.", "CAS working:", "No direct numeric UDF unless parameters are", "provided; use calculator algebra/scratch.", "Use formula mu=phi0/(1-phi1-phi2) to get", "unconditional mean.", "Use recursive substitution to get forecasts:", "E_t y_{t+1}=phi0+phi1*y_t+phi2*y_{t-1}.", "Then feed E_t y_{t+1} into step 2 and 3.", "Answer shape: stationary if correlogram dies out", "and AR roots imply stable process."}},
      {label="2021-AR+ARCHPI", topic="ANZ forecast + ARCH prediction interval", lines={"Question:", "2021 ANZ asks AR(1) point forecast and PI,", "then ARCH conditional-variance PI.", "CAS working:", "Use ar1f to get point forecast.", "Enter c=0, phi=.04, last=.0039.", "Use pi1 to get constant-variance 95% PI", "from mean forecast, variance, z=1.96.", "For ARCH case, use gar1 to get next variance", "from omega=.0004, alpha=.304, resid=.0051.", "Then use pi1 with forecast mean and new var.", "Answer:", "ARCH PI differs because variance updates", "with recent shock information."}}
    }},
  {q="Q3", short="ARCH/GARCH/GJR", topic="ARCH LM, GARCH conditions, skewness, leverage, NIC",
    parts={
      {label="All Q3", topic="Command map + answer shapes", lines={"Q3 command map:", "Use arch to get ARCH LM decision.", "Use gper to get alpha+beta persistence.", "Use R GARCH output to get forecasts/persistence.", "Use gjr to get good/bad NIC curvature.", "Use R lm coefficient type=7 to test leverage.", "Written answers: White vs ARCH, GARCH", "conditions, skewness, GJR model difference."}},
      {label="3.1a", topic="ARCH(5) test", lines={"Question:", "Test ARCH(5) effects in VW residuals.", "CAS working:", "Use R ARCH LM to get LM statistic and", "reject/fail decision.", "Enter stat=1135.6, R2=1, q=5,", "crit=11.07, mode=1.", "Use LM output in test procedure.", "Full working:", "H0: no ARCH up to lag 5. H1: ARCH exists.", "Answer: LM=1135.60 > 11.07, reject H0.", "Sentence: volatility is time-varying/clustering."}},
      {label="3.1b", topic="ARCH test vs White test", lines={"Question:", "Explain ARCH test on residuals vs White test.", "CAS working:", "No numeric CAS needed; this is conceptual.", "Full working:", "ARCH auxiliary regression uses squared residuals", "on lagged squared residuals.", "White uses squared residuals on regressors,", "squares, and cross-products.", "Answer:", "ARCH targets volatility clustering over time;", "White targets general heteroskedasticity."}},
      {label="3.2a", topic="GARCH model and conditions", lines={"Question:", "Write GARCH(1,1), verify conditions, explain.", "CAS working:", "Use gper to get persistence alpha+beta.", "Enter alpha=.0807866, beta=.9040081.", "Use persistence output to check <1.", "Full working:", "h_t=w+a e_{t-1}^2+b h_{t-1}.", "Conditions: w>0, a>=0, b>=0, a+b<1.", "Answer: a+b=.984795, so highly persistent", "but finite variance condition holds."}},
      {label="3.2b", topic="Normal GARCH skewness", lines={"Question:", "Derive unconditional skewness of errors.", "CAS working:", "No numeric CAS; write the derivation.", "Full working:", "e_t=sqrt(h_t)z_t. If z_t normal, E(z_t^3)=0.", "E(e_t^3|F)=h_t^(3/2)E(z_t^3)=0.", "Then E(e_t^3)=0 by iterated expectations.", "Answer:", "Unconditional skewness is zero.", "Sentence: normal GARCH captures fat tails", "and clustering, not skewness."}},
      {label="3.3a", topic="GJR model difference", lines={"Question:", "Write GJR-GARCH and explain difference.", "CAS working:", "No numeric CAS unless testing gamma/lambda.", "Full working:", "GJR adds gamma*I(e_{t-1}<0)*e_{t-1}^2", "to the variance equation.", "Use R lm coefficient type=7 to get whether", "gamma/lambda is significant if SE supplied.", "Answer:", "GJR allows negative shocks to have a different", "effect from positive shocks."}},
      {label="3.3b", topic="News impact curvature", lines={"Question:", "Find NIC curvature values from GJR output.", "CAS working:", "Use R GJR output/gjr to get good and bad", "curvatures.", "Enter alpha=.05486562, lambda=.05483184.", "Use good output for positive-news curvature.", "Use bad output for negative-news curvature.", "Answer:", "Good=.05486562, bad=.10969746.", "Sentence: bad news has larger volatility effect."}},
      {label="2020-Nikkei", topic="ARCH/GARCH/GJR model sequence", lines={"Question:", "2020 Nikkei asks ARCH stylised fact, ARCH(5),", "ARCH vs GARCH, then GJR-GARCH.", "CAS working:", "Use gper to get GARCH persistence and check", "finite-variance condition.", "Use R info criteria/aic to get model choice", "when AIC values are supplied.", "Use R lm coefficient type=7 to get threshold", "test decision if gamma SE is supplied.", "Use gjr to get good/bad NIC curvature.", "Answer shape:", "ARCH=volatility clustering; GARCH more parsimonious;", "GJR if asymmetry/leverage matters."}},
      {label="2021-Honda", topic="Squared ARMA + NIC + DCC", lines={"Question:", "2021 Honda asks squared ARMA equivalent,", "NIC, ARCH(5) checks, and DCC.", "CAS working:", "Use gper to get persistence if GARCH params", "are supplied.", "Use gjr to get NIC curvature if alpha/gamma", "are supplied.", "Use R info criteria/aic to compare ARCH(5)", "with chosen model if AIC values are supplied.", "Answer:", "Squared-return ARMA captures volatility clustering.", "Equivalent volatility model is GARCH-type.", "DCC covariance form: H_t=D_t R_t D_t."}}
    }},
  {q="Q4", short="EMH residual test", topic="Weak-form EMH via residual autocorrelation",
    parts={
      {label="All Q4", topic="Command map + answer shapes", lines={"Q4 command map:", "Use emh/R BG output to get residual", "autocorrelation statistic and decision.", "Use decision to answer weak-form EMH.", "Reject no autocorr => evidence against EMH.", "Fail reject => no evidence against EMH.", "Use written definitions for weak, semi-strong,", "and strong EMH."}},
      {label="4.1", topic="Set up residual autocorrelation test", lines={"Question:", "Set up residual test for EMH in FF4 model.", "CAS working:", "No numeric CAS until statistic is supplied.", "Full working:", "Run auxiliary regression of residuals on p", "lagged residuals.", "H0: all lag coefficients are zero.", "H1: at least one lag coefficient nonzero.", "Use emh later to compute AR(p)=T*R2.", "Answer:", "Autocorrelation means predictable residuals", "and evidence against weak-form efficiency."}},
      {label="4.2", topic="EMH decision from AR(2)", lines={"Question:", "Use Figure 7 BG/AR(2) result for EMH.", "CAS working:", "Use R BG/EMH output to get test statistic", "and reject/fail decision.", "Enter stat=64.641, R2=1, p=2,", "crit=5.99, mode=1.", "Use stat output in conclusion.", "Answer:", "stat=64.64 > 5.99, reject no autocorr.", "Sentence: evidence against weak-form EMH", "over the selected period."}},
      {label="4.3", topic="Three forms of EMH", lines={"Question:", "Define weak, semi-strong, strong EMH.", "CAS working:", "No CAS needed.", "Answer:", "Weak: prices reflect past prices/returns.", "Semi-strong: prices reflect all public info.", "Strong: prices reflect public and private info.", "Sentence:", "The residual autocorrelation test relates", "mainly to weak-form efficiency."}},
      {label="2020-EMH", topic="FF3 residual EMH check", lines={"Question:", "2020 asks EMH check using FF3 residuals;", "auxiliary R2=.56 and df/lags=5.", "CAS working:", "Use emh to get AR(p)=T*R2 and decision.", "Enter n=T, R2=.56, p=5, chi crit df5.", "Use calculator output stat in the test.", "Full working:", "H0: no residual autocorrelation.", "If stat > chi crit, reject H0.", "Answer shape:", "Reject => residuals predictable; evidence", "against weak-form EMH."}},
      {label="2021-BG", topic="BG residual stylised fact", lines={"Question:", "2021 asks how BG residual serial correlation", "relates to stylised facts.", "CAS working:", "Use R BG/EMH output to get reject/fail", "if LM stat and df are supplied.", "Use result in written explanation.", "Answer:", "Rejecting BG means serial dependence remains", "in residuals/returns.", "Sentence: this relates to predictability and", "weak-form inefficiency, not volatility clustering."}}
    }},
  {q="Q5", short="Model writing + AIC", topic="MA-ARCH, ARCH model, ARCH vs GARCH",
    parts={
      {label="All Q5", topic="Command map + answer shapes", lines={"Q5 command map:", "Use written model equations for ARCH/GARCH.", "Use R info criteria/aic to get lower-AIC", "model choice.", "Use gper to get persistence/finite variance.", "Use R lm coefficient type=7 if testing GJR", "threshold significance.", "Use gjr to get good/bad NIC curvature."}},
      {label="5.1", topic="MA(1)-ARCH(5) model writing", lines={"Question:", "Write MA(1)-ARCH(5) model from Figure 8.", "CAS working:", "No CAS needed unless checking coefficients.", "Full working:", "Mean: r_t=mu+e_t+theta e_{t-1}.", "Variance: h_t=w+a1e1^2+...+a5e5^2.", "Use R output coefficients as mu, theta, w, alphas.", "Answer:", "mu=.05312799, theta=-.02237429,", "w=.72948343, alphas from Figure 8.", "Sentence: report fitted mean and variance equations."}},
      {label="5.2", topic="Constant mean ARCH(5)", lines={"Question:", "Write constant-mean ARCH(5) model.", "CAS working:", "No CAS needed; copy coefficients into equations.", "Full working:", "Mean: r_t=mu+e_t.", "Variance: h_t=w+a1e1^2+...+a5e5^2.", "Use Figure 9 coefficients for mu,w,a1..a5.", "Answer:", "mu=.05351403, w=.73097205,", "alphas=.107324,.198108,.168463,.110933,.115030.", "Sentence: fitted constant mean ARCH(5) model."}},
      {label="5.3", topic="ARCH vs GARCH by AIC", lines={"Question:", "Choose ARCH or GARCH using Figures 9 and 10.", "CAS working:", "Use R info criteria/aic to get lower-AIC choice.", "Enter AIC1=3.429337, AIC2=3.386934.", "Use output model choice in answer.", "Full working:", "Lower AIC is preferred for non-nested models.", "Answer:", "GARCH AIC=3.386934 < ARCH AIC=3.429337.", "Sentence: choose GARCH."}},
      {label="2020-ARCHvsGARCH", topic="Nikkei ARCH/GARCH/GJR choice", lines={"Question:", "2020 asks ARCH(5), GARCH, GJR-GARCH choice.", "CAS working:", "Use gper to get alpha+beta and condition.", "Use R info criteria/aic to get ARCH vs GARCH", "model choice from AIC values.", "Use R lm coefficient type=7 to get threshold", "test statistic for GJR gamma/lambda.", "Use gjr to get good/bad curvature if needed.", "Answer shape:", "Lower AIC model preferred unless nested test", "or significant asymmetry supports GJR."}},
      {label="2021-ARCH5choice", topic="Honda ARCH(5) vs chosen model", lines={"Question:", "2021 asks verify ARCH(5) conditions and", "compare ARCH(5) with selected model.", "CAS working:", "Use gper if selected model has GARCH a,b.", "Use R info criteria/aic to get lower AIC.", "Use jchi/jf only when models are nested and", "RSS/restriction information is given.", "Answer shape:", "Conditions require nonnegative parameters", "and finite/stationary conditional variance.", "Final sentence: choose model with better", "criterion and defensible volatility dynamics."}}
    }}
}

local items = {
  {group="TRIGGERS", name="Which tool do I use?", desc="uses guide: trigger words -> tool sequence", fn="guide", prompts={}},
  {group="TRIGGERS", name="Exam question map", desc="uses exam: Q map -> commands + worked answers", fn="exam", prompts={}},
  {group="R OUTPUT", name="Coefficient significance", desc="uses ttest: est,se,h0,crit -> t + decision", fn="ctest",
    prompts={
      prompt("est","Estimate","Coefficient estimate from R coefficient table.","SMB: 0.54912"),
      prompt("se","Std. Error","Std. Error from same R row.","SMB: 0.15918"),
      prompt("h0","Null value","Usually 0; use 1 for beta=1 tests.","SMB: 0"),
      prompt("crit","Critical value","Two-sided 1%: 2.576; 5%: 1.96.","2026 SMB: 2.576"),
      prompt("type","Variable type","1 gen, 2 beta, 3 alpha, 4 SMB, 5 HML, 6 MOM, 7 leverage.","SMB: 4"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="Regression fit from R", desc="uses rlmfit: RSE,df,R2 -> RSS + risk split", fn="rlmfit",
    prompts={
      prompt("rse","Residual std error","RSE printed near bottom of lm summary.","4FF: 5.33"),
      prompt("df","Residual df","Residual degrees of freedom from R output.","4FF: 213"),
      prompt("r2","Multiple R-squared","Use raw decimal, not percent.","4FF: 0.6951"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="Two-asset GMV weights", desc="uses gmv2: var1,var2,cov -> min-var weights", fn="gmv2",
    prompts={
      prompt("v1","Variance asset 1","Top-left covariance matrix entry.","AAPL: .015820443"),
      prompt("v2","Variance asset 2","Bottom-right covariance matrix entry.","MSFT: .007323076"),
      prompt("cov","Covariance","Off-diagonal covariance entry.",".004093765"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="Unit root/stationarity", desc="uses adf: ADF stat,crit -> unit-root decision", fn="adf",
    prompts={
      prompt("stat","ADF/tau statistic","The tau test statistic from ADF output.","2026: -2.4021"),
      prompt("crit","Critical value","Use chosen level, e.g. 5 percent tau crit.","2026 5%: -3.41"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="GARCH forecast from R", desc="uses rgarch: matcoef,last row -> mean + var", fn="rgarch",
    prompts={
      prompt("mu","mu estimate","Mean level from rugarch matcoef.","2026: .08991742"),
      prompt("ar1","ar1 estimate","AR(1) coefficient from matcoef.","2026: -.07880947"),
      prompt("omega","omega","GARCH variance intercept.","2026: .16341315"),
      prompt("alpha","alpha1","Coefficient on residual squared.","2026: .10380974"),
      prompt("beta","beta1","Coefficient on previous variance.","2026: .84884904"),
      prompt("last","Latest return","Most recent return from table.","2026: .309"),
      prompt("resid","Latest residual","Most recent residual from table.","2026: .2660"),
      prompt("var","Latest variance","Most recent conditional variance.","2026: 4.6638"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="ARCH effects test", desc="uses arch: LM/chi stat,df,crit -> decision", fn="arch",
    prompts={
      prompt("stat","Chi-squared stat","ARCH LM statistic from R output.","2026: 1135.6"),
      prompt("r2","Shortcut R2","Enter 1 when stat is already printed.","1"),
      prompt("q","df/lags","ARCH test degrees of freedom/lags.","2026: 5"),
      prompt("crit","Critical value","Chi-square critical for df=q.","5% df5: 11.07"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="Residual autocorr / EMH", desc="uses emh: LM,lags,crit -> weak EMH result", fn="emh",
    prompts={
      prompt("stat","LM statistic","BG/serial correlation statistic from R output.","2026: 64.641"),
      prompt("r2","Shortcut R2","Enter 1 when stat is already printed.","1"),
      prompt("p","df/lags","Lag order/degrees of freedom.","2026: 2"),
      prompt("crit","Critical value","Chi-square critical for df=p.","5% df2: 5.99"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="GJR leverage/NIC", desc="uses gjr: alpha,gamma -> good/bad curvature", fn="gjr",
    prompts={
      prompt("alpha","alpha1","Symmetric ARCH curvature.","2026: .05486562"),
      prompt("lambda","gamma1/lambda","Extra bad-news curvature.","2026: .05483184"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="R OUTPUT", name="Choose model by AIC", desc="uses aic: AIC1,AIC2 -> lower-AIC choice", fn="aic",
    prompts={
      prompt("AIC1","Model 1 AIC","Usually first model printed, e.g. ARCH.","2026: 3.429337"),
      prompt("AIC2","Model 2 AIC","Usually comparison model, e.g. GARCH.","2026: 3.386934"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="WORKFLOWS", name="CAPM vs factor model", desc="uses capmff: RSEs,dfs,crit -> RSS + J test", fn="capmff",
    prompts={
      prompt("rser","Restricted RSE","CAPM/simple model residual standard error.","2026: 5.728"),
      prompt("dfr","Restricted df","Residual df for restricted model.","2026: 216"),
      prompt("rseu","Unrestricted RSE","FF/Carhart residual standard error.","2026: 5.33"),
      prompt("dfu","Unrestricted df","Residual df for unrestricted model.","2026: 213"),
      prompt("crit","Chi-square critical","Use df = restrictions. 2026 uses chi3 5%.","2026: 7.81"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="WORKFLOWS", name="Forecast PI and VaR", desc="uses argarch: AR+GARCH+value -> PI + VaR", fn="argarch",
    prompts={
      prompt("mu0","Mean level mu0","Use mean-adjusted AR form mu0+phi(last-mu0).","2026: 0.0899"),
      prompt("phi","AR coefficient phi","Coefficient on last-mu0.","2026: -0.0788"),
      prompt("last","Latest return","Most recent observed return, same units as output.","2026: 0.309 percent"),
      prompt("omega","GARCH omega","Variance intercept.","2026: 0.1634"),
      prompt("alpha","GARCH alpha","Shock coefficient on residual^2.","2026: 0.1038"),
      prompt("beta","GARCH beta","Coefficient on previous variance.","2026: 0.8488"),
      prompt("resid","Latest residual","Most recent fitted residual.","2026: 0.2660"),
      prompt("var","Latest variance","Most recent fitted conditional variance.","2026: 4.6638"),
      prompt("zpi","PI z critical","For 95 percent normal PI use 1.96.","2026: 1.96"),
      prompt("value","Position value","Dollar amount invested.","2026: 1000000"),
      prompt("zvar","VaR z magnitude","For 5 percent lower tail use 1.645.","2026: 1.645"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="WORKFLOWS", name="Run diagnostics bundle", desc="uses diagflow: ARCH,EMH,JB inputs -> decisions", fn="diagflow",
    prompts={
      prompt("archstat","ARCH stat or T","If only ARCH stat given, enter it here and R2=1.","2026 shortcut: 1135.6"),
      prompt("archr2","ARCH R2","If using shortcut, enter 1.","2026 shortcut: 1"),
      prompt("archcrit","ARCH crit","Chi-square critical for q lags.","q=5 5%: 11.07"),
      prompt("emhstat","EMH stat or T","If only AR stat given, enter it here and R2=1.","2026 shortcut: 64.641"),
      prompt("emhr2","EMH R2","If using shortcut, enter 1.","2026 shortcut: 1"),
      prompt("emhcrit","EMH crit","Chi-square critical for p lags.","p=2 5%: 5.99"),
      prompt("n","JB n","Sample size for JB. Enter 0 to skip JB.","Example: 100"),
      prompt("skew","JB skewness","Skewness. Ignored if n=0.","Example: -1.2"),
      prompt("kurt","JB kurtosis","Kurtosis. Normal benchmark is 3.","Example: 13.4"),
      prompt("jbcrit","JB crit","Chi-square df 2 critical.","5%: 5.99"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="NOTES", name="Notes - risk decomposition", desc="template: Q1.2a systematic/idiosyncratic proof", fn="noteRisk", prompts={}},
  {group="NOTES", name="Notes - ARCH vs White", desc="template: Q3.1b test difference explanation", fn="noteArchWhite", prompts={}},
  {group="NOTES", name="Notes - GARCH skewness", desc="template: Q3.2b normal GARCH skewness proof", fn="noteSkew", prompts={}},
  {group="NOTES", name="Notes - GJR model", desc="template: Q3.3a GJR equation + difference", fn="noteGjrModel", prompts={}},
  {group="NOTES", name="Notes - EMH setup", desc="template: Q4.1 residual autocorrelation test", fn="noteEmhSetup", prompts={}},
  {group="NOTES", name="Notes - EMH forms", desc="template: Q4.3 weak/semi-strong/strong", fn="noteEmhForms", prompts={}},
  {group="NOTES", name="Notes - MA-ARCH model", desc="template: Q5.1 mean + ARCH(5) equations", fn="noteMaArch", prompts={}},
  {group="NOTES", name="Notes - ARCH(5) model", desc="template: Q5.2 constant mean ARCH(5)", fn="noteArch5", prompts={}},
  {group="TESTS", name="Coefficient hypothesis", desc="uses ttest: est,se,h0,crit,type -> t + decision", fn="ctest",
    prompts={
      prompt("est","Estimate","Coefficient estimate from regression output.","SMB: 0.54912"),
      prompt("se","Standard error","Standard error for that coefficient.","SMB: 0.15918"),
      prompt("h0","Null value","Usually 0, but beta tracking tests often use 1.","SMB: 0"),
      prompt("crit","Critical value","Two-sided 1% large sample: 2.576; 5%: 1.96.","2026: 2.576"),
      prompt("type","Type code","1 gen, 2 beta, 3 alpha, 4 SMB, 5 HML, 6 MOM, 7 leverage.","SMB: 4"),
      prompt("mode","Mode","0 compact, 1 show working.","1")
    }},
  {group="PORTFOLIO", name="Risk split from R2", desc="uses risk: R2 -> systematic % + idio %", fn="risk",
    prompts={prompt("r2","R-squared","Regression R2. This is systematic fraction.","2026: 0.6951"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="PORTFOLIO", name="Minimum-variance weights", desc="uses gmv2: var1,var2,cov -> w1 + w2", fn="gmv2",
    prompts={prompt("v1","Variance asset 1","Usually AAPL variance in 2026 example.","0.0158"), prompt("v2","Variance asset 2","Usually MSFT variance in 2026 example.","0.0073"), prompt("cov","Covariance","Covariance between the two assets.","0.0041"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="PORTFOLIO", name="Portfolio return/risk", desc="uses port2: weights,rets,vars,cov -> ret,var,sd", fn="port2",
    prompts={prompt("w1","Weight asset 1","Weight in first asset.","0.2159"), prompt("r1","Return asset 1","Expected return or assumed value.","0"), prompt("r2","Return asset 2","Expected return or assumed value.","0"), prompt("v1","Variance asset 1","Variance of first asset.","0.0158"), prompt("v2","Variance asset 2","Variance of second asset.","0.0073"), prompt("cov","Covariance","Covariance between asset 1 and 2.","0.0041"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="MODEL TESTS", name="Recover RSS from RSE", desc="uses rssp: RSE,df -> residual sum squares", fn="rssp",
    prompts={prompt("rse","Residual std error","RSE from regression output.","5.33"), prompt("df","Residual df","T-k-1 for that model.","213"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="MODEL TESTS", name="Joint restriction test", desc="uses jchi: RSSr,RSSu,df,crit -> J decision", fn="jchi",
    prompts={prompt("rssr","Restricted RSS","RSS for CAPM/simple model.","7087.26"), prompt("rssu","Unrestricted RSS","RSS for larger model.","6051.66"), prompt("dfu","Unrestricted df","Residual df for unrestricted model.","213"), prompt("crit","Critical value","Chi-square critical, df=restrictions.","7.81"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="MODEL TESTS", name="Nested model F test", desc="uses jf: RSSr,RSSu,q,df,crit -> F decision", fn="jf",
    prompts={prompt("rssr","Restricted RSS","RSS for simple model.","7087.26"), prompt("rssu","Unrestricted RSS","RSS for larger model.","6051.66"), prompt("q","Restrictions q","Number of restrictions.","3"), prompt("dfu","Unrestricted df","Residual df for unrestricted model.","213"), prompt("crit","F critical","Use table if F-version is required.","2.60"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="TIME SERIES", name="Stationarity decision", desc="uses adf: stat,crit -> reject/fail unit root", fn="adf",
    prompts={prompt("stat","ADF statistic","Reject only if more negative than critical.","-2.402"), prompt("crit","ADF critical","Usually negative.","-3.41"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="TIME SERIES", name="AR(1) long-run moments", desc="uses ar1m: c,phi,s2 -> mean + variance", fn="ar1m",
    prompts={prompt("c","Intercept c","AR(1) intercept.","0.1"), prompt("phi","AR coeff phi","Must have abs(phi)<1 for stationarity.","0.5"), prompt("s2","Innovation variance","Variance of the innovation.","4"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="TIME SERIES", name="AR(1) mean forecast", desc="uses ar1f: c,phi,last -> one-step forecast", fn="ar1f",
    prompts={prompt("c","Intercept c","Use intercept-form AR equation.","0.0970"), prompt("phi","AR coeff phi","Coefficient on last return.","-0.0788"), prompt("last","Latest value","Latest observed return/value.","0.309"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="TIME SERIES", name="Mean-adjusted AR forecast", desc="uses ar1fm: mu,phi,last -> one-step forecast", fn="ar1fm",
    prompts={prompt("mu0","Mean level mu0","Long-run mean in mean-adjusted form.","0.0899"), prompt("phi","AR coeff phi","Coefficient on last-mu0.","-0.0788"), prompt("last","Latest value","Latest observed return/value.","0.309"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="RISK", name="Next GARCH variance", desc="uses gar1: w,a,b,resid,var -> next var + sd", fn="gar1",
    prompts={prompt("omega","Omega","Variance intercept.","0.1634"), prompt("alpha","Alpha","Coefficient on residual squared.","0.1038"), prompt("beta","Beta","Coefficient on previous variance.","0.8488"), prompt("resid","Residual","Latest residual.","0.2660"), prompt("var","Variance","Latest conditional variance.","4.6638"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="RISK", name="GARCH persistence", desc="uses gper: alpha,beta -> persistence + condition", fn="gper",
    prompts={prompt("alpha","Alpha","ARCH coefficient.","0.1038"), prompt("beta","Beta","GARCH coefficient.","0.8488"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="RISK", name="Prediction interval", desc="uses pi1: mean,var,z -> lower + upper PI", fn="pi1",
    prompts={prompt("mu","Forecast mean","Mean forecast.","0.0727"), prompt("var","Forecast variance","Variance forecast.","4.1296"), prompt("z","Critical value","For 95 percent normal PI use 1.96.","1.96"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="RISK", name="VaR from percent returns", desc="uses varp: value,mu,var,z -> q tail + VaR", fn="varp",
    prompts={prompt("value","Position value","Dollar value invested.","1000000"), prompt("mu","Mean percent","Forecast mean in percent units.","0.0727"), prompt("var","Variance","Forecast variance in percent-squared units.","4.1296"), prompt("z","Tail z magnitude","For 5 percent lower tail use 1.645.","1.645"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="RISK", name="VaR from decimal returns", desc="uses vard: value,mu,var,z -> q tail + VaR", fn="vard",
    prompts={prompt("value","Position value","Dollar value invested.","1000000"), prompt("mu","Mean decimal","Forecast mean in decimal units.","0.000727"), prompt("var","Variance","Forecast variance in decimal-squared units.","0.00041296"), prompt("z","Tail z magnitude","For 5 percent lower tail use 1.645.","1.645"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="DIAGNOSTICS", name="ARCH volatility test", desc="uses arch: T/R2 or stat,crit -> ARCH decision", fn="arch",
    prompts={prompt("n","T or statistic","If stat is already given, enter stat and set R2=1.","1135.6"), prompt("r2","R2","Auxiliary R2. Use 1 for statistic shortcut.","1"), prompt("q","Lags q","Number of ARCH lags.","5"), prompt("crit","Critical value","Chi-square q df critical.","11.07"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="DIAGNOSTICS", name="EMH autocorrelation test", desc="uses emh: T/R2 or stat,crit -> EMH decision", fn="emh",
    prompts={prompt("n","T or statistic","If stat is already given, enter stat and set R2=1.","64.641"), prompt("r2","R2","Auxiliary R2. Use 1 for statistic shortcut.","1"), prompt("p","Lags p","Residual lags.","2"), prompt("crit","Critical value","Chi-square p df critical.","5.99"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="DIAGNOSTICS", name="Normality from skew/kurt", desc="uses jb: n,skew,kurt,crit -> JB decision", fn="jb",
    prompts={prompt("n","Sample size","Number of observations.","100"), prompt("skew","Skewness","Negative = left tail.","-1.2"), prompt("kurt","Kurtosis","Normal benchmark is 3.","13.4"), prompt("crit","Critical value","Chi-square 2 df critical.","5.99"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="VOLATILITY", name="News impact curvature", desc="uses gjr: alpha,lambda -> good/bad curvature", fn="gjr",
    prompts={prompt("alpha","Alpha","ARCH curvature for positive shocks.","0.05486562"), prompt("lambda","Lambda","Extra bad-news effect.","0.05483184"), prompt("mode","Mode","0 compact, 1 working.","1")}},
  {group="MODEL CHOICE", name="Lower-AIC model choice", desc="uses aic: AIC1,AIC2 -> choose model", fn="aic",
    prompts={prompt("AIC1","Model 1 AIC","First AIC value, e.g. ARCH.","3.429337"), prompt("AIC2","Model 2 AIC","Second AIC value, e.g. GARCH.","3.386934"), prompt("mode","Mode","0 compact, 1 working.","1")}}
}

local function rnd(x)
  if x == nil then return "nil" end
  return string.format("%.6g", x)
end

local function rndStat(x)
  if x == nil then return "nil" end
  return string.format("%.3f", x)
end

local function rndZ(x)
  if x == nil then return "nil" end
  return string.format("%.4f", x)
end

local function rndF(x)
  if x == nil then return "nil" end
  return string.format("%.2f", x)
end

local function rndChi(x)
  if x == nil then return "nil" end
  return string.format("%.2f", x)
end

local function rndAdf(x)
  if x == nil then return "nil" end
  return string.format("%.4f", x)
end

local function add(s)
  output[#output+1] = tostring(s)
end

local function isWorking(v)
  return tonumber(v or 0) == 1
end

local function guide()
  add("Use triggers to choose tool:")
  add("coef significant, beta=1 -> ttest")
  add("CAPM vs FF -> CAPM workflow")
  add("unit root, stationary -> adf")
  add("PI or VaR -> AR-GARCH workflow")
  add("ARCH effects -> arch")
  add("weak EMH residuals -> emh")
  add("ARCH vs GARCH -> aic")
  add("GJR leverage/NIC -> gjr")
  add("mode 0 compact, 1 working")
end

local function noteRisk()
  add("Q1.2a Risk decomposition")
  add("Template answer:")
  add("Given beta0=beta2=beta3=beta4=0")
  add("and rf is time invariant:")
  add("r_t-rf = beta1*(rm_t-rf)+eta_t")
  add("Take variance both sides.")
  add("Var(r_t)=beta1^2 Var(rm_t)+Var(eta_t)")
  add("because Cov(market,error)=0.")
  add("Systematic = beta1^2 Var(rm_t)")
  add("Idiosyncratic = Var(eta_t)")
  add("Sentence: total risk is market risk")
  add("plus portfolio-specific residual risk.")
end

local function noteArchWhite()
  add("Q3.1b ARCH vs White")
  add("Template answer:")
  add("ARCH test is used because the issue is")
  add("volatility clustering over time.")
  add("ARCH auxiliary regression:")
  add("vhat_t^2 on lagged vhat^2 terms.")
  add("It tests time dependence in variance.")
  add("White test checks general heteroskedasticity")
  add("linked to regressors, squares/cross terms.")
  add("It is not specifically a volatility")
  add("clustering test.")
  add("Conclusion: ARCH is the suitable test here.")
end

local function noteSkew()
  add("Q3.2b GARCH skewness")
  add("Template proof:")
  add("v_t = sigma_t * z_t")
  add("z_t iid N(0,1), so E(z_t^3)=0.")
  add("E(v_t^3 | F_t-1)")
  add("= E((sigma_t z_t)^3 | F_t-1)")
  add("= sigma_t^3 E(z_t^3)")
  add("= 0")
  add("By LIE, E(v_t^3)=E(0)=0.")
  add("Skewness = E(v_t^3)/Var(v_t)^(3/2)=0.")
  add("Conclusion: normal GARCH has zero")
  add("unconditional skewness.")
end

local function noteGjrModel()
  add("Q3.3a GJR-GARCH model")
  add("Template answer:")
  add("r_t = c + v_t")
  add("v_t = sigma_t z_t, z_t iid N(0,1)")
  add("sigma_t^2 = omega + alpha*v_t-1^2")
  add("+ gamma*I(v_t-1<0)*v_t-1^2")
  add("+ beta*sigma_t-1^2")
  add("Difference from GARCH:")
  add("GARCH has symmetric alpha*v^2.")
  add("GJR adds bad-news indicator term.")
  add("If gamma>0, negative shocks raise")
  add("future volatility more than positive shocks.")
end

local function noteEmhSetup()
  add("Q4.1 EMH residual test")
  add("Template answer:")
  add("Run auxiliary regression on residuals:")
  add("uhat_t = c + rho1*uhat_t-1 + ...")
  add("+ rhop*uhat_t-p + error_t")
  add("Optional: include original factors too.")
  add("H0: rho1=rho2=...=rhop=0")
  add("H1: at least one rho not zero")
  add("Test stat: AR(p)=T*R2")
  add("Compare to chi-square p df.")
  add("Reject H0 -> predictable residuals.")
  add("Conclusion: evidence against weak EMH.")
end

local function noteEmhForms()
  add("Q4.3 EMH forms")
  add("Template answer:")
  add("Weak form:")
  add("Prices reflect past prices/returns.")
  add("Semi-strong form:")
  add("Prices reflect all public information.")
  add("Strong form:")
  add("Prices reflect public and private info.")
  add("Difference is information set size.")
  add("Q4 residual autocorrelation mainly tests")
  add("weak-form efficiency.")
end

local function noteMaArch()
  add("Q5.1 MA(1)-ARCH(5) model")
  add("Template answer:")
  add("Mean equation:")
  add("r_t = mu + e_t + theta*e_t-1")
  add("Error:")
  add("e_t = sigma_t z_t, z_t iid N(0,1)")
  add("Variance equation:")
  add("sigma_t^2 = omega")
  add("+ a1*e_t-1^2 + a2*e_t-2^2")
  add("+ a3*e_t-3^2 + a4*e_t-4^2")
  add("+ a5*e_t-5^2")
  add("Insert Figure 8 estimates:")
  add("mu=.05312799, theta=-.02237429")
  add("omega=.72948343, then alpha1..alpha5")
end

local function noteArch5()
  add("Q5.2 constant ARCH(5)")
  add("Template answer:")
  add("Mean equation:")
  add("r_t = mu + e_t")
  add("Error:")
  add("e_t = sigma_t z_t, z_t iid N(0,1)")
  add("Variance equation:")
  add("sigma_t^2 = omega")
  add("+ a1*e_t-1^2 + a2*e_t-2^2")
  add("+ a3*e_t-3^2 + a4*e_t-4^2")
  add("+ a5*e_t-5^2")
  add("Insert Figure 9 estimates:")
  add("mu=.05351403, omega=.73097205")
  add("alpha1=.10732388 alpha2=.19810827")
  add("alpha3=.16846296 alpha4=.11093323")
  add("alpha5=.11503043")
end

local function ctest(v)
  local est,se,h0,crit,typ,m = v[1],v[2],v[3],v[4],v[5],isWorking(v[6])
  local t = (est-h0)/se
  local at = math.abs(t)
  if m then
    add("Hypotheses:")
    if typ==2 then add("H0: beta="..rnd(h0)); add("H1: beta not "..rnd(h0))
    elseif typ==3 then add("H0: alpha=0"); add("H1: alpha not 0")
    elseif typ==4 then add("H0: beta_SMB=0"); add("H1: beta_SMB not 0")
    elseif typ==5 then add("H0: beta_HML=0"); add("H1: beta_HML not 0")
    elseif typ==6 then add("H0: beta_MOM=0"); add("H1: beta_MOM not 0")
    elseif typ==7 then add("H0: leverage/gamma=0"); add("H1: leverage/gamma not 0")
    else add("H0: coeff="..rnd(h0)); add("H1: coeff not "..rnd(h0)) end
    add("Test statistic:")
    add("t=(estimate-null)/SE")
    add("=("..rnd(est).."-"..rnd(h0)..")/"..rnd(se))
  end
  add("t="..rndStat(t))
  if m then add("Decision: compare |t| to crit"); add("|t|="..rndStat(at).." crit="..rndStat(crit)) end
  if at > crit then
    add("Reject H0")
    if typ==2 then add("Beta differs from h0"); if est>1 then add("Beta>1: aggressive") elseif est<1 then add("Beta<1: defensive") end
    elseif typ==3 then add("Alpha differs from 0"); add("Abnormal return")
    elseif typ==4 then add("SMB significant"); if est>0 then add("Positive: small tilt") else add("Negative: big tilt") end
    elseif typ==5 then add("HML significant"); if est>0 then add("Positive: value tilt") else add("Negative: growth tilt") end
    elseif typ==6 then add("MOM significant"); if est>0 then add("Positive: winner tilt") else add("Negative: loser tilt") end
    elseif typ==7 then add("Leverage term matters")
    else add("Coeff differs from h0") end
  else
    add("Fail reject H0")
    if typ==4 then add("SMB not significant") elseif typ==5 then add("HML not significant") elseif typ==6 then add("MOM not significant") elseif typ==7 then add("No leverage evidence") else add("Insufficient evidence") end
  end
end

local function risk(v)
  local r2,m = v[1],isWorking(v[2])
  if m then
    add("Risk decomposition:")
    add("systematic fraction=R2")
    add("idiosyn fraction=1-R2")
    add("Use R2 as explained factor risk")
  end
  add("systematic="..rnd(r2).." ("..rnd(100*r2).."%)")
  add("idiosyn="..rnd(1-r2).." ("..rnd(100*(1-r2)).."%)")
  add("Sentence: R2 is systematic share")
end

local function gmv2(v)
  local v1,v2,c12,m = v[1],v[2],v[3],isWorking(v[4])
  local num,den = v2-c12, v1+v2-2*c12
  local w1 = num/den
  if m then
    add("Let asset 1 be first row/column")
    add("Let asset 2 be second row/column")
    add("w1=(var2-cov12)/(var1+var2-2cov12)")
    add("num=var2-cov12="..rnd(num))
    add("den=var1+var2-2cov12="..rnd(den))
  end
  add("w1 asset 1="..rnd(w1))
  add("w2 asset 2="..rnd(1-w1))
  add("Check: w1+w2=1")
end

local function port2(v)
  local w1,r1,r2,v1,v2,c12,m = v[1],v[2],v[3],v[4],v[5],v[6],isWorking(v[7])
  local w2 = 1-w1
  local pret = w1*r1+w2*r2
  local pv = w1*w1*v1+w2*w2*v2+2*w1*w2*c12
  if m then
    add("Asset 1 uses w1,r1,var1")
    add("Asset 2 uses w2=1-w1")
    add("w2=1-w1="..rnd(w2))
    add("ret=w1*r1+w2*r2")
    add("var=w1^2v1+w2^2v2+2w1w2cov")
  end
  add("portfolio return="..rnd(pret))
  add("portfolio variance="..rnd(pv))
  add("portfolio sd="..rnd(math.sqrt(pv)))
end

local function rssp(v)
  if isWorking(v[3]) then add("Recover RSS from R output"); add("RSE=sqrt(RSS/df)"); add("RSS=RSE^2*df") end
  add("RSS="..rnd(v[1]*v[1]*v[2]))
  add("Use RSS in J/F model tests")
end

local function rlmfit(v)
  local rss = v[1]*v[1]*v[2]
  local r2 = v[3]
  if isWorking(v[4]) then
    add("From lm summary:")
    add("RSS=RSE^2*df")
    add("systematic risk share=R2")
    add("idiosyn share=1-R2")
  end
  add("RSS="..rnd(rss))
  add("systematic="..rnd(r2).." ("..rnd(100*r2).."%)")
  add("idiosyn="..rnd(1-r2).." ("..rnd(100*(1-r2)).."%)")
  add("Sentence: R2 explains systematic risk")
end

local function jchi(v)
  local num,den = v[1]-v[2], v[2]/v[3]
  local j = num/den
  if isWorking(v[5]) then
    add("Hypotheses:")
    add("H0: restrictions hold")
    add("H1: at least one fails")
    add("J=(RSSr-RSSu)/(RSSu/dfu)")
    add("num=RSSr-RSSu="..rnd(num))
    add("den=RSSu/dfu="..rnd(den))
  end
  add("J="..rndChi(j).." crit="..rndChi(v[4]))
  if j>v[4] then add("Reject restrictions"); add("Use larger model") else add("Fail reject"); add("Restricted ok") end
end

local function jf(v)
  local num,den = (v[1]-v[2])/v[3], v[2]/v[4]
  local f = num/den
  if isWorking(v[6]) then
    add("Hypotheses:")
    add("H0: q restrictions hold")
    add("H1: at least one fails")
    add("F=((RSSr-RSSu)/q)/(RSSu/dfu)")
    add("num=(RSSr-RSSu)/q="..rnd(num))
    add("den=RSSu/dfu="..rnd(den))
  end
  add("F="..rndF(f).." crit="..rndF(v[5]))
  if f>v[5] then add("Reject restrictions"); add("Use larger model") else add("Fail reject"); add("Restricted ok") end
end

local function capmff(v)
  local rssr,rssu = v[1]*v[1]*v[2], v[3]*v[3]*v[4]
  add("H0: extra factors jointly zero")
  add("H1: at least one factor matters")
  add("1 Recover RSS values")
  add("RSS restricted="..rnd(rssr))
  add("RSS unrestricted="..rnd(rssu))
  add("2 Feed RSS into J test")
  jchi({rssr,rssu,v[4],v[5],v[6]})
  add("Conclusion: reject -> FF/Carhart preferred")
end

local function adf(v)
  if isWorking(v[3]) then
    add("Hypotheses:")
    add("H0: unit root / non-stationary")
    add("H1: stationary")
    add("Reject only if stat < crit")
    add("More negative means stronger reject")
    add("stat="..rndAdf(v[1]).." crit="..rndF(v[2]))
  end
  if v[1]<v[2] then add("Reject unit root"); add("Evidence stationary") else add("Fail reject unit root"); add("Treat non-stationary") end
end

local function ar1m(v)
  if isWorking(v[4]) then
    add("Model: y_t=c+phi*y_t-1+u_t")
    add("E(y)=c/(1-phi)")
    add("Var(y)=s2/(1-phi^2)")
    add("Requires |phi|<1")
  end
  add("mean="..rnd(v[1]/(1-v[2])))
  add("var="..rnd(v[3]/(1-v[2]*v[2])))
  if math.abs(v[2])<1 then add("stationary") else add("not stationary") end
end

local function ar1f(v)
  if isWorking(v[4]) then add("Intercept-form AR(1)"); add("forecast=c+phi*last") end
  add("forecast="..rnd(v[1]+v[2]*v[3]))
end

local function ar1fm(v)
  if isWorking(v[4]) then add("Mean-adjusted AR(1)"); add("forecast=mu0+phi*(last-mu0)") end
  add("forecast="..rnd(v[1]+v[2]*(v[3]-v[1])))
end

local function gar1(v)
  local shock,persist = v[2]*v[4]*v[4], v[3]*v[5]
  local vn = v[1]+shock+persist
  if isWorking(v[6]) then
    add("GARCH variance forecast")
    add("h_next=omega+alpha*u^2+beta*h")
    add("shock part=alpha*u^2="..rnd(shock))
    add("persistence part=beta*h="..rnd(persist))
  end
  add("next var="..rnd(vn))
  add("next sd="..rnd(math.sqrt(vn)))
  add("Use next var in PI/VaR")
end

local function rgarch(v)
  local mu,ar1,omega,alpha,beta,last,resid,prevvar,m = v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],isWorking(v[9])
  local fc = mu+ar1*(last-mu)
  local shock = alpha*resid*resid
  local persist = beta*prevvar
  local vn = omega+shock+persist
  local p = alpha+beta
  if m then
    add("1 Mean forecast")
    add("mean=mu+ar1*(last-mu)")
    add("2 Variance forecast")
    add("h=w+a*resid^2+b*prevvar")
    add("shock=a*resid^2="..rnd(shock))
    add("persist=b*prevvar="..rnd(persist))
  end
  add("mean forecast="..rnd(fc))
  add("next var="..rnd(vn))
  add("next sd="..rnd(math.sqrt(vn)))
  add("persistence="..rnd(p))
  if p<1 then add("finite variance condition ok") else add("condition fails") end
end

local function argarch(v)
  local mu = v[1]+v[2]*(v[3]-v[1])
  local shock,persist = v[5]*v[7]*v[7], v[6]*v[8]
  local vn = v[4]+shock+persist
  local sd = math.sqrt(vn)
  local lo,hi = mu-v[9]*sd, mu+v[9]*sd
  local q = mu-v[11]*sd
  local varDollars = math.abs(v[10]*q/100)
  add("1 Mean forecast")
  add("mu_f="..rnd(mu))
  add("2 Variance forecast")
  add("h_f="..rnd(vn))
  add("sd="..rnd(sd))
  add("z PI="..rndZ(v[9]))
  add("3 Prediction interval")
  add("lower="..rnd(lo))
  add("PI upper="..rnd(hi))
  add("z VaR="..rndZ(v[11]))
  add("4 VaR")
  add("q percent="..rnd(q))
  add("VaR dollars="..rnd(varDollars))
  add("Use percent-return VaR.")
end

local function gper(v)
  local p = v[1]+v[2]
  if isWorking(v[3]) then
    add("GARCH condition check")
    add("persistence=alpha+beta")
    add("Need alpha>=0,beta>=0")
    add("Need alpha+beta<1")
  end
  add("persist="..rnd(p))
  if p<1 then add("finite var condition ok"); if p>.9 then add("highly persistent") end else add("condition fails") end
end

local function pi1(v)
  local sd = math.sqrt(v[2])
  if isWorking(v[4]) then
    add("Normal prediction interval")
    add("sd=sqrt(variance)="..rnd(sd))
    add("PI=mean +/- z*sd")
    add("z="..rndZ(v[3]))
  end
  add("lower="..rnd(v[1]-v[3]*sd))
  add("upper="..rnd(v[1]+v[3]*sd))
end

local function varp(v)
  local sd = math.sqrt(v[3])
  local q = v[2]-v[4]*sd
  if isWorking(v[5]) then
    add("Percent return VaR")
    add("sd=sqrt(var)="..rnd(sd))
    add("q=mu-z*sd")
    add("z="..rndZ(v[4]))
    add("VaR=abs(value*q/100)")
  end
  add("q percent="..rnd(q))
  add("VaR dollars="..rnd(math.abs(v[1]*q/100)))
  add("Sentence: loss threshold")
end

local function vard(v)
  local sd = math.sqrt(v[3])
  local q = v[2]-v[4]*sd
  if isWorking(v[5]) then
    add("Decimal return VaR")
    add("sd=sqrt(var)="..rnd(sd))
    add("q=mu-z*sd")
    add("z="..rndZ(v[4]))
    add("VaR=abs(value*q)")
  end
  add("q decimal="..rnd(q))
  add("VaR dollars="..rnd(math.abs(v[1]*q)))
  add("Sentence: loss threshold")
end

local function arch(v)
  local stat = v[1]*v[2]
  if isWorking(v[5]) then
    add("Hypotheses:")
    add("H0: no ARCH effects")
    add("H1: ARCH effects exist")
    add("ARCH LM=T*R2")
    add("df/lags="..rnd(v[3]))
  end
  add("LM="..rndChi(stat).." crit="..rndChi(v[4]))
  if stat>v[4] then add("Reject no ARCH"); add("Vol time-varying") else add("Fail reject"); add("No ARCH found") end
end

local function emh(v)
  local stat = v[1]*v[2]
  if isWorking(v[5]) then
    add("Hypotheses:")
    add("H0: no residual autocorr")
    add("H1: residual autocorr")
    add("Residual AR/BG stat=T*R2")
    add("df/lags="..rnd(v[3]))
  end
  add("stat="..rndChi(stat).." crit="..rndChi(v[4]))
  if stat>v[4] then add("Reject no autocorr"); add("Against weak EMH") else add("Fail reject"); add("No EMH evidence against") end
end

local function jb(v)
  local skp,kp = v[2]*v[2], ((v[3]-3)^2)/4
  local j = v[1]/6*(skp+kp)
  if isWorking(v[5]) then
    add("Hypotheses:")
    add("H0: normal distribution")
    add("H1: not normal")
    add("JB=n/6*(S^2+(K-3)^2/4)")
    add("S^2="..rnd(skp).." Kpart="..rnd(kp))
  end
  add("JB="..rndChi(j).." crit="..rndChi(v[4]))
  if v[2]<0 then add("Skew<0: left tail") elseif v[2]>0 then add("Skew>0: right tail") end
  if v[3]>3 then add("K>3: fat tails") end
  if j>v[4] then add("Reject normality") else add("Fail reject normal") end
end

local function diagflow(v)
  add("1 ARCH volatility decision")
  arch({v[1],v[2],5,v[3],v[11]})
  add("2 EMH autocorr decision")
  emh({v[4],v[5],2,v[6],v[11]})
  if v[7] and v[7] > 0 then
    add("3 JB normality decision")
    jb({v[7],v[8],v[9],v[10],v[11]})
  else
    add("JB skipped")
  end
end

local function gjr(v)
  if isWorking(v[3]) then
    add("News impact curve")
    add("Positive shock curvature=alpha")
    add("Negative shock curvature=alpha+lambda")
  end
  add("good news curvature="..rnd(v[1]))
  add("bad news curvature="..rnd(v[1]+v[2]))
  if v[2]>0 then add("Bad news bigger effect") elseif v[2]==0 then add("Symmetric effect") else add("Bad news smaller effect") end
end

local function aic(v)
  if isWorking(v[3]) then
    add("Model choice rule")
    add("Lower AIC preferred")
    add("AIC1="..rnd(v[1]).." AIC2="..rnd(v[2]))
  end
  if v[1]<v[2] then add("Choose model 1") elseif v[2]<v[1] then add("Choose model 2") else add("AIC tie") end
end

local funcs = {guide=guide,noteRisk=noteRisk,noteArchWhite=noteArchWhite,noteSkew=noteSkew,noteGjrModel=noteGjrModel,noteEmhSetup=noteEmhSetup,noteEmhForms=noteEmhForms,noteMaArch=noteMaArch,noteArch5=noteArch5,capmff=capmff,argarch=argarch,diagflow=diagflow,ctest=ctest,risk=risk,gmv2=gmv2,port2=port2,rssp=rssp,rlmfit=rlmfit,jchi=jchi,jf=jf,adf=adf,ar1m=ar1m,ar1f=ar1f,ar1fm=ar1fm,gar1=gar1,rgarch=rgarch,gper=gper,pi1=pi1,varp=varp,vard=vard,arch=arch,emh=emh,jb=jb,gjr=gjr,aic=aic}

local function runCurrent()
  output = {}
  outScroll = 1
  funcs[items[choice].fn](values)
  screen = "output"
  platform.window:invalidate()
end

local function startInput()
  if items[choice].fn == "exam" then
    screen = "examq"
    examQ = 1
    examPart = 1
    examScroll = 1
    platform.window:invalidate()
    return
  end
  if #items[choice].prompts == 0 then
    values = {}
    runCurrent()
    return
  end
  screen = "input"
  inputIndex = 1
  inputText = ""
  values = {}
  output = {}
  platform.window:invalidate()
end

local function color(gc, c)
  gc:setColorRGB(c[1], c[2], c[3])
end

function on.paint(gc)
  local y = 4
  if screen == "menu" then
    color(gc, BLUE); gc:setFont("sansserif","b",11)
    gc:drawString("ETC3460 Ultimate",4,y,"top"); y=y+16
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString("Up/Down choose. Enter select.",4,y,"top"); y=y+12
    local first = math.max(1, math.min(choice-2, #items-4))
    local lastGroup = ""
    for i=first, math.min(#items, first+4) do
      local it = items[i]
      if it.group ~= lastGroup then
        color(gc, ORANGE); gc:setFont("sansserif","b",8)
        gc:drawString(it.group,4,y,"top"); y=y+10
        lastGroup = it.group
      end
      if i == choice then color(gc, GREEN) else color(gc, BLACK) end
      gc:setFont("sansserif","b",9)
      gc:drawString((i==choice and "> " or "  ")..it.name,4,y,"top")
      color(gc, GREY); gc:setFont("sansserif","r",8)
      gc:drawString("   "..it.desc,14,y+10,"top")
      y=y+24
    end
  elseif screen == "input" then
    local it = items[choice]
    local p = it.prompts[inputIndex]
    color(gc, BLUE); gc:setFont("sansserif","b",11)
    gc:drawString(it.name,4,y,"top"); y=y+16
    color(gc, BLACK); gc:setFont("sansserif","b",10)
    gc:drawString("Input "..inputIndex.."/"..#it.prompts..": "..p.label,4,y,"top"); y=y+15
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString(p.help,4,y,"top"); y=y+13
    if p.example ~= "" then gc:drawString("Example: "..p.example,4,y,"top"); y=y+13 end
    color(gc, BLACK); gc:setFont("sansserif","b",11)
    gc:drawString(inputText,4,y,"top"); y=y+20
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString("Enter next | Backspace edit | Esc menu",4,y,"top")
  elseif screen == "output" then
    color(gc, BLUE); gc:setFont("sansserif","b",11)
    gc:drawString(items[choice].name.." result",4,y,"top"); y=y+16
    gc:setFont("sansserif","r",9)
    for i=outScroll, math.min(#output, outScroll+11) do
      local s = output[i]
      if string.find(s, "Reject") then color(gc, RED)
      elseif string.find(s, "Choose") or string.find(s, "preferred") or string.find(s, "ok") then color(gc, GREEN)
      else color(gc, BLACK) end
      gc:drawString(s,4,y,"top")
      y=y+13
    end
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString("Up/Down scroll | Enter/Esc menu",4,y+4,"top")
  elseif screen == "examq" then
    color(gc, BLUE); gc:setFont("sansserif","b",11)
    gc:drawString("2026 Exam Map",4,y,"top"); y=y+16
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString("Up/Down choose Q. Enter parts. Esc menu.",4,y,"top"); y=y+14
    for i=1,#exam do
      local q = exam[i]
      if i == examQ then color(gc, GREEN) else color(gc, BLACK) end
      gc:setFont("sansserif","b",9)
      gc:drawString((i==examQ and "> " or "  ")..q.q.." "..q.short,4,y,"top"); y=y+12
      color(gc, GREY); gc:setFont("sansserif","r",8)
      gc:drawString("   "..q.topic,14,y,"top"); y=y+18
    end
  elseif screen == "examparts" then
    local q = exam[examQ]
    color(gc, BLUE); gc:setFont("sansserif","b",11)
    gc:drawString(q.q.." "..q.short,4,y,"top"); y=y+16
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString("Enter view part. Esc back to Q list.",4,y,"top"); y=y+14
    local first = math.max(1, math.min(examPart-3, #q.parts-6))
    for i=first, math.min(#q.parts, first+6) do
      local p = q.parts[i]
      if i == examPart then color(gc, GREEN) else color(gc, BLACK) end
      gc:setFont("sansserif","b",9)
      gc:drawString((i==examPart and "> " or "  ")..p.label.." "..p.topic,4,y,"top")
      y=y+15
    end
  elseif screen == "examtext" then
    local q = exam[examQ]
    local p = q.parts[examPart]
    color(gc, BLUE); gc:setFont("sansserif","b",11)
    gc:drawString(q.q.." "..p.label.." - "..p.topic,4,y,"top"); y=y+16
    color(gc, GREY); gc:setFont("sansserif","r",8)
    gc:drawString("Up/Down scroll. Esc parts. Enter Q list.",4,y,"top"); y=y+14
    color(gc, BLACK); gc:setFont("sansserif","r",9)
    for i=examScroll, math.min(#p.lines, examScroll+10) do
      local s = p.lines[i]
      if string.find(s, "Use:") then color(gc, GREEN)
      elseif string.find(s, "Question:") then color(gc, BLUE)
      elseif string.find(s, "Working:") then color(gc, ORANGE)
      elseif string.find(s, "R output:") then color(gc, GREY)
      elseif string.find(s, "Output") or string.find(s, "Final:") then color(gc, RED)
      else color(gc, BLACK) end
      gc:drawString(s,4,y,"top")
      y=y+14
    end
  end
end

function on.arrowDown()
  if screen == "menu" then
    choice = choice + 1
    if choice > #items then choice = 1 end
  elseif screen == "output" then
    if outScroll < math.max(1,#output-11) then outScroll = outScroll + 1 end
  elseif screen == "examq" then
    examQ = examQ + 1
    if examQ > #exam then examQ = 1 end
  elseif screen == "examparts" then
    examPart = examPart + 1
    if examPart > #exam[examQ].parts then examPart = 1 end
  elseif screen == "examtext" then
    if examScroll < math.max(1,#exam[examQ].parts[examPart].lines-10) then examScroll = examScroll + 1 end
  end
  platform.window:invalidate()
end

function on.arrowUp()
  if screen == "menu" then
    choice = choice - 1
    if choice < 1 then choice = #items end
  elseif screen == "output" then
    if outScroll > 1 then outScroll = outScroll - 1 end
  elseif screen == "examq" then
    examQ = examQ - 1
    if examQ < 1 then examQ = #exam end
  elseif screen == "examparts" then
    examPart = examPart - 1
    if examPart < 1 then examPart = #exam[examQ].parts end
  elseif screen == "examtext" then
    if examScroll > 1 then examScroll = examScroll - 1 end
  end
  platform.window:invalidate()
end

function on.enterKey()
  if screen == "menu" then
    startInput()
  elseif screen == "input" then
    local n = tonumber(inputText)
    if n == nil then
      inputText = ""
    else
      values[inputIndex] = n
      inputIndex = inputIndex + 1
      inputText = ""
      if inputIndex > #items[choice].prompts then runCurrent() end
    end
  elseif screen == "output" then
    screen = "menu"
  elseif screen == "examq" then
    screen = "examparts"
    examPart = 1
  elseif screen == "examparts" then
    screen = "examtext"
    examScroll = 1
  elseif screen == "examtext" then
    screen = "examq"
  end
  platform.window:invalidate()
end

function on.escapeKey()
  if screen == "examtext" then
    screen = "examparts"
  elseif screen == "examparts" then
    screen = "examq"
  else
    screen = "menu"
    inputText = ""
  end
  platform.window:invalidate()
end

function on.backspaceKey()
  if screen == "input" and string.len(inputText) > 0 then
    inputText = string.sub(inputText,1,string.len(inputText)-1)
    platform.window:invalidate()
  end
end

function on.deleteKey()
  on.backspaceKey()
end

function on.charIn(ch)
  if screen == "input" then
    if string.find("0123456789.-eE", ch, 1, true) then
      inputText = inputText .. ch
      platform.window:invalidate()
    end
  end
end
