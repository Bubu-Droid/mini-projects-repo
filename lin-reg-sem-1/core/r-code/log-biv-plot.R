data <- read.csv("../../data/averaged_data.csv")

plot(log(data$page_size_avg), log(data$load_time_avg),
  main = "log(Page Size) vs log(Load Time)",
  xlab = "log(Page Size)",
  ylab = "log(Load Time)",
  col = "darkred")

grid()
