data <- read.csv("../penguins_cleaned.csv")

data$Is_Gentoo <- ifelse(data$Species == "Gentoo penguin (Pygoscelis papua)", 1, 0)
data$Is_Chinstrap <- ifelse(data$Species == "Chinstrap penguin (Pygoscelis antarctica)", 1, 0)

model_raw <- lm(Body_Mass ~ Flipper_Length
                + Culmen_Length
                + Culmen_Depth
                + Is_Gentoo
                + Is_Chinstrap, data=data)

model_log <- lm(log(Body_Mass) ~ log(Flipper_Length)
                + log(Culmen_Length)
                + log(Culmen_Depth)
                + Is_Gentoo
                + Is_Chinstrap, data=data)

# cat("Summary of Raw Model:\n")
# print(summary(model_raw))

cat("Summary of Log Model:\n")
print(summary(model_log))
