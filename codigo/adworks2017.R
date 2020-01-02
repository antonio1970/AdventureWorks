
library(funModeling)
library(tidyverse)
library(corrplot)
library(ggplot2)
library(GGally)


customers <- read.csv("../Escritorio/AWCustomers.csv", header = TRUE, sep = ",")
df_status(customers)

# Check missing valueslapp
sapply(customers, function(x) sum(is.na(x)))

# Correlation matrix
datos <- customers %>% select_if(is.numeric)

cor(datos[, 2:6])
corrplot(cor(datos[, 2:6]), type = "upper")
# correlation matrix
a <- ggcorr(datos, hjust = 0.75, size = 5, layout.exp = 1, label = TRUE, label_size = 3, label_color = "white")
a

# Summary statistics
summary(datos)
lapply(datos, mean)


# Histogram

hist(datos$YearlyIncome, probability = TRUE)

