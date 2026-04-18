df <- read.csv("../../penguins_cleaned.csv")

df$Is_Gentoo <- as.numeric(grepl("Gentoo", df$Species))
df$Is_Chinstrap <- as.numeric(grepl("Chinstrap", df$Species))

model_full <- lm(log(Body_Mass) ~ log(Flipper_Length) + log(Culmen_Length) + log(Culmen_Depth) + Is_Gentoo + Is_Chinstrap, data = df)

model_intercept_only <- lm(log(Body_Mass) ~ 1, data = df)

model_reduced <- lm(log(Body_Mass) ~ log(Flipper_Length) + log(Culmen_Length) + log(Culmen_Depth), data = df)

anova(model_intercept_only, model_full)

summary(model_full)

anova(model_reduced, model_full)
