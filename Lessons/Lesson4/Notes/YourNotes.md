# Objective
	To learn how to use GIT, Shiny, and anything else needed?
# Content
	1) git - what is git and why we use it (15 min)
	2) GitHub - set account, fork directory (15 min)
	3) my first commit/push - create notes for the class to lesson 1 folder (5 min)
	4) compare different forks + other exercises (10 min)
	5) Shiny intro - what is it and why is it + install stuff (15 min)
	6) hello world shiny app / something simple like glm command in r using sample data (30 min)

HOMEWORK 4


library(dplyr)
dt_Policy <- read.csv("../../data/policy_history.csv") %>% distinct(NrPolicy, NrObject, .keep_all = TRUE) 

dt_Claims <- read.csv("../../data/claims.csv") %>% distinct(NrClaim, .keep_all = TRUE)

dt_pol_w_claims <- left_join(dt_Policy, 
                         dt_Claims,
                         by = c("NrPolicy", "NrObject")
                    )
head(dt_pol_w_claims)


library(lubridate)
dt_pol_w_claims <- 
  dt_pol_w_claims %>% mutate(Time_Exposure = lubridate::dmy(Dt_Exp_End) - lubridate::dmy(Dt_Exp_Start))

dt_pol_w_claims <- 
  dt_pol_w_claims %>% 
  mutate(Ult_Loss = Paid + Reserves,
         Burning_Cost = ifelse(is.na(Ult_Loss), 0,  Ult_Loss / as.integer(Time_Exposure))
  )

library(ggplot2)
dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = Veh_type1)) 
  geom_jitter()

levels(dt_pol_w_claims$Veh_type1)


dt_pol_w_claims %>% 
  group_by(Veh_type1) %>% 
  filter(Burning_Cost != 0) %>%
  summarise(BC_avg = mean(Burning_Cost, na.rm  = TRUE),
            BC_median = median(Burning_Cost, na.rm = TRUE),
            cnt = n()) %>% 
  arrange(desc(BC_avg))

dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = Veh_type1)) 
  geom_boxplot() +
  ylim(0, 100)

dt_pol_w_claims<-dt_pol_w_claims %>% filter(D_age<100)

library(ggplot2)
dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = D_age)) 
  geom_jitter()

dt_pol_w_claims %>% 
  group_by(D_age) %>% 
  filter(Burning_Cost != 0) %>%
  summarise(BC_avg = mean(Burning_Cost, na.rm  = TRUE),
            BC_median = median(Burning_Cost, na.rm = TRUE),
            cnt = n()) %>% 
  arrange(desc(BC_avg)) #arrange(desc(BC_median))

dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = D_age)) 
  geom_boxplot() 
  ylim(0, 100)

#GLM model
library(ggplot2)
ggplot(data = dt_pol_w_claims, aes(x = Burning_Cost)) 
geom_histogram()

library(ggplot2)
ggplot(data = dt_pol_w_claims %>% filter(Burning_Cost != 0, Burning_Cost < 100),aes(x = Burning_Cost)) 
geom_histogram()

model1 <- glm(data = dt_pol_w_claims %>% filter(Burning_Cost != 0, Burning_Cost < 100),
            formula = Burning_Cost ~ Veh_type1 + D_age,
            family = Gamma())

summary(model1)
