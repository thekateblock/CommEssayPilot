
#'use dataset.attn for those who have have done the essay and stayen on topic
#' use dataset.attn2 for those who have done essay and passed attention check

summary (dataset.attn)

#correlations between main outcomes
library(Hmisc)

rcorr(cbind(dataset.attn$comm_imp, dataset.attn$comm_Sat, dataset.attn$comm_Ben, dataset.attn$agen_imp, dataset.attn$agen_Sat, dataset.attn$agen_Ben))

#' ANOVA's for Mean differences in communal importance
comm_impAN <- aov(comm_imp ~ Condition_TXT, data=dataset.attn)
summary (comm_impAN)
TukeyHSD(comm_impAN)

library(gplots)
Condition_TXT <- factor(dataset.attn$Condition_TXT)
plotmeans(dataset.attn$comm_imp~Condition_TXT,xlab="Condition",
          ylab= "Importance of Communal Goals", main="Importance of communal Values\n BY condition")

dataset.attn %>% group_by(Condition_TXT) %>%
  summarise(avg_comm_imp = (mean(comm_imp, na.rm = TRUE)), SD_comm_imp = (sd(comm_imp, na.rm = TRUE)))

# ANOVA's for Mean differences in agentic importance
agen_impAN <- aov(agen_imp ~ Condition_TXT, data=dataset.attn)
summary (agen_impAN)
TukeyHSD(agen_impAN)

# ANOVA's for Mean differences in communal satisfaction
comm_satAN <- aov(comm_sat ~ Condition_TXT, data=dataset.attn)
summary (comm_satAN)
TukeyHSD(comm_satAN)

library(gplots)
Condition_TXT <- factor(dataset.attn$Condition_TXT)
plotmeans(dataset.attn$comm_sat~Condition_TXT,xlab="Condition",
          ylab= "Satisfaction of Communal Goals", main="Satisfaction of communal Goals\n BY condition")

# ANOVA's for Mean differences in agentic statisfaction
# ANOVA's for Mean differences in communal satisfaction
agen_satAN <- aov(agen_Sat ~ Condition_TXT, data=dataset.attn)
summary (agen_satAN)
TukeyHSD(agen_satAN)

# ANOVA's for Mean differences in communal benefit
comm_benAN <- aov(comm_Ben ~ Condition_TXT, data=dataset.attn)
summary (comm_benAN)
TukeyHSD(comm_benAN)

library(gplots)
Condition_TXT <- factor(dataset.attn$Condition_TXT)
plotmeans(dataset.attn$comm_Ben~Condition_TXT,xlab="Condition",
          ylab= "Benefit of Communal Goals", main="Benefit of communal Goals\n BY condition")

# ANOVA's for Mean differences in agentic benefit

agen_benAN <- aov(agen_Ben ~ Condition_TXT, data=dataset.attn)
summary (agen_benAN )
TukeyHSD(agen_benAN )

# ANOVA's for Mean differences in task ratings.
diffAN <- aov(Difficulty_Write ~ Condition_TXT, data=dataset.attn)
summary (diffAN)
TukeyHSD(diffAN)

wellAN <- aov(Well_Written ~ Condition_TXT, data=dataset.attn)
summary (wellAN)
TukeyHSD(wellAN)

engageAN <- aov(dataset.attn$Engaging ~ Condition_TXT, data=dataset.attn)
summary (engageAN)
TukeyHSD(engageAN)

plotmeans(dataset.attn$Engaging~Condition_TXT,xlab="Condition",
          ylab= "engaging", main="Engagement \n BY condition")

understandAN <- aov(dataset.attn$Understand ~ Condition_TXT, data=dataset.attn)
summary (understandAN)
TukeyHSD(understandAN)

surprisedAN <- aov(dataset.attn$Surprised ~ Condition_TXT, data=dataset.attn)
summary (surprisedAN)
TukeyHSD(surprisedAN)

plotmeans(dataset.attn$Surprised~Condition_TXT,xlab="Condition",
          ylab= "Surprise", main="Surprised by article \n BY condition")


dataset.attn %>% group_by(Condition_TXT) %>%
  summarise_each(funs(mean(., na.rm = TRUE), sd(., na.rm=TRUE), n()), comm_imp,comm_Sat, comm_Ben)

dataset.attn4 %>% group_by(Condition_TXT) %>%
  summarise_each(funs(mean(., na.rm = TRUE), sd(., na.rm=TRUE), n()), comm_imp,comm_Sat, comm_Ben)



######## Do same test with the larger sample that also included those who wrote counter the condition
###########################################

#' ANOVA's for Mean differences in communal importance
comm_impAN <- aov(comm_imp ~ Condition_TXT, data=dataset.attn3)
summary (comm_impAN)
TukeyHSD(comm_impAN)

library(gplots)
Condition_TXT <- factor(dataset.attn$Condition_TXT)
plotmeans(dataset.attn$comm_imp~Condition_TXT,xlab="Condition",
          ylab= "Importance of Communal Goals", main="Importance of communal Values\n BY condition")

# ANOVA's for Mean differences in agentic importance
agen_impAN <- aov(agen_imp ~ Condition_TXT, data=dataset.attn3)
summary (agen_impAN)
TukeyHSD(agen_impAN)

# ANOVA's for Mean differences in communal satisfaction
comm_satAN <- aov(comm_sat ~ Condition_TXT, data=dataset.attn3)
summary (comm_satAN)
TukeyHSD(comm_satAN)


Condition_TXT <- factor(dataset.attn3$Condition_TXT)
plotmeans(dataset.attn3$comm_sat~Condition_TXT,xlab="Condition",
          ylab= "Satisfaction of Communal Goals", main="Satisfaction of communal Goals\n BY condition")

