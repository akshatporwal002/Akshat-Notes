platform.apilevel = '2.0'

local screen = "menu"
local choice = 1
local inputIndex = 1
local inputText = ""
local values = {}
local output = {}

local items = {
  {name="Coeff test", prompts={"est","se","h0","crit","type","mode"}, fn="ctest"},
  {name="Risk split", prompts={"R2","mode"}, fn="risk"},
  {name="GMV weights", prompts={"var1","var2","cov12","mode"}, fn="gmv2"},
  {name="Two-asset portfolio", prompts={"w1","ret1","ret2","var1","var2","cov12","mode"}, fn="port2"},
  {name="RSS from RSE", prompts={"RSE","df","mode"}, fn="rssp"},
  {name="Joint chi test", prompts={"RSSr","RSSu","dfu","crit","mode"}, fn="jchi"},
  {name="Joint F test", prompts={"RSSr","RSSu","q","dfu","crit","mode"}, fn="jf"},
  {name="ADF decision", prompts={"ADF stat","crit","mode"}, fn="adf"},
  {name="AR1 moments", prompts={"c","phi","innov var","mode"}, fn="ar1m"},
  {name="AR1 forecast", prompts={"c","phi","last","mode"}, fn="ar1f"},
  {name="Mean adj AR forecast", prompts={"mu0","phi","last","mode"}, fn="ar1fm"},
  {name="GARCH forecast", prompts={"omega","alpha","beta","resid","var","mode"}, fn="gar1"},
  {name="GARCH persistence", prompts={"alpha","beta","mode"}, fn="gper"},
  {name="Prediction interval", prompts={"mu","var","z","mode"}, fn="pi1"},
  {name="VaR percent returns", prompts={"value","mu pct","var","z","mode"}, fn="varp"},
  {name="VaR decimal returns", prompts={"value","mu dec","var","z","mode"}, fn="vard"},
  {name="ARCH LM", prompts={"n/T","R2","q","crit","mode"}, fn="arch"},
  {name="EMH residual test", prompts={"n/T","R2","p","crit","mode"}, fn="emh"},
  {name="Jarque-Bera", prompts={"n","skew","kurt","crit","mode"}, fn="jb"},
  {name="GJR curvature", prompts={"alpha","lambda","mode"}, fn="gjr"},
  {name="AIC comparison", prompts={"AIC1","AIC2","mode"}, fn="aic"}
}

local function rnd(x)
  if not x then return "nil" end
  return string.format("%.6g", x)
end

