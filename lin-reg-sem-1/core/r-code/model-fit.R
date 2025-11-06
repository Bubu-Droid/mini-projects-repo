data <- read.csv("../../data/averaged_data.csv")

model <- lm(log(load_time_avg) ~ log(page_size_avg), data = data)

summary(model)

alpha_hat <- coef(model)[1]
beta_hat  <- coef(model)[2]
r_squared <- summary(model)$r.squared

cat("Value of alpha_hat:", alpha_hat, "\n")
cat("Value of beta_hat:", beta_hat, "\n")
cat("Value of R^2:", r_squared, "\n")

plot(log(data$page_size_avg), log(data$load_time_avg),
     main = "Log-Log Regression: Page Size vs Load Time",
     xlab = "log(Page Size)",
     ylab = "log(Load Time)",
     col = "darkred")

abline(model, col = "darkgreen", lwd = 2)

grid()
