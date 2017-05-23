#get Dates in dd-mm-yyyy format
#remove , separator from numbers
setwd("~/Documents/R_Files/finance")
USDXGBP <- 1.25
per <- 0.2
start_date <-Sys.Date()-30
end_date <-Sys.Date()
df <- read.csv('finance.csv')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Cost <- as.numeric(as.character(df$Cost))
df$Cost<-ifelse(df$Currency=="S",df$Cost,df$Cost/USDXGBP)
dfMonth<-df[df$Date >= start_date & df$Date <= end_date,]
quant<-quantile(dfMonth$Cost, per ,na.rm=TRUE)
top_transactions<-subset(dfMonth, dfMonth$Cost < quant)
print(top_transactions)