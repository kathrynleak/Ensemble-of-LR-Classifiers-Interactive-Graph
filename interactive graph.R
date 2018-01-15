library(dplyr)
library(ggvis)

# Import Data
data = read.table("Ensemble Test Results.txt", header = TRUE)

# Remove outliers
data <- filter(data, Test.Error.AP<70)

data %>% ggvis(input_select(c('Learning.Rate', 'Number.Epochs', 'Number.Classifiers', 'Train.Error.MV',
                              'Train.Error.AP', 'Test.Error.MV', 'Test.Error.AP'), map=as.name, 
                            label="X-Axis Choice"),~Trial.Time.Seconds) %>% 
  add_axis("x", title = "X-Axis Choice", title_offset = 50) %>%
  add_axis("y", title = "Time Taken for Trial to Complete (Seconds)", title_offset = 50)
