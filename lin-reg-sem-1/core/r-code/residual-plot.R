data <- read.csv("../../data/averaged_data.csv")

model <- lm(log(load_time_avg) ~ log(page_size_avg), data = data)

y_hat <- fitted(model)
residuals <- log(data$load_time_avg) - y_hat
serial_no <- 1:length(residuals)

plot(serial_no, residuals,
     main = "Residuals vs Observation Index (Log-Log Model)",
     xlab = "Observation Index",
     ylab = "Residuals",
     col = "blue")

abline(h = 0, col = "red", lwd = 2)
