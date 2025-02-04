#First determine working directory with function setwd()

# Load data from the file "database.txt"
data <- read.table("database/database.txt", header = TRUE, sep = "\t", dec = ",")
str(data)

# Define functions to calculate skewness and kurtosis measures

# Pearson's Skewness
calculate_pearson_skewness <- function(x) {
  mean_value <- mean(x)
  median_value <- median(x)
  std_dev <- sd(x)
  pearson <- 3 * (mean_value - median_value) / std_dev
  names(pearson) <- "pearson"
  pearson
}

# Yule's Skewness
calculate_yule_skewness <- function(x) {
  q1 <- quantile(x, 0.25, type = 5)
  q2 <- quantile(x, 0.5, type = 5)
  q3 <- quantile(x, 0.75, type = 5)
  yule <- (q3 + q1 - 2 * q2) / (q3 - q1)
  names(yule) <- "yule"
  yule
}

# Kelley's Skewness
calculate_kelley_skewness <- function(x) {
  q1 <- quantile(x, 0.1, type = 5)
  q2 <- quantile(x, 0.5, type = 5)
  q3 <- quantile(x, 0.9, type = 5)
  kelley <- (q3 + q1 - 2 * q2) / (q3 - q1)
  names(kelley) <- "kelley"
  kelley
}

# Kurtosis
calculate_kurtosis <- function(x) {
  q10 <- quantile(x, 0.1, type = 5)
  q25 <- quantile(x, 0.25, type = 5)
  q75 <- quantile(x, 0.75, type = 5)
  q90 <- quantile(x, 0.9, type = 5)
  kurtosis <- (q75 - q25) / (2 * (q90 - q10))
  names(kurtosis) <- "curt"
  kurtosis
}

# Calculate descriptive statistics for HDI and Life Espectancy
min_hdi <- min(data$HDI)
min_life_expectancy <- min(data$Life.Expectancy)

q1_hdi <- quantile(data$HDI, probs = 0.25)
q1_life_expectancy <- quantile(data$Life.Expectancy, probs = 0.25)

median_hdi <- median(data$HDI)
median_life_expectancy <- median(data$Life.Expectancy)

q3_hdi <- quantile(data$HDI, probs = 0.75)
q3_life_expectancy <- quantile(data$Life.Expectancy, probs = 0.75)

max_hdi <- max(data$HDI)
max_life_expectancy <- max(data$Life.Expectancy)

iqr_hdi <- q3_hdi - q1_hdi
iqr_life_expectancy <- q3_life_expectancy - q1_life_expectancy

mean_hdi <- mean(data$HDI)
mean_life_expectancy <- mean(data$Life.Expectancy)

std_dev_hdi <- sd(data$HDI)
std_dev_life_expectancy <- sd(data$Life.Expectancy)

# Calculate skewness and kurtosis measures
pearson_skewness_hdi <- calculate_pearson_skewness(data$HDI)
pearson_skewness_life_expectancy <- calculate_pearson_skewness(data$Life.Expectancy)

yule_skewness_hdi <- calculate_yule_skewness(data$HDI)
yule_skewness_life_expectancy <- calculate_yule_skewness(data$Life.Expectancy)

kelley_skewness_hdi <- calculate_kelley_skewness(data$HDI)
kelley_skewness_life_expectancy <- calculate_kelley_skewness(data$Life.Expectancy)

kurtosis_hdi <- calculate_kurtosis(data$HDI)
kurtosis_life_expectancy <- calculate_kurtosis(data$Life.Expectancy)

# Calculate Z-scores
z_scores_hdi <- (data$HDI - mean_hdi) / std_dev_hdi
z_scores_life_expectancy <- (data$Life.Expectancy - mean_life_expectancy) / std_dev_life_expectancy

# Generate histograms
hist(data$HDI, breaks = 8, main = "Histogram of HDI", xlab = "HDI", ylab = "Frequency", col = "lightblue", border = "black")
hist(data$Life.Expectancy, breaks = 7, main = "Histogram of Life Expectancy", xlab = "Life Expectancy", ylab = "Frequency", col = "lightgreen", border = "black")

# Generate boxplots
boxplot(data$HDI, main = "Boxplot of HDI", ylab = "HDI", col = "lightblue")
boxplot(data$Life.Expectancy, main = "Boxplot of Life Expectancy", ylab = "Life Expectancy", col = "lightgreen")

# Generate scatterplot with a trend line
plot(data$HDI, data$Life.Expectancy,
     main = "Scatterplot: HDI vs Life Expectancy",
     xlab = "HDI",
     ylab = "Life Expectancy",
     col = "blue",
     pch = 19)
abline(lm(data$Life.Expectancy ~ data$HDI), col = "red", lwd = 2)
legend("topright", legend = "Trend Line", col = "red", lty = 1, cex = 0.8)

# Calculate mean of absolute Z-scores
mean_abs_z_scores_hdi <- mean(abs(z_scores_hdi))
mean_abs_z_scores_life_expectancy <- mean(abs(z_scores_life_expectancy))

# Create a summary table with all measures
summary_table <- data.frame(
  Measure = c("Minimum", "1st Quartile (Q1)", "Median", "3rd Quartile (Q3)", "Maximum", 
              "Interquartile Range", "Mean", "Standard Deviation", 
              "Pearson Skewness", "Yule Skewness", "Kelley Skewness", 
              "Kurtosis", "Mean Absolute Z-Scores (|Z|)"),
  HDI = c(min_hdi, q1_hdi, median_hdi, q3_hdi, max_hdi, iqr_hdi, mean_hdi, std_dev_hdi,
          pearson_skewness_hdi, yule_skewness_hdi, kelley_skewness_hdi, kurtosis_hdi, mean_abs_z_scores_hdi),
  Life_Expectancy = c(min_life_expectancy, q1_life_expectancy, median_life_expectancy, 
                          q3_life_expectancy, max_life_expectancy, iqr_life_expectancy, 
                          mean_life_expectancy, std_dev_life_expectancy, pearson_skewness_life_expectancy, 
                          yule_skewness_life_expectancy, kelley_skewness_life_expectancy, 
                          kurtosis_life_expectancy, mean_abs_z_scores_life_expectancy)
)
