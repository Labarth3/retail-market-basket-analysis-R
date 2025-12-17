suppressPackageStartupMessages({
  library(arules)
  library(dplyr)
})

rules <- readRDS("data/processed/rules_sorted.rds")

dir.create("reports", showWarnings = FALSE)
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

# Keep only meaningful rules (same spirit as your report: lift > 1.10)
rules_filtered <- subset(rules, lift > 1.10)

df <- as(rules_filtered, "data.frame") |>
  arrange(desc(lift), desc(confidence), desc(support))

write.csv(df, "reports/rules_filtered.csv", row.names = FALSE)
saveRDS(rules_filtered, "data/processed/rules_filtered.rds")

cat("✅ Filtered rules:", length(rules_filtered), "\n")
cat("✅ Saved:\n - reports/rules_filtered.csv\n - data/processed/rules_filtered.rds\n")
