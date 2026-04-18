data <- read.csv("../penguins_cleaned.csv")
data_chinstrap <- data[data$Species == "Chinstrap penguin (Pygoscelis antarctica)", ]

# ======================================
#   SPECIES DATA (Chinstrap)
# ======================================

cat("Summary statistics for Body Mass (g):\n")
cat("Mean:", mean(data_chinstrap$Body_Mass), "\n")
cat("Minimum:", min(data_chinstrap$Body_Mass), "\n")
cat("Maximum:", max(data_chinstrap$Body_Mass), "\n")
cat("Standard deviation:", sd(data_chinstrap$Body_Mass), "\n\n")
cat("Aggregate data:",  mean(data_chinstrap$Body_Mass), "&", min(data_chinstrap$Body_Mass), "&", max(data_chinstrap$Body_Mass), "&", sd(data_chinstrap$Body_Mass), "\n\n")

cat("Summary statistics for Flipper Length (mm):\n")
cat("Mean:", mean(data_chinstrap$Flipper_Length), "\n")
cat("Minimum:", min(data_chinstrap$Flipper_Length), "\n")
cat("Maximum:", max(data_chinstrap$Flipper_Length), "\n")
cat("Standard deviation:", sd(data_chinstrap$Flipper_Length), "\n\n")
cat("Aggregate data:",  mean(data_chinstrap$Flipper_Length), "&", min(data_chinstrap$Flipper_Length), "&", max(data_chinstrap$Flipper_Length), "&", sd(data_chinstrap$Flipper_Length), "\n\n")

cat("Summary statistics for Culmen Length (mm):\n")
cat("Mean:", mean(data_chinstrap$Culmen_Length), "\n")
cat("Minimum:", min(data_chinstrap$Culmen_Length), "\n")
cat("Maximum:", max(data_chinstrap$Culmen_Length), "\n")
cat("Standard deviation:", sd(data_chinstrap$Culmen_Length), "\n\n")
cat("Aggregate data:",  mean(data_chinstrap$Culmen_Length), "&", min(data_chinstrap$Culmen_Length), "&", max(data_chinstrap$Culmen_Length), "&", sd(data_chinstrap$Culmen_Length), "\n\n")

cat("Summary statistics for Culmen Depth (mm):\n")
cat("Mean:", mean(data_chinstrap$Culmen_Depth), "\n")
cat("Minimum:", min(data_chinstrap$Culmen_Depth), "\n")
cat("Maximum:", max(data_chinstrap$Culmen_Depth), "\n")
cat("Standard deviation:", sd(data_chinstrap$Culmen_Depth), "\n\n")
cat("Aggregate data:",  mean(data_chinstrap$Culmen_Depth), "&", min(data_chinstrap$Culmen_Depth), "&", max(data_chinstrap$Culmen_Depth), "&", sd(data_chinstrap$Culmen_Depth), "\n\n")
