data <- read.csv("../../data/averaged_data.csv")

plot(data$page_size_avg, data$load_time_avg,
  main = "Page Size vs Load Time",
  xlab = "Average Page Size (KB)",
  ylab = "Average Load Time (s)",
  col = "blue")

grid()
