
# load in the stuff you will need for this

library(plyr)
library(dplyr)
library (psych)
library (ggplot2)
library (xlsx)

# reading in the data here

dataset <- read.xlsx("Relating_to_Research_DATA_CLEAN.xlsx", sheetIndex = 1)

#Let's you check that the variables are really the type you want them to be.
str(dataset)
str(dataset.attn)

count (dataset,Essay_Length)
count(dataset, Essay_Content)
count (dataset, English)
count (dataset, Whatabout_Coded)
hist(dataset$English, main="Historgram of Importance of communal goals", xlab="Importance 1-9")


#give labels to gender data
dataset$GenderF <- factor(dataset$Gender,
                          levels = c(0,1),
                          labels = c("Male", "Female"))

attach(dataset)
mytable3 <- table(dataset$Condition_TXT,Essay_Length) 
mytable3

attach(dataset)
mytable <- table(dataset$Condition_TXT,Essay_Content) 
mytable

attach(dataset)
mytable2 <- table(dataset$Condition_TXT,Whatabout_Coded) 
mytable2


## Making composite variables
# composite for the personal importance of achieaving goals
dataset$comm_imp <- ((dataset$Imp_comm1 + dataset$Imp_comm2 + dataset$Imp_comm3 + dataset$Imp_comm4 + dataset$Imp_comm5 + dataset$Imp_comm6 + dataset$Imp_comm7)/7)
dataset$agen_imp <- ((dataset$Imp_agen1 + dataset$Imp_agen2 + dataset$Imp_agen3 + dataset$Imp_agen4 + dataset$Imp_agen5 + dataset$Imp_agen6 + dataset$Imp_agen7)/7)


hist(dataset.attn$comm_imp, main="Historgram of Importance of communal goals", xlab="Importance 1-9")

# composite for the personal satisfaction of achieaving goals
dataset$comm_Sat <- ((dataset$Sat_comm1 + dataset$Sat_comm2 + dataset$Sat_comm3 + dataset$Sat_comm4 + dataset$Sat_comm5 + dataset$Sat_comm6 + dataset$Sat_comm7)/7)
dataset$agen_Sat <- ((dataset$Sat_agen1 + dataset$Sat_agen2 + dataset$Sat_agen3 + dataset$Sat_agen4 + dataset$Sat_agen5 + dataset$Sat_agen6 + dataset$Sat_agen7)/7)

# composite for how beneficial in the longterm achieving goals will be

dataset$comm_Ben <- ((dataset$Ben_comm1 + dataset$Ben_comm2 + dataset$Ben_comm3 + dataset$Ben_comm4 + dataset$Ben_comm5 + dataset$Ben_comm6 + dataset$Ben_comm7)/7)
dataset$agen_Ben <- ((dataset$Ben_agen1 + dataset$Ben_agen2 + dataset$Ben_agen3 + dataset$Ben_agen4 + dataset$Ben_agen5 + dataset$Ben_agen6 + dataset$Ben_agen7)/7)

##### chronbachs alpha's
# Need to make subeset dataframe for each one colletion of variables

## excluding thos who did not write essay and who did not stay on TOPIC
dataset.attn <- filter(dataset, Essay_Length!= "blank" & Essay_Content == 'IN LINE')
dataset.attn2 <- filter(dataset, Essay_Length!= "blank" & Atn_Check1 == 2)
dataset.attn3 <- filter(dataset, Essay_Length!= "blank")
dataset.attn4 <- filter (dataset, Essay_Length!= "blank" & English < 13)
dataset.attn5 <- filter (dataset, Essay_Length!= "blank" & Whatabout_Coded != 4)
