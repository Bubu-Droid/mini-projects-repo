df <- read.csv("../../penguins_cleaned.csv")
data_gentoo <- data[data$Species == "Gentoo penguin (Pygoscelis papua)", ]

# ======================================
#   SPECIES DATA (Gentoo)
# ======================================

cat("Summary statistics for Body Mass (g):\n")
cat("Mean:", mean(data_gentoo$Body_Mass), "\n")
cat("Minimum:", min(data_gentoo$Body_Mass), "\n")
cat("Maximum:", max(data_gentoo$Body_Mass), "\n")
cat("Standard deviation:", sd(data_gentoo$Body_Mass), "\n\n")
cat("Aggregate data:",  mean(data_gentoo$Body_Mass), "&", min(data_gentoo$Body_Mass), "&", max(data_gentoo$Body_Mass), "&", sd(data_gentoo$Body_Mass), "\n\n")

cat("Summary statistics for Flipper Length (mm):\n")
cat("Mean:", mean(data_gentoo$Flipper_Length), "\n")
cat("Minimum:", min(data_gentoo$Flipper_Length), "\n")
cat("Maximum:", max(data_gentoo$Flipper_Length), "\n")
cat("Standard deviation:", sd(data_gentoo$Flipper_Length), "\n\n")
cat("Aggregate data:",  mean(data_gentoo$Flipper_Length), "&", min(data_gentoo$Flipper_Length), "&", max(data_gentoo$Flipper_Length), "&", sd(data_gentoo$Flipper_Length), "\n\n")

cat("Summary statistics for Culmen Length (mm):\n")
cat("Mean:", mean(data_gentoo$Culmen_Length), "\n")
cat("Minimum:", min(data_gentoo$Culmen_Length), "\n")
cat("Maximum:", max(data_gentoo$Culmen_Length), "\n")
cat("Standard deviation:", sd(data_gentoo$Culmen_Length), "\n\n")
cat("Aggregate data:",  mean(data_gentoo$Culmen_Length), "&", min(data_gentoo$Culmen_Length), "&", max(data_gentoo$Culmen_Length), "&", sd(data_gentoo$Culmen_Length), "\n\n")

cat("Summary statistics for Culmen Depth (mm):\n")
cat("Mean:", mean(data_gentoo$Culmen_Depth), "\n")
cat("Minimum:", min(data_gentoo$Culmen_Depth), "\n")
cat("Maximum:", max(data_gentoo$Culmen_Depth), "\n")
cat("Standard deviation:", sd(data_gentoo$Culmen_Depth), "\n\n")
cat("Aggregate data:",  mean(data_gentoo$Culmen_Depth), "&", min(data_gentoo$Culmen_Depth), "&", max(data_gentoo$Culmen_Depth), "&", sd(data_gentoo$Culmen_Depth), "\n\n")
