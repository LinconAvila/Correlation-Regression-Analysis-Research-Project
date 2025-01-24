# Correlation and Regression Analysis Research Project

This repository contains the code and documentation for a research project analyzing the correlation and regression between the Human Development Index (HDI) and Life Expectancy. The analysis is performed using R and employs statistical techniques such as descriptive analysis, hypothesis testing, and regression modeling.

## Project Overview

This project is divided into two main stages:

1. **Exploratory Data Analysis (EDA)**:
   - Analysis of HDI and Life Expectancy for the 50 highest-ranked countries globally.
   - Univariate analysis: Includes measures like mean, median, standard deviation, and skewness for individual variables.
   - Bivariate analysis: Examines relationships between HDI and Life Expectancy using scatterplots and correlation coefficients.

2. **Regression Analysis**:
   - Construction and evaluation of a linear regression model to describe the relationship between HDI (independent variable) and Life Expectancy (dependent variable).
   - Assessment of model assumptions, including residual independence, normality, and homoscedasticity.
   - Statistical tests to evaluate the significance of regression coefficients and overall model fit.

## Repository Contents

### Code
- **`script.r`**: Contains code for data preprocessing, exploratory data analysis, and visualization.
- **`script2.r`**: Implements linear regression modeling, statistical testing (ANOVA, Shapiro-Wilk, Ljung-Box), and model diagnostics.

### Database
- **`database.txt`**: Includes HDI and Life Expectancy data for the top 50 countries globally, sourced from:
  - **Human Development Index (HDI)**: Extracted from the UNDP Human Development Report 2022, which evaluates development based on health, education, and living standards.
  - **Life Expectancy**: Collected from the CIA World Factbook 2022, representing the average years a person is expected to live at birth.


## Key Findings

1. **Correlation Analysis**:
   - Pearson's correlation coefficient (r = 0.668) indicates a moderate positive relationship between HDI and Life Expectancy.
   - Hypothesis testing confirmed the statistical significance of this relationship (p-value < 0.05).

2. **Regression Model**:
   - Linear regression equation: \( \text{Life Expectancy} = 38.315 + 46.950 \cdot \text{HDI} \).
   - \( R^2 = 0.4465 \): About 44.65% of the variation in Life Expectancy is explained by HDI.
   - Residual analysis showed no significant violations of model assumptions.

3. **Model Limitations**:
   - The model explains only 44.65% of the variance, suggesting other factors influence Life Expectancy.
   - Future analyses could incorporate additional socioeconomic and environmental variables.

## Requirements

- **R version**: >= 4.0.0
- **R libraries**: ggplot2, dplyr, car, lmtest

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/LinconAvila/Correlation-Regression-Analysis-Research-Project.git
   cd Correlation-Regression-Analysis-Research-Project
   ```

2. Open the scripts (`script.r` and `script2.r`) in RStudio.

3. Run the scripts sequentially to reproduce the analyses and generate the visualizations.

## References

- CIA World Factbook (2022): Life Expectancy data. [https://www.cia.gov/the-world-factbook/about/archives/2022/field/life-expectancy-at-birth/country-comparison](https://www.cia.gov/the-world-factbook/about/archives/2022/field/life-expectancy-at-birth/country-comparison)
- UNDP (2022): Human Development Index. [https://hdr.undp.org/system/files/documents/global-report-document/hdr2021-22overviewen.pdf](https://hdr.undp.org/system/files/documents/global-report-document/hdr2021-22overviewen.pdf)
- R Documentation: [https://www.rdocumentation.org/](https://www.rdocumentation.org/)

## Author

Lincon Avila de Souza  
Fundação Universidade Federal do Rio Grande (FURG)  
2024-2025
