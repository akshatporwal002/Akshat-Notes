from math import sqrt


def fnum(prompt):
    while True:
        try:
            return float(input(prompt))
        except Exception:
            print("Enter a number.")


def inum(prompt):
    while True:
        try:
            return int(float(input(prompt)))
        except Exception:
            print("Enter an integer.")


def mode_prompt():
    m = inum("Mode 0 compact, 1 working: ")
    return 1 if m == 1 else 0


def decision(stat, crit):
    return stat > crit


def ctest(est, se, h0, crit, typ, mode=0):
    t = (est - h0) / se
    at = abs(t)
    if mode:
        print("t=(est-h0)/se")
        print("est=", est)
        print("h0=", h0)
        print("se=", se)
    print("t=", round(t, 6))
    if mode:
        print("|t|=", round(at, 6))
        print("crit=", crit)
    if at > crit:
        print("Reject H0")
        if typ == 1:
            print("Coeff differs from h0")
        elif typ == 2:
            print("Beta differs from h0")
            if est > 1:
                print("Beta>1: aggressive")
            elif est < 1:
                print("Beta<1: defensive")
        elif typ == 3:
            print("Alpha differs from 0")
            print("Abnormal return")
        elif typ == 4:
            print("SMB is significant")
            print("Positive: small tilt" if est > 0 else "Negative: big tilt")
        elif typ == 5:
            print("HML is significant")
            print("Positive: value tilt" if est > 0 else "Negative: growth tilt")
        elif typ == 6:
            print("MOM is significant")
            print("Positive: winner tilt" if est > 0 else "Negative: loser tilt")
        elif typ == 7:
            print("Leverage term matters")
    else:
        print("Fail reject H0")
        if typ == 1:
            print("Insufficient evidence")
        elif typ == 2:
            print("No clear beta diff")
        elif typ == 3:
            print("No abnormal return found")
        elif typ == 4:
            print("SMB not significant")
        elif typ == 5:
            print("HML not significant")
        elif typ == 6:
            print("MOM not significant")
        elif typ == 7:
            print("No leverage evidence")


def risk(r2, mode=0):
    sys = r2
    idio = 1 - r2
    if mode:
        print("systematic=R2")
        print("idiosyncratic=1-R2")
    print("systematic=", round(sys, 6))
    print("idiosyncratic=", round(idio, 6))
    print("sys%=", round(100 * sys, 4))
    print("idio%=", round(100 * idio, 4))


def gmv2(v1, v2, c12, mode=0):
    num = v2 - c12
    den = v1 + v2 - 2 * c12
    w1 = num / den
    w2 = 1 - w1
    if mode:
        print("w1=(v2-cov)/(v1+v2-2cov)")
        print("num=", round(num, 8))
        print("den=", round(den, 8))
    print("w1=", round(w1, 6))
    print("w2=", round(w2, 6))
    print("Risk min weights")


def port2(w1, r1, r2, v1, v2, c12, mode=0):
    w2 = 1 - w1
    pret = w1 * r1 + w2 * r2
    pv = w1 ** 2 * v1 + w2 ** 2 * v2 + 2 * w1 * w2 * c12
    ps = sqrt(pv)
    if mode:
        print("w2=1-w1=", round(w2, 6))
        print("ret=w1*r1+w2*r2")
        print("var=w1^2*v1+w2^2*v2+2*w1*w2*cov")
    print("port ret=", round(pret, 6))
    print("port var=", round(pv, 6))
    print("port sd=", round(ps, 6))


def rssp(rse, df, mode=0):
    rv = rse ** 2 * df
    if mode:
        print("RSS=RSE^2*df")
        print("RSE=", rse)
        print("df=", df)
    print("RSS=", round(rv, 6))


def jchi(rssr, rssu, dfu, crit, mode=0):
    num = rssr - rssu
    den = rssu / dfu
    j = num / den
    if mode:
        print("J=(RSSr-RSSu)/(RSSu/dfu)")
        print("num=", round(num, 6))
        print("den=", round(den, 6))
    print("J=", round(j, 6))
    print("crit=", crit)
    print("Reject restrictions" if j > crit else "Fail reject")
    print("Use larger model" if j > crit else "Restricted ok")


def jf(rssr, rssu, q, dfu, crit, mode=0):
    num = (rssr - rssu) / q
    den = rssu / dfu
    f = num / den
    if mode:
        print("F=((RSSr-RSSu)/q)/(RSSu/dfu)")
        print("num=", round(num, 6))
        print("den=", round(den, 6))
    print("F=", round(f, 6))
    print("crit=", crit)
    print("Reject restrictions" if f > crit else "Fail reject")
    print("Use larger model" if f > crit else "Restricted ok")


