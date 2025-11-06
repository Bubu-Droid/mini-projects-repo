data <- read.csv("../../data/averaged_data.csv")

model <- lm(log(load_time_avg) ~ log(page_size_avg), data = data)

cat("Summary statistics for Page Size (KB):\n")
cat("Mean:", mean(data$page_size_avg), "\n")
cat("Median:", median(data$page_size_avg), "\n")
cat("Minimum:", min(data$page_size_avg), "\n")
cat("Maximum:", max(data$page_size_avg), "\n")
cat("Standard deviation:", sd(data$page_size_avg), "\n\n")

cat("Summary statistics for Load Time (s):\n")
cat("Mean:", mean(data$load_time_avg), "\n")
cat("Median:", median(data$load_time_avg), "\n")
cat("Minimum:", min(data$load_time_avg), "\n")
cat("Maximum:", max(data$load_time_avg), "\n")
cat("Standard deviation:", sd(data$load_time_avg), "\n\n")

cat("Summary statistics for log(Page Size):\n")
cat("Mean:", mean(log(data$page_size_avg)), "\n")
cat("Median:", median(log(data$page_size_avg)), "\n")
cat("Minimum:", min(log(data$page_size_avg)), "\n")
cat("Maximum:", max(log(data$page_size_avg)), "\n")
cat("Standard deviation:", sd(log(data$page_size_avg)), "\n\n")

cat("Summary statistics for log(Load Time):\n")
cat("Mean:", mean(log(data$load_time_avg)), "\n")
cat("Median:", median(log(data$load_time_avg)), "\n")
cat("Minimum:", min(log(data$load_time_avg)), "\n")
cat("Maximum:", max(log(data$load_time_avg)), "\n")
cat("Standard deviation:", sd(log(data$load_time_avg)), "\n\n")

cat("Confidence Interval for alpha and beta:\n\n")
ci_results <- confint(model)
ci_alpha_lower <- ci_results[1, 1]
ci_alpha_upper <- ci_results[1, 2]
ci_beta_lower <- ci_results[2, 1]
ci_beta_upper <- ci_results[2, 2]
cat("Intercept (alpha) CI:\n")
cat("  Lower Bound:", ci_alpha_lower, "\n")
cat("  Upper Bound:", ci_alpha_upper, "\n\n")
cat("Slope (beta) CI:\n")
cat("  Lower Bound:", ci_beta_lower, "\n")
cat("  Upper Bound:", ci_beta_upper, "\n")
cat("\n--- Full CI Table ---\n")
print(ci_results)
