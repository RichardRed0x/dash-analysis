library(ggplot2)
require(gridExtra)

pd = read.csv("Dash proposals final.csv", sep =",")
price = read.csv("dash price history.csv")

#how many proposals were approved, rejected, or approved then rejected (partial)
pd$approved = "No"
pd$approved[pd$payments_made > 0] = "Yes"
pd$approved[pd$payments_made > 0 & pd$payments_made < pd$total_payments  ] = "Partial"

table(pd$approved)
pd$Approved = factor(pd$approved, levels = c('Yes', "Partial", "No"))

p.approved <- ggplot(pd, aes(Approved, fill = Approved))+ geom_bar()+
  labs(x = "Proposal approved?", y = "Proposals")+
  scale_fill_manual(values=c("#9FE631", "#F9A30D", "#F90D1B"))


pd$votes = pd$yes + pd$no

pd$Approved = factor(pd$approved, levels = c('Yes', "Partial", "No"))


p.netscore = ggplot(pd, aes(net, fill = Approved)) + geom_histogram(bins = 20) +
  lims(x = c(-750, 1250))+
  labs(x = "Net Yes/No Score", y = "Number of Proposals") +
  scale_fill_manual(values=c("#9FE631", "#F9A30D", "#F90D1B"))


#price merging from CMC data
price$month = substr(price$Date, 0, 7)
ap = aggregate(Close ~ month, price, median)

pd$month = substr(pd$date, 0, 7)
pd$month[pd$month == "2015-08"] = "2015-09"

for(m in ap$month)
{
  pd$price[pd$month == m] = ap$Close[ap$month == m]
}

pd$usdprice = pd$monthly_payment * pd$price
pd$usdtotal = pd$total_allocated * pd$price  

sum(pd$usdtotal)
sum(pd$total_allocated)

pd$amonth = paste(pd$month, "-01", sep="")  
pd$pmonth = as.POSIXct(pd$amonth, format="%Y-%m-%d", tz="GMT")

m = unique(pd$month)
totaldash = seq(1:length(m))
coredash = seq(1:length(m))
month_core = data.frame(m, totaldash, coredash)

for(m in month_core$m)
  {
  month_core$totaldash[month_core$m == m] = sum(pd$monthly_payment[pd$month == m & pd$payments_made > 0])
  month_core$coredash[month_core$m == m] = sum(pd$monthly_payment[pd$month == m &  pd$payments_made > 0 & (pd$owner == "eduffield" | pd$owner == "babygiraffe")])
  
  }
month_core$coreprop = month_core$coredash/month_core$totaldash

month_core$amonth = paste(month_core$m, "-01", sep="")  
month_core$pmonth = as.POSIXct(month_core$amonth, format="%Y-%m-%d", tz="GMT")
month_core$core

p.coreprop = ggplot(month_core, aes(pmonth, coreprop*100)) +
  geom_smooth(method = "loess", se = FALSE, span = 0.5) +
  labs(x = "Month", y = "% Dash to new proposals from Core team")  +
  ylim(0,100)


#proposal categories
table(pd$type)

#proposals per category and approval
type.approval = aggregate( total_allocated ~ type + approved, data = pd, length)
type.approval$typef = factor(type.approval$type, levels = c("Marketing", "Events", "Support/Docs", "Organization", "Governance", "Research", "Liquidity",  "Misc", "Adoption", "Integration", "Non-Core Dev", "Core Dev"))

type.approval$Approved = factor(type.approval$approved, levels = c('Yes', "Partial", "No"))


p.type.approval <- ggplot(type.approval, aes(typef, total_allocated, fill = Approved))+ geom_col()+
  labs(x = "Proposal Category", y = "Number of Proposals")+
  theme(axis.text.x=element_text(angle=30, hjust=1)) +
  scale_fill_manual(values=c("#9FE631", "#F9A30D", "#F90D1B"))



#drop errors and low-DASH/USD categories before graphing resource spend
spd = pd[pd$flags != "mistake",]
spd = spd[spd$type != "Misc",]
spd = spd[spd$type != "Governance",]
spd = spd[spd$type != "Liquidity",]
spd = spd[spd$type != "Research",]

type.dash = aggregate(total_allocated ~ type, spd, sum)
type.dash$typef = factor(type.dash$type, levels = c("Marketing", "Events", "Support/Docs", "Organization", "Adoption", "Integration", "Non-Core Dev", "Core Dev"))

p.type.dash <- ggplot(type.dash, aes(typef, total_allocated, fill = typef))+ geom_col()+
  labs(x = "Proposal Category", y = "DASH awarded")+
  theme(axis.text.x=element_text(angle=30, hjust=1))


type.usd = aggregate(usdtotal ~ type, spd, sum)
type.usd$typef = factor(type.usd$type, levels = c("Marketing", "Events", "Support/Docs", "Organization", "Adoption", "Integration", "Non-Core Dev", "Core Dev"))


p.type.usd <- ggplot(type.usd, aes(typef, usdtotal, fill = typef))+ geom_col()+
  labs(x = "Proposal Category", y = "$USD awarded")+
  theme(axis.text.x=element_text(angle=30, hjust=1))

grid.arrange(p.type.dash, p.type.usd, ncol=2)

sum(pd$usdtotal[pd$type == "Marketing"])/sum(pd$usdtotal)
sum(pd$total_allocated[pd$type == "Marketing"])/sum(pd$total_allocated)


#histogram showing votes cast per proposal
pd$fapproved = factor(pd$approved, levels = c('Yes', "Partial", "No"))
pd$votes = pd$yes + pd$no 
p.votes = ggplot(pd, aes(votes, fill = fapproved)) + geom_histogram(bins = 20) +
  labs(x = "Votes", y = "Number of Proposals")+
  scale_fill_manual(values=c("#9FE631", "#F9A30D", "#F90D1B"))








