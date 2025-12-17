suppressPackageStartupMessages({
  library(arulesViz)
})

rules_filtered <- readRDS("data/processed/rules_filtered.rds")

dir.create("assets", showWarnings = FALSE)

# Scatter plot (support/confidence shaded by lift)
png("assets/rules_scatter.png", width = 1400, height = 900)
plot(
  rules_filtered,
  method  = "scatterplot",
  measure = c("support", "confidence"),
  shading = "lift"
)
dev.off()

# Grouped matrix (nice for presentations)
png("assets/rules_grouped.png", width = 1400, height = 900)
plot(rules_filtered, method = "grouped")
dev.off()

cat("✅ Plots saved in assets/\n")