# ANOVA's for Mean differences in agentic statisfaction
agen_satAN <- aov(agen_Sat ~ Condition_TXT, data=dataset.attn3)
summary (agen_satAN)
TukeyHSD(agen_satAN)

# ANOVA's for Mean differences in communal benefit
comm_benAN <- aov(comm_Ben ~ Condition_TXT, data=dataset.attn3)
summary (comm_benAN)
TukeyHSD(comm_benAN)

library(gplots)
Condition_TXT <- factor(dataset.attn$Condition_TXT)
plotmeans(dataset.attn$comm_Ben~Condition_TXT,xlab="Condition",
          ylab= "Benefit of Communal Goals", main="Benefit of communal Goals\n BY condition")

# ANOVA's for Mean differences in agentic benefit

agen_benAN <- aov(agen_Ben ~ Condition_TXT, data=dataset.attn3)
summary (agen_benAN )
TukeyHSD(agen_benAN )

# ANOVA's for Mean differences in task ratings.
diffAN <- aov(Difficulty_Write ~ Condition_TXT, data=dataset.attn3)
summary (diffAN)
TukeyHSD(diffAN)

plotmeans(dataset.attn3$Difficulty_Write~Condition_TXT,xlab="Condition",
          ylab= "difficult", main="Difficulty writing \n BY condition")

wellAN <- aov(Well_Written ~ Condition_TXT, data=dataset.attn3)
summary (wellAN)
TukeyHSD(wellAN)

engageAN <- aov(dataset.attn$Engaging ~ Condition_TXT, data=dataset.attn3)
summary (engageAN)
TukeyHSD(engageAN)

plotmeans(dataset.attn$Engaging~Condition_TXT,xlab="Condition",
          ylab= "engaging", main="Engagement \n BY condition")

understandAN <- aov(dataset.attn$Understand ~ Condition_TXT, data=dataset.attn3)
summary (understandAN)
TukeyHSD(understandAN)

surprisedAN <- aov(dataset.attn$Surprised ~ Condition_TXT, data=dataset.attn3)
summary (surprisedAN)
TukeyHSD(surprisedAN)

plotmeans(dataset.attn3$Surprised~Condition_TXT,xlab="Condition",
          ylab= "Surprise", main="Surprised by article \n BY condition")

#### excluding those people who guessed the hypothesis
####################################################################

#' ANOVA's for Mean differences in communal importance
comm_impAN <- aov(comm_imp ~ Condition_TXT, data=dataset.attn5)
summary (comm_impAN)
TukeyHSD(comm_impAN)

library(gplots)
Condition_TXT <- factor(dataset.attn5$Condition_TXT)
plotmeans(dataset.attn5$comm_imp~Condition_TXT,xlab="Condition",
          ylab= "Importance of Communal Goals", main="Importance of communal Values\n BY condition")

# ANOVA's for Mean differences in agentic importance
agen_impAN <- aov(agen_imp ~ Condition_TXT, data=dataset.attn5)
summary (agen_impAN)
TukeyHSD(agen_impAN)

# ANOVA's for Mean differences in communal satisfaction
comm_satAN <- aov(comm_sat ~ Condition_TXT, data=dataset.attn5)
summary (comm_satAN)
TukeyHSD(comm_satAN)


Condition_TXT <- factor(dataset.attn5$Condition_TXT)
plotmeans(dataset.attn5$comm_Sat~Condition_TXT,xlab="Condition",
          ylab= "Satisfaction of Communal Goals", main="Satisfaction of communal Goals\n BY condition")

# ANOVA's for Mean differences in agentic statisfaction
agen_satAN <- aov(agen_Sat ~ Condition_TXT, data=dataset.attn5)
summary (agen_satAN)
TukeyHSD(agen_satAN)

# ANOVA's for Mean differences in communal benefit
comm_benAN <- aov(comm_Ben ~ Condition_TXT, data=dataset.attn5)
summary (comm_benAN)
TukeyHSD(comm_benAN)

library(gplots)
Condition_TXT <- factor(dataset.attn5$Condition_TXT)
plotmeans(dataset.attn5$comm_Ben~Condition_TXT,xlab="Condition",
          ylab= "Benefit of Communal Goals", main="Benefit of communal Goals\n BY condition")

# ANOVA's for Mean differences in agentic benefit

agen_benAN <- aov(agen_Ben ~ Condition_TXT, data=dataset.attn5)
summary (agen_benAN )
TukeyHSD(agen_benAN )

# ANOVA's for Mean differences in task ratings.
diffAN <- aov(Difficulty_Write ~ Condition_TXT, data=dataset.attn5)
summary (diffAN)
TukeyHSD(diffAN)

plotmeans(dataset.attn5$Difficulty_Write~Condition_TXT,xlab="Condition",
          ylab= "difficult", main="Difficulty writing \n BY condition")

wellAN <- aov(Well_Written ~ Condition_TXT, data=dataset.attn5)
summary (wellAN)
TukeyHSD(wellAN)

engageAN <- aov(dataset.attn5$Engaging ~ Condition_TXT, data=dataset.attn5)
summary (engageAN)
TukeyHSD(engageAN)

plotmeans(dataset.attn5$Engaging~Condition_TXT,xlab="Condition",
          ylab= "engaging", main="Engagement \n BY condition")

understandAN <- aov(dataset.attn5$Understand ~ Condition_TXT, data=dataset.attn5)
summary (understandAN)
TukeyHSD(understandAN)

surprisedAN <- aov(dataset.attn5$Surprised ~ Condition_TXT, data=dataset.attn5)
summary (surprisedAN)
TukeyHSD(surprisedAN)

plotmeans(dataset.attn5$Surprised~Condition_TXT,xlab="Condition",
          ylab= "Surprise", main="Surprised by article \n BY condition")

