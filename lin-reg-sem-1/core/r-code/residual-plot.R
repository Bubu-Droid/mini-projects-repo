data <- read.csv("../../data/averaged_data.csv")

model <- lm(log(load_time_avg) ~ log(page_size_avg), data = data)

y_hat <- fitted(model)
residuals <- log(data$load_time_avg) - y_hat

hist(residuals,
     main = "Histogram of Residuals (Log-Log Model)",
     xlab = "Residuals",
     col = "lightblue",
     border = "white")

abline(v = 0, col = "red", lwd = 2)