def adf(stat, crit, mode=0):
    if mode:
        print("ADF reject if stat < crit")
        print("stat=", stat)
        print("crit=", crit)
    if stat < crit:
        print("Reject unit root")
        print("Evidence stationary")
    else:
        print("Fail reject unit root")
        print("Treat non-stationary")


def ar1m(c, phi, s2, mode=0):
    m = c / (1 - phi)
    v = s2 / (1 - phi ** 2)
    if mode:
        print("mean=c/(1-phi)")
        print("var=s2/(1-phi^2)")
    print("mean=", round(m, 6))
    print("var=", round(v, 6))
    print("abs(phi)<1: stat ok" if abs(phi) < 1 else "abs(phi)>=1: not stationary")


def ar1f(c, phi, last, mode=0):
    mu = c + phi * last
    if mode:
        print("forecast=c+phi*last")
    print("forecast=", round(mu, 6))


def ar1fm(mu0, phi, last, mode=0):
    mu = mu0 + phi * (last - mu0)
    if mode:
        print("forecast=mu0+phi*(last-mu0)")
    print("forecast=", round(mu, 6))


def gar1(w, a, b, u, v, mode=0):
    shock = a * u ** 2
    persist = b * v
    vn = w + shock + persist
    sd = sqrt(vn)
    if mode:
        print("var=w+a*u^2+b*v")
        print("omega=", w)
        print("shock=", round(shock, 6))
        print("persist=", round(persist, 6))
    print("next var=", round(vn, 6))
    print("next sd=", round(sd, 6))


def gper(a, b, mode=0):
    p = a + b
    if mode:
        print("persist=alpha+beta")
    print("persist=", round(p, 6))
    if p < 1:
        print("Finite var condition ok")
        if p > 0.9:
            print("Highly persistent")
    else:
        print("Condition fails")


def pi1(mu, v, z, mode=0):
    sd = sqrt(v)
    lo = mu - z * sd
    hi = mu + z * sd
    if mode:
        print("PI=mu +/- z*sd")
        print("sd=", round(sd, 6))
    print("lower=", round(lo, 6))
    print("upper=", round(hi, 6))


def varp(value, mu, v, z, mode=0):
    sd = sqrt(v)
    q = mu - z * sd
    dv = abs(value * q / 100)
    if mode:
        print("Percent return VaR")
        print("sd=", round(sd, 6))
        print("q=mu-z*sd")
        print("VaR=abs(value*q/100)")
    print("q percent=", round(q, 6))
    print("VaR dollars=", round(dv, 2))
    print("Tail chance worse")


def vard(value, mu, v, z, mode=0):
    sd = sqrt(v)
    q = mu - z * sd
    dv = abs(value * q)
    if mode:
        print("Decimal return VaR")
        print("sd=", round(sd, 6))
        print("q=mu-z*sd")
        print("VaR=abs(value*q)")
    print("q decimal=", round(q, 6))
    print("VaR dollars=", round(dv, 2))
    print("Tail chance worse")


def arch(nobs, r2, q, crit, mode=0):
    stat = nobs * r2
    if mode:
        print("ARCH LM=T*R2")
        print("df=", q)
    print("LM=", round(stat, 6))
    print("crit=", crit)
    if stat > crit:
        print("Reject no ARCH")
        print("Vol time-varying")
    else:
        print("Fail reject")
        print("No ARCH found")


def emh(nobs, r2, p, crit, mode=0):
    stat = nobs * r2
    if mode:
        print("Residual AR test=T*R2")
        print("df=", p)
    print("stat=", round(stat, 6))
    print("crit=", crit)
    if stat > crit:
        print("Reject no autocorr")
        print("Against weak EMH")
    else:
        print("Fail reject")
        print("No EMH evidence against")


def jb(nobs, sk, ku, crit, mode=0):
    skpart = sk ** 2
    kpart = ((ku - 3) ** 2) / 4
    j = nobs / 6 * (skpart + kpart)
    if mode:
        print("JB=n/6*(S^2+(K-3)^2/4)")
        print("S^2=", round(skpart, 6))
        print("K part=", round(kpart, 6))
    print("JB=", round(j, 6))
    print("crit=", crit)
    if sk < 0:
        print("Skew<0: left tail")
    elif sk > 0:
        print("Skew>0: right tail")
    if ku > 3:
        print("K>3: fat tails")
    print("Reject normality" if j > crit else "Fail reject normal")


def gjr(a, lmb, mode=0):
    good = a
    bad = a + lmb
    if mode:
        print("good curvature=alpha")
        print("bad curvature=alpha+lambda")
    print("good=", round(good, 6))
    print("bad=", round(bad, 6))
    if lmb > 0:
        print("Bad news bigger effect")
    elif lmb == 0:
        print("Symmetric effect")
    else:
        print("Bad news smaller effect")


