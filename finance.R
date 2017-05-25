#get Dates in dd-mm-yyyy format
#remove , separator from numbers
library(quantmod)
setwd("~/Documents/R_Files/finance")  
USDXGBP <- 1.25
getFX("GBP/USD")
per <- 0.2
start_date <-Sys.Date()-30
end_date <-Sys.Date()
df <- read.csv('finance.csv')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Cost <- as.numeric(as.character(df$Cost))


# df$Cost<-ifelse(df$Currency=="S",df$Cost,df$Cost/USDXGBP)
dfMonth<-df[df$Date >= start_date & df$Date <= end_date,]
quant<-quantile(dfMonth$Cost, per, na.rm=TRUE)
top_transactions<-subset(dfMonth, dfMonth$Cost < quant)
print(top_transactions)

print("Total Expenses over the past 30 days: ")
print(sum(dfMonth$Cost[dfMonth$Cost<0]))
print("Total Income over the past 30 days: ")
print((dfMonth[dfMonth$Cost>0,]))

hist(df$Cost[df$Currency=='S' & df$Cost<0 & df$Cost>-100], breaks=50)

truecost<-numeric()
for (i in 0:length(df$Date)){
  truecost <- c(truecost,ifelse(df$Currency[i]=="D",df$Cost[i]/GBPUSD[df$Date[i]],df$Cost[i]))
} 
df<-cbind(df,truecost)

      
      