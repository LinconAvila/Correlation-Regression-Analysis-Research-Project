#First determine working directory with function setwd()

# Load required libraries
library(e1071)
library(lmtest)

# Load data from the file "database.txt"
data <- read.table("database/database.txt", header = TRUE, sep = "\t", dec = ",")
str(data)

# Load data
dados <- read.table("db.txt", header = TRUE, sep = "\t", dec = ",")
idh <- dados$IDH
life_expectancy <- dados$Expectativa.de.Vida

# Compute correlation coefficient and significance test
cor_test <- cor.test(idh, life_expectancy)
cor_test

# Fit a linear regression model
model <- lm(life_expectancy ~ idh)
model

# Scatter plot: IDH vs Life Expectancy
plot(idh, life_expectancy,
     main = "Scatterplot: IDH vs Life Expectancy",
     xlab = "IDH",
     ylab = "Life Expectancy",
     pch = 1)  # 'pch' defines the point style
abline(lm(dados$Expectativa.de.Vida ~ dados$IDH), col = "black", lwd = 2)

# Model summary
model_summary <- summary(model)
model_summary

# Analysis of Variance (ANOVA)
anova <- anova(model)

# Residuals
residuals <- residuals(model)
plot(residuals)
residuals

# Residual statistics
minimum <- min(residuals)
q1 <- quantile(residuals, 0.25)
median_value <- median(residuals)
q3 <- quantile(residuals, 0.75)
maximum <- max(residuals)
iqr <- IQR(residuals)
mean_value <- mean(residuals)
std_dev <- sd(residuals)
pearson_skewness <- skewness(residuals, type = 1)
yule_skewness <- skewness(residuals, type = 2)
kelley_skewness <- skewness(residuals, type = 3)
kurtosis_value <- kurtosis(residuals)
z_scores <- (residuals - mean_value) / std_dev
mean_z_scores <- mean(z_scores)

# Create a residuals summary table
residuals_table <- data.frame(
  Measure = c("Minimum", "Q1 (1st Quartile)", "Median", "Q3 (3rd Quartile)", "Maximum",
              "Interquartile Range", "Mean", "Standard Deviation", "Pearson Skewness",
              "Yule Skewness", "Kelley Skewness", "Kurtosis", "Mean Z-Scores"),
  Value = c(minimum, q1, median_value, q3, maximum,
            iqr, mean_value, std_dev,
            pearson_skewness, yule_skewness,
            kelley_skewness, kurtosis_value, mean_z_scores)
)

# Display the table
View(residuals_table)

# Ljung-Box test
ljung_box_test <- Box.test(residuals, lag = 2, type = "Ljung-Box")
ljung_box_test

# Shapiro-Wilk test
shapiro_wilk_test <- shapiro.test(residuals)
shapiro_wilk_test

# Breusch-Pagan test
breusch_pagan_test <- bptest(model)
breusch_pagan_test
