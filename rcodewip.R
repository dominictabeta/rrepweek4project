library(dplyr)
library(tidyr)

# Data processing
#stormdata<-read.csv("repdata-data-StormData.csv")
typesummary<-select(stormdata,EVTYPE,FATALITIES,INJURIES,PROPDMG,PROPDMGEXP,CROPDMG,CROPDMGEXP)

# Filter out Event Types that have no injuries or fatalities
healthimpact<-summarise_each(group_by(select(typesummary,EVTYPE,FATALITIES,INJURIES),EVTYPE),funs(sum))
healthimpact<-filter(healthimpact,FATALITIES>0 | INJURIES>0)
healthimpact<-mutate(healthimpact,casualties=FATALITIES+INJURIES)

damageimpact<-summarise_each(group_by(select(typesummary,EVTYPE,PROPDMG,PROPDMGEXP,CROPDMG,CROPDMGEXP),EVTYPE,PROPDMGEXP,CROPDMGEXP),funs(sum))
damageimpact<-filter(damageimpact,CROPDMG>0 | PROPDMG>0)
#for (i in 1:nrow(damageimpact)) {
#        if (damageimpact[i,"PROPDMGEXP"]=="K") {
#                damageimpact[i,"PROPDMGEXP"]<-"M"
#        }
#}

#damageimpact$PROPDMGEXP[(damageimpact$PROPDMGEXP == "h") | (damageimpact$PROPDMGEXP == "H")] <- 100


# Results
