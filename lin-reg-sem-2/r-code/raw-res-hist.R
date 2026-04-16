data <- read.csv("../penguins_cleaned.csv")

data$Is_Gentoo <- ifelse(data$Species == "Gentoo penguin (Pygoscelis papua)", 1, 0)
data$Is_Chinstrap <- ifelse(data$Species == "Chinstrap penguin (Pygoscelis antarctica)", 1, 0)

model_raw <- lm(Body_Mass ~ Flipper_Length
                + Culmen_Length
                + Culmen_Depth
                + Is_Gentoo
                + Is_Chinstrap, data=data)

res_raw <- resid(model_raw)

hist(res_raw,
     main = "Histogram of Residuals (Raw Model)",
     xlab = "Residuals (g)",
     ylab = "Frequency",
     col = "mediumpurple",
     breaks = 20)
