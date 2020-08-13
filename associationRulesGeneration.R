#external package that will obtain finalthe association rules
library(arules)

#loading dataset
badSmellData = read.table("aggUnited.txt",header=TRUE,sep=";",skip=0,
stringsAsFactor=F)

#removing desnecessary columns to the obtaintion of association rules
#and transforming to matrix format to coerce to transactions type
preparedData = as.matrix(badSmellData[,3:6])

#transforming data to transactions format
finalData = as(preparedData,"transactions")
print(summary(finalData))


#rulesP <- apriori(finalData, parameter=list(support=0.7,confidence=0.9))
#print(summary(rulesP))
#print(inspect(rulesP))
#write(rulesP,file="rulesP.csv",sep=",")
#print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

rulesA <- apriori(finalData, parameter=list(support=0.001,confidence=0.6))
print(summary(rulesA))
print(inspect(rulesA))
write(rulesA,file="rulesA.csv",sep=",")

print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

#rulesSep <- apriori(finalData, parameter=list(support=0.05, confidence=0.60))
#print(summary(rulesSep))
#print(inspect(rulesSep))
#write(rulesSep,file="rulesSep.csv",sep=",")


#metricasP = interestMeasure(rulesP,c("confidence","oddsRatio", "leverage"),transactions=finalData)
#metP = interestMeasure(rulesP,c("chiSquared"),transactions=finalData)

metricasA = interestMeasure(rulesA,c("confidence","oddsRatio", "leverage"),transactions=finalData)
metA = interestMeasure(rulesA,c("chiSquared"),transactions=finalData)
conjA = interestMeasure(rulesA,c("certainty","doc","imbalance","kappa","mutualInformation"),transactions=finalData)



#metricasSep = interestMeasure(rulesSep,c("confidence","oddsRatio", "leverage"),transactions=finalData)
#metSep = interestMeasure(rulesSep,c("chiSquared"),transactions=finalData)
#conjS = interestMeasure(rulesSep,c("certainty","doc","imbalance","kappa","mutualInformation"),transactions=finalData)






