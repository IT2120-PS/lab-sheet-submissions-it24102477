setwd("C:/Users/IT24102477/Downloads/IT24102477")

Delivery_Times <- read.table("Exercise - Lab 05.txt", header = TRUE)

str(Delivery_Times)
head(Delivery_Times)

breaks <- seq(20, 70, length.out = 10)

hist(Delivery_Times$Delivery_Time,
     breaks = breaks,
     right = FALSE,   # right-open intervals
     main = "Histogram of Delivery Times",
     xlab = "Delivery Times (minutes)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

hist_data <- hist(Delivery_Times$Delivery_Time,
                  breaks = breaks,
                  right = FALSE,
                  plot = FALSE)

freq_table <- data.frame(
  Class_Interval = paste(head(breaks, -1), "-", tail(breaks, -1)),
  Frequency = hist_data$counts,
  Cumulative_Frequency = cumsum(hist_data$counts)
)

print(freq_table)

plot(hist_data$breaks[-1], cumsum(hist_data$counts), type = "o",
     main = "Cumulative Frequency Polygon (Ogive)",
     xlab = "Delivery Times (minutes)",
     ylab = "Cumulative Frequency",
     col = "red", pch = 16)
