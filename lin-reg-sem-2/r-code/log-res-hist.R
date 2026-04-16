data <- read.csv("../penguins_cleaned.csv")

data$Is_Gentoo <- ifelse(data$Species == "Gentoo penguin (Pygoscelis papua)", 1, 0)
data$Is_Chinstrap <- ifelse(data$Species == "Chinstrap penguin (Pygoscelis antarctica)", 1, 0)

model_log <- lm(log(Body_Mass) ~ log(Flipper_Length)
                + log(Culmen_Length)
                + log(Culmen_Depth)
                + Is_Gentoo
                + Is_Chinstrap, data=data)

res_log <- resid(model_log)

hist(res_log,
     main = "Histogram of Residuals (Log Model)",
     xlab = "Residuals (g)",
     ylab = "Frequency",
     col = "mediumpurple",
     breaks = 20)
