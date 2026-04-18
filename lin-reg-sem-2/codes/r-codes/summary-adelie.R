df <- read.csv("../../penguins_cleaned.csv")
data_adelie <- data[data$Species == "Adelie Penguin (Pygoscelis adeliae)", ]

# ======================================
#   SPECIES DATA (Adelie)
# ======================================

cat("Summary statistics for Body Mass (g):\n")
cat("Mean:", mean(data_adelie$Body_Mass), "\n")
cat("Minimum:", min(data_adelie$Body_Mass), "\n")
cat("Maximum:", max(data_adelie$Body_Mass), "\n")
cat("Standard deviation:", sd(data_adelie$Body_Mass), "\n\n")
cat("Aggregate data:",  mean(data_adelie$Body_Mass), "&", min(data_adelie$Body_Mass), "&", max(data_adelie$Body_Mass), "&", sd(data_adelie$Body_Mass), "\n\n")

cat("Summary statistics for Flipper Length (mm):\n")
cat("Mean:", mean(data_adelie$Flipper_Length), "\n")
cat("Minimum:", min(data_adelie$Flipper_Length), "\n")
cat("Maximum:", max(data_adelie$Flipper_Length), "\n")
cat("Standard deviation:", sd(data_adelie$Flipper_Length), "\n\n")
cat("Aggregate data:",  mean(data_adelie$Flipper_Length), "&", min(data_adelie$Flipper_Length), "&", max(data_adelie$Flipper_Length), "&", sd(data_adelie$Flipper_Length), "\n\n")

cat("Summary statistics for Culmen Length (mm):\n")
cat("Mean:", mean(data_adelie$Culmen_Length), "\n")
cat("Minimum:", min(data_adelie$Culmen_Length), "\n")
cat("Maximum:", max(data_adelie$Culmen_Length), "\n")
cat("Standard deviation:", sd(data_adelie$Culmen_Length), "\n\n")
cat("Aggregate data:",  mean(data_adelie$Culmen_Length), "&", min(data_adelie$Culmen_Length), "&", max(data_adelie$Culmen_Length), "&", sd(data_adelie$Culmen_Length), "\n\n")

cat("Summary statistics for Culmen Depth (mm):\n")
cat("Mean:", mean(data_adelie$Culmen_Depth), "\n")
cat("Minimum:", min(data_adelie$Culmen_Depth), "\n")
cat("Maximum:", max(data_adelie$Culmen_Depth), "\n")
cat("Standard deviation:", sd(data_adelie$Culmen_Depth), "\n\n")
cat("Aggregate data:",  mean(data_adelie$Culmen_Depth), "&", min(data_adelie$Culmen_Depth), "&", max(data_adelie$Culmen_Depth), "&", sd(data_adelie$Culmen_Depth), "\n\n")