def aic(a1, a2, mode=0):
    if mode:
        print("Lower AIC preferred")
        print("model1 AIC=", a1)
        print("model2 AIC=", a2)
    if a1 < a2:
        print("Choose model 1")
    elif a2 < a1:
        print("Choose model 2")
    else:
        print("AIC tie")


def menu():
    print("")
    print("ETC3460 Toolkit")
    print("1 Coeff test")
    print("2 Risk split")
    print("3 GMV weights")
    print("4 Two-asset portfolio")
    print("5 RSS from RSE")
    print("6 Joint chi test")
    print("7 Joint F test")
    print("8 ADF decision")
    print("9 AR1 moments")
    print("10 AR1 forecast")
    print("11 Mean-adjusted AR forecast")
    print("12 GARCH forecast")
    print("13 GARCH persistence")
    print("14 Prediction interval")
    print("15 VaR percent returns")
    print("16 VaR decimal returns")
    print("17 ARCH LM")
    print("18 EMH residual test")
    print("19 Jarque-Bera")
    print("20 GJR curvature")
    print("21 AIC comparison")
    print("0 Exit")


def run_choice(ch):
    if ch == 1:
        print("type: 1 gen 2 beta 3 alpha 4 SMB 5 HML 6 MOM 7 lev")
        ctest(fnum("est: "), fnum("se: "), fnum("h0: "),
              fnum("crit: "), inum("type: "), mode_prompt())
    elif ch == 2:
        risk(fnum("R2: "), mode_prompt())
    elif ch == 3:
        gmv2(fnum("var1: "), fnum("var2: "), fnum("cov12: "), mode_prompt())
    elif ch == 4:
        port2(fnum("w1: "), fnum("ret1: "), fnum("ret2: "),
              fnum("var1: "), fnum("var2: "), fnum("cov12: "), mode_prompt())
    elif ch == 5:
        rssp(fnum("RSE: "), fnum("df: "), mode_prompt())
    elif ch == 6:
        jchi(fnum("RSS restricted: "), fnum("RSS unrestricted: "),
             fnum("df unrestricted: "), fnum("crit: "), mode_prompt())
    elif ch == 7:
        jf(fnum("RSS restricted: "), fnum("RSS unrestricted: "),
           fnum("q restrictions: "), fnum("df unrestricted: "), fnum("crit: "),
           mode_prompt())
    elif ch == 8:
        adf(fnum("ADF stat: "), fnum("crit: "), mode_prompt())
    elif ch == 9:
        ar1m(fnum("c: "), fnum("phi: "), fnum("innovation variance: "), mode_prompt())
    elif ch == 10:
        ar1f(fnum("c: "), fnum("phi: "), fnum("last: "), mode_prompt())
    elif ch == 11:
        ar1fm(fnum("mu0: "), fnum("phi: "), fnum("last: "), mode_prompt())
    elif ch == 12:
        gar1(fnum("omega: "), fnum("alpha: "), fnum("beta: "),
             fnum("last residual: "), fnum("last variance: "), mode_prompt())
    elif ch == 13:
        gper(fnum("alpha: "), fnum("beta: "), mode_prompt())
    elif ch == 14:
        pi1(fnum("mu: "), fnum("variance: "), fnum("z: "), mode_prompt())
    elif ch == 15:
        varp(fnum("position value: "), fnum("mu percent: "),
             fnum("variance: "), fnum("z: "), mode_prompt())
    elif ch == 16:
        vard(fnum("position value: "), fnum("mu decimal: "),
             fnum("variance: "), fnum("z: "), mode_prompt())
    elif ch == 17:
        arch(fnum("n/T: "), fnum("R2: "), fnum("q lags: "),
             fnum("crit: "), mode_prompt())
    elif ch == 18:
        emh(fnum("n/T: "), fnum("R2: "), fnum("p lags: "),
            fnum("crit: "), mode_prompt())
    elif ch == 19:
        jb(fnum("n: "), fnum("skew: "), fnum("kurtosis: "),
           fnum("crit: "), mode_prompt())
    elif ch == 20:
        gjr(fnum("alpha: "), fnum("lambda: "), mode_prompt())
    elif ch == 21:
        aic(fnum("AIC model 1: "), fnum("AIC model 2: "), mode_prompt())
    else:
        print("Unknown choice.")


def main():
    while True:
        menu()
        ch = inum("Choice: ")
        if ch == 0:
            print("Done.")
            break
        print("")
        run_choice(ch)
        print("")


main()
