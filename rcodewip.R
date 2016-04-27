library(dplyr)
library(tidyr)

# Data processing
#stormdata<-read.csv("repdata-data-StormData.csv")
typesummary<-select(stormdata,EVTYPE,FATALITIES,INJURIES,PROPDMG,PROPDMGEXP,CROPDMG,CROPDMGEXP)

# Filter out Event Types that have no injuries or fatalities
healthimpact<-summarise_each(group_by(select(typesummary,EVTYPE,FATALITIES,INJURIES),EVTYPE),funs(sum))
healthimpact<-filter(healthimpact,FATALITIES>0 | INJURIES>0)

# Results
