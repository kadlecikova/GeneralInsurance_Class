# Objective
	To learn how to use GIT, Shiny, and anything else needed?
# Content
	1) git - what is git and why we use it (15 min)
	2) GitHub - set account, fork directory (15 min)
	3) my first commit/push - create notes for the class to lesson 1 folder (5 min)
	4) compare different forks + other exercises (10 min)
	5) Shiny intro - what is it and why is it + install stuff (15 min)
	6) hello world shiny app / something simple like glm command in r using sample data (30 min)


HOMEWORK 3 
library(dplyr)
library(ggplot2)
library(ChainLadder)

dt_PaidCase <- read.csv("data/lesson3_PaidCase.csv")

Paid_HH_sml <- dt_PaidCase %>% 
filter(Business == "House" & ClaimSize == "Small" & dataset_type == "PAID")  %>% 
as.triangle(origin="ay", dev="dy", value="SumOfamount")

Paid_HH_sml_Incremental<-cum2incr(Paid_HH_sml)
weights<-attr(ata(Paid_HH_sml_Incremental),"vwtd")
weights

average_duration<-sum(weights*c(1:9)/sum(weights))
average_duration
