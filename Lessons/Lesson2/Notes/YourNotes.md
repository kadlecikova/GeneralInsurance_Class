# Objective
	To learn how to use GIT, Shiny, and anything else needed?
# Content
	1) git - what is git and why we use it (15 min)
	2) GitHub - set account, fork directory (15 min)
	3) my first commit/push - create notes for the class to lesson 1 folder (5 min)
	4) compare different forks + other exercises (10 min)
	5) Shiny intro - what is it and why is it + install stuff (15 min)
	6) hello world shiny app / something simple like glm command in r using sample data (30 min)
  HOMEWORK 
  dt_KPI_raw %>% 
  group_by(Unit) %>% 
  summarize(Premium = sum(Premium, na.rm = TRUE),
            Expenses = sum(Expenses, na.rm = TRUE),
            Losses = sum(Losses, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = reorder(Unit, -Premium), y = Premium)) + 
  geom_col()
