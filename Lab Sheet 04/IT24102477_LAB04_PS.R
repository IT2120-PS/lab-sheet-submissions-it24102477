setwd("C:\\Users\\IT24102477\\Downloads\\IT24102477Lab04")

branch_data <- read.table("Exercise.txt", header = TRUE, sep = ",")

boxplot(branch_data$Sales_X1,
        main = "Boxplot for Sales",
        ylab = "Sales",
        col = "lightblue",
        horizontal = FALSE)

cat("Five-Number summery for Advertisting:\n")
print(summary(branch_data$Advertising_X2))

cat("IQR for Advertisting:\n")
print(IQR(branch_data$Advertising_X2))

find_Outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_val <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR_val
  upper_bound <- Q3 + 1.5 * IQR_val
  outliers <- x[x < lower_bound | x > upper_bound]  
  return(outliers)
}

outliers_years <- find_Outliers((branch_data$Years_X3))
cat("outliers in years (years_X3:\n")
print(outliers_years)

