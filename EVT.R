
remove(list = ls())

library(evir)

data("danish")

par(new = T)
hist(danish, breaks = 200, xlim = c(0,20), multiple = F)

sum(danish>20) / length(danish)
sum(danish[danish>20]) / sum(danish)


emplot(danish, alog = "xy")

qplot(danish, trim = 100)

meplot(danish, omit = 4)

length(danish[danish>10])

gpdfit <- gpd(danish, threshold = 10)

gpdfit$par.ests
gpdfit$par.ses



plot.gpd(gpdfit,1)

# VaR 99.9%
tp <- tailplot(gpdfit)
gpd.q(tp, pp = 0.999, ci.p = 0.95)

# quantile using only data points gives wrong estimate
# very few points with high values
quantile(danish, probs = 0.999, type = 1)

q99 = gpd.q(tp, pp = 0.99)
shortfall = gpd.sfall(tp, 0.99)
cat('assuming that the 99% quantile of ', q99[2] ,' million is exceeded, 
    the expected shortfall or loss is ', shortfall[2])


