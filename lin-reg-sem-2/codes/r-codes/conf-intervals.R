df <- read.csv("../../penguins_cleaned.csv")

df$log_Body_Mass <- log(df$Body_Mass)
df$log_Flipper_Length <- log(df$Flipper_Length)
df$log_Culmen_Length <- log(df$Culmen_Length)
df$log_Culmen_Depth <- log(df$Culmen_Depth)
df$Is_Gentoo <- as.numeric(grepl("Gentoo", df$Species))
df$Is_Chinstrap <- as.numeric(grepl("Chinstrap", df$Species))

model <- lm(log_Body_Mass ~ log_Flipper_Length + log_Culmen_Length + log_Culmen_Depth + Is_Gentoo + Is_Chinstrap, data = df)

cat("--- Confidence Intervals for Parameters ---\n")
print(confint(model, level = 0.95))

test_penguins <- data.frame(
  log_Flipper_Length = mean(df$log_Flipper_Length, na.rm = TRUE),
  log_Culmen_Length = mean(df$log_Culmen_Length, na.rm = TRUE),
  log_Culmen_Depth = mean(df$log_Culmen_Depth, na.rm = TRUE),
  Is_Gentoo = c(0, 0, 1),
  Is_Chinstrap = c(0, 1, 0)
)

cat("\n--- Confidence Intervals for Mean Response ---\n")
print(predict(model, test_penguins, interval = "confidence", level = 0.95))

cat("\n--- Prediction Intervals for New Observations ---\n")
print(predict(model, test_penguins, interval = "prediction", level = 0.95))
