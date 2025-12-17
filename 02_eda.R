suppressPackageStartupMessages({
  library(arules)
  library(tidyverse)
})

tickets <- readRDS("data/processed/tickets.rds")

dir.create("reports", showWarnings = FALSE)

# Basic summary
sink("reports/summary.txt")
cat("=== SUMMARY ===\n")
print(summary(tickets))
cat("\n=== TOP 30 ITEMS (frequency) ===\n")
print(sort(itemFrequency(tickets), decreasing = TRUE)[1:30])
sink()

# Export item frequencies
freq <- sort(itemFrequency(tickets), decreasing = TRUE)
write.csv(
  data.frame(item = names(freq), frequency = as.numeric(freq)),
  "reports/item_frequency.csv",
  row.names = FALSE
)

# Basket size distribution
basket_sizes <- size(tickets)
write.csv(
  data.frame(basket_size = basket_sizes),
  "reports/basket_sizes.csv",
  row.names = FALSE
)

cat("✅ EDA exports written to reports/\n")
