data <- read.csv("../../data/averaged_data.csv")

model_default <- lm(load_time_avg ~ page_size_avg, data = data)

summary(model_default)
