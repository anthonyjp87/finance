#get Dates in dd-mm-yyyy format
#remove , separator from numbers
USDXGBP <- 1.25
df <- read.csv('finance.csv')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Cost <- as.numeric(as.character(df$Cost))
df$Cost<-ifelse(df$Currency=="S",df$Cost,df$Cost/USDXGBP)
dfMonth<-df[df$Date >= "2017-2-1" & df$Date <= "2017-3-1",]
quant_10<-quantile(dfMonth$Cost, 0.1,na.rm=TRUE)
top_10per_transactions<-subset(dfMonth, dfMonth$Cost < quant_10)
print(top_10per_transactions)