local function add(s)
  output[#output+1] = tostring(s)
end

local function mode(v)
  return tonumber(v or 0) == 1
end

local function ctest(v)
  local est,se,h0,crit,typ,m = v[1],v[2],v[3],v[4],v[5],mode(v[6])
  local t = (est-h0)/se
  local at = math.abs(t)
  if m then add("t=(est-h0)/se"); add("est="..rnd(est).." h0="..rnd(h0)); add("se="..rnd(se)) end
  add("t="..rnd(t))
  if m then add("|t|="..rnd(at).." crit="..rnd(crit)) end
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
    if typ==4 then add("SMB not significant")
    elseif typ==5 then add("HML not significant")
    elseif typ==6 then add("MOM not significant")
    elseif typ==7 then add("No leverage evidence")
    else add("Insufficient evidence") end
  end
end

local function risk(v)
  local r2,m = v[1],mode(v[2])
  if m then add("systematic=R2"); add("idiosyn=1-R2") end
  add("systematic="..rnd(r2))
  add("idiosyn="..rnd(1-r2))
  add("sys%="..rnd(100*r2))
  add("idio%="..rnd(100*(1-r2)))
end

local function gmv2(v)
  local v1,v2,c12,m = v[1],v[2],v[3],mode(v[4])
  local num = v2-c12
  local den = v1+v2-2*c12
  local w1 = num/den
  if m then add("w1=(v2-cov)/den"); add("num="..rnd(num)); add("den="..rnd(den)) end
  add("w1="..rnd(w1))
  add("w2="..rnd(1-w1))
end

local function port2(v)
  local w1,r1,r2,v1,v2,c12,m = v[1],v[2],v[3],v[4],v[5],v[6],mode(v[7])
  local w2 = 1-w1
  local pret = w1*r1+w2*r2
  local pv = w1*w1*v1+w2*w2*v2+2*w1*w2*c12
  if m then add("w2=1-w1="..rnd(w2)); add("var=w1^2v1+w2^2v2+2w1w2cov") end
  add("port ret="..rnd(pret))
  add("port var="..rnd(pv))
  add("port sd="..rnd(math.sqrt(pv)))
end

local function rssp(v)
  local rse,df,m = v[1],v[2],mode(v[3])
  if m then add("RSS=RSE^2*df") end
  add("RSS="..rnd(rse*rse*df))
end

local function jchi(v)
  local rssr,rssu,dfu,crit,m = v[1],v[2],v[3],v[4],mode(v[5])
  local num = rssr-rssu
  local den = rssu/dfu
  local j = num/den
  if m then add("J=(RSSr-RSSu)/(RSSu/dfu)"); add("num="..rnd(num).." den="..rnd(den)) end
  add("J="..rnd(j).." crit="..rnd(crit))
  if j>crit then add("Reject restrictions"); add("Use larger model") else add("Fail reject"); add("Restricted ok") end
end

local function jf(v)
  local rssr,rssu,q,dfu,crit,m = v[1],v[2],v[3],v[4],v[5],mode(v[6])
  local num = (rssr-rssu)/q
  local den = rssu/dfu
  local f = num/den
  if m then add("F=((RSSr-RSSu)/q)/(RSSu/dfu)"); add("num="..rnd(num).." den="..rnd(den)) end
  add("F="..rnd(f).." crit="..rnd(crit))
  if f>crit then add("Reject restrictions"); add("Use larger model") else add("Fail reject"); add("Restricted ok") end
end

local function adf(v)
  local stat,crit,m = v[1],v[2],mode(v[3])
  if m then add("Reject if stat < crit"); add("stat="..rnd(stat).." crit="..rnd(crit)) end
  if stat<crit then add("Reject unit root"); add("Evidence stationary") else add("Fail reject unit root"); add("Treat non-stationary") end
end

local function ar1m(v)
  local c,phi,s2,m = v[1],v[2],v[3],mode(v[4])
  if m then add("mean=c/(1-phi)"); add("var=s2/(1-phi^2)") end
  add("mean="..rnd(c/(1-phi)))
  add("var="..rnd(s2/(1-phi*phi)))
  if math.abs(phi)<1 then add("abs(phi)<1: stat ok") else add("not stationary") end
end

local function ar1f(v)
  local c,phi,last,m = v[1],v[2],v[3],mode(v[4])
  if m then add("fc=c+phi*last") end
  add("forecast="..rnd(c+phi*last))
end

local function ar1fm(v)
  local mu0,phi,last,m = v[1],v[2],v[3],mode(v[4])
  if m then add("fc=mu0+phi*(last-mu0)") end
  add("forecast="..rnd(mu0+phi*(last-mu0)))
end

local function gar1(v)
  local w,a,b,u,var,m = v[1],v[2],v[3],v[4],v[5],mode(v[6])
  local shock = a*u*u
  local persist = b*var
  local vn = w+shock+persist
  if m then add("var=w+a*u^2+b*var"); add("shock="..rnd(shock)); add("persist="..rnd(persist)) end
  add("next var="..rnd(vn))
  add("next sd="..rnd(math.sqrt(vn)))
end

local function gper(v)
  local p,m = v[1]+v[2],mode(v[3])
  if m then add("persist=alpha+beta") end
  add("persist="..rnd(p))
  if p<1 then add("Finite var condition ok"); if p>.9 then add("Highly persistent") end else add("Condition fails") end
end

local function pi1(v)
  local mu,var,z,m = v[1],v[2],v[3],mode(v[4])
  local sd = math.sqrt(var)
  if m then add("PI=mu +/- z*sd"); add("sd="..rnd(sd)) end
  add("lower="..rnd(mu-z*sd))
  add("upper="..rnd(mu+z*sd))
end

local function varp(v)
  local value,mu,var,z,m = v[1],v[2],v[3],v[4],mode(v[5])
  local sd = math.sqrt(var)
  local q = mu-z*sd
  if m then add("Percent return VaR"); add("q=mu-z*sd"); add("VaR=abs(value*q/100)") end
  add("q percent="..rnd(q))
  add("VaR dollars="..rnd(math.abs(value*q/100)))
end

local function vard(v)
  local value,mu,var,z,m = v[1],v[2],v[3],v[4],mode(v[5])
  local sd = math.sqrt(var)
  local q = mu-z*sd
  if m then add("Decimal return VaR"); add("q=mu-z*sd"); add("VaR=abs(value*q)") end
  add("q decimal="..rnd(q))
  add("VaR dollars="..rnd(math.abs(value*q)))
end

local function arch(v)
  local stat = v[1]*v[2]
  local crit = v[4]
  if mode(v[5]) then add("ARCH LM=T*R2"); add("df="..rnd(v[3])) end
  add("LM="..rnd(stat).." crit="..rnd(crit))
  if stat>crit then add("Reject no ARCH"); add("Vol time-varying") else add("Fail reject"); add("No ARCH found") end
end

local function emh(v)
  local stat = v[1]*v[2]
  local crit = v[4]
  if mode(v[5]) then add("Residual AR test=T*R2"); add("df="..rnd(v[3])) end
  add("stat="..rnd(stat).." crit="..rnd(crit))
  if stat>crit then add("Reject no autocorr"); add("Against weak EMH") else add("Fail reject"); add("No EMH evidence against") end
end

local function jb(v)
  local n,sk,ku,crit,m = v[1],v[2],v[3],v[4],mode(v[5])
  local skp = sk*sk
  local kp = ((ku-3)^2)/4
  local j = n/6*(skp+kp)
  if m then add("JB=n/6*(S^2+(K-3)^2/4)"); add("S^2="..rnd(skp)); add("Kpart="..rnd(kp)) end
  add("JB="..rnd(j).." crit="..rnd(crit))
  if sk<0 then add("Skew<0: left tail") elseif sk>0 then add("Skew>0: right tail") end
  if ku>3 then add("K>3: fat tails") end
  if j>crit then add("Reject normality") else add("Fail reject normal") end
end

local function gjr(v)
  local a,l,m = v[1],v[2],mode(v[3])
  if m then add("good=alpha"); add("bad=alpha+lambda") end
  add("good="..rnd(a))
  add("bad="..rnd(a+l))
  if l>0 then add("Bad news bigger effect") elseif l==0 then add("Symmetric effect") else add("Bad news smaller effect") end
end

local function aic(v)
  local a1,a2,m = v[1],v[2],mode(v[3])
  if m then add("Lower AIC preferred"); add("AIC1="..rnd(a1).." AIC2="..rnd(a2)) end
  if a1<a2 then add("Choose model 1") elseif a2<a1 then add("Choose model 2") else add("AIC tie") end
end

local funcs = {ctest=ctest,risk=risk,gmv2=gmv2,port2=port2,rssp=rssp,jchi=jchi,jf=jf,adf=adf,ar1m=ar1m,ar1f=ar1f,ar1fm=ar1fm,gar1=gar1,gper=gper,pi1=pi1,varp=varp,vard=vard,arch=arch,emh=emh,jb=jb,gjr=gjr,aic=aic}

local function runCurrent()
  output = {}
  funcs[items[choice].fn](values)
  screen = "output"
  platform.window:invalidate()
end

local function startInput()
  screen = "input"
  inputIndex = 1
  inputText = ""
  values = {}
  output = {}
  platform.window:invalidate()
end

function on.paint(gc)
  gc:setFont("sansserif","r",10)
  local y = 4
  if screen == "menu" then
    gc:drawString("ETC3460 Toolkit",4,y,"top"); y=y+16
    gc:drawString("Up/Down choose, Enter select",4,y,"top"); y=y+14
    local first = math.max(1, math.min(choice-5, #items-10))
    for i=first, math.min(#items, first+10) do
      local prefix = "  "
      if i == choice then prefix = "> " end
      gc:drawString(prefix..i.." "..items[i].name,4,y,"top")
      y = y + 14
    end
  elseif screen == "input" then
    local it = items[choice]
    gc:drawString(it.name,4,y,"top"); y=y+16
    gc:drawString("Enter "..it.prompts[inputIndex]..":",4,y,"top"); y=y+16
    gc:drawString(inputText,4,y,"top"); y=y+18
    gc:drawString("Enter=next  Back=edit",4,y,"top"); y=y+14
    gc:drawString("Esc=menu. mode 0/1",4,y,"top")
  elseif screen == "output" then
    gc:drawString(items[choice].name.." result",4,y,"top"); y=y+16
    for i=1, math.min(#output, 12) do
      gc:drawString(output[i],4,y,"top")
      y = y + 14
    end
    gc:drawString("Enter/Esc: menu",4,y+4,"top")
  end
end

function on.arrowDown()
  if screen == "menu" then
    choice = choice + 1
    if choice > #items then choice = 1 end
    platform.window:invalidate()
  end
end

function on.arrowUp()
  if screen == "menu" then
    choice = choice - 1
    if choice < 1 then choice = #items end
    platform.window:invalidate()
  end
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
    platform.window:invalidate()
  elseif screen == "output" then
    screen = "menu"
    platform.window:invalidate()
  end
end

function on.escapeKey()
  screen = "menu"
  inputText = ""
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
    if string.find("0123456789.-", ch, 1, true) then
      inputText = inputText .. ch
      platform.window:invalidate()
    end
  end
end
