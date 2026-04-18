df <- read.csv("../../penguins_cleaned.csv")
data_adelie <- data[data$Species == "Adelie Penguin (Pygoscelis adeliae)", ]
data_gentoo <- data[data$Species == "Gentoo penguin (Pygoscelis papua)", ]
data_chinstrap <- data[data$Species == "Chinstrap penguin (Pygoscelis antarctica)", ]

# ======================================
#   AGGREGATE DATA
# ======================================

cat("Summary statistics for Body Mass (g):\n")
cat("Mean:", mean(data$Body_Mass), "\n")
cat("Minimum:", min(data$Body_Mass), "\n")
cat("Maximum:", max(data$Body_Mass), "\n")
cat("Standard deviation:", sd(data$Body_Mass), "\n\n")
cat("Aggregate data:",  mean(data$Body_Mass), "&", min(data$Body_Mass), "&", max(data$Body_Mass), "&", sd(data$Body_Mass), "\n\n")

cat("Summary statistics for Flipper Length (mm):\n")
cat("Mean:", mean(data$Flipper_Length), "\n")
cat("Minimum:", min(data$Flipper_Length), "\n")
cat("Maximum:", max(data$Flipper_Length), "\n")
cat("Standard deviation:", sd(data$Flipper_Length), "\n\n")
cat("Aggregate data:",  mean(data$Flipper_Length), "&", min(data$Flipper_Length), "&", max(data$Flipper_Length), "&", sd(data$Flipper_Length), "\n\n")

cat("Summary statistics for Culmen Length (mm):\n")
cat("Mean:", mean(data$Culmen_Length), "\n")
cat("Minimum:", min(data$Culmen_Length), "\n")
cat("Maximum:", max(data$Culmen_Length), "\n")
cat("Standard deviation:", sd(data$Culmen_Length), "\n\n")
cat("Aggregate data:",  mean(data$Culmen_Length), "&", min(data$Culmen_Length), "&", max(data$Culmen_Length), "&", sd(data$Culmen_Length), "\n\n")

cat("Summary statistics for Culmen Depth (mm):\n")
cat("Mean:", mean(data$Culmen_Depth), "\n")
cat("Minimum:", min(data$Culmen_Depth), "\n")
cat("Maximum:", max(data$Culmen_Depth), "\n")
cat("Standard deviation:", sd(data$Culmen_Depth), "\n\n")
cat("Aggregate data:",  mean(data$Culmen_Depth), "&", min(data$Culmen_Depth), "&", max(data$Culmen_Depth), "&", sd(data$Culmen_Depth), "\n\n")

cat("Number of Adelie Penguins:", nrow(data_adelie), "\n\n")
cat("Number of Gentoo Penguins:", nrow(data_gentoo), "\n\n")
cat("Number of Chinstrap Penguins:", nrow(data_chinstrap), "\n\n")
