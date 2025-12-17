suppressPackageStartupMessages({
  library(arules)
})

tickets <- readRDS("data/processed/tickets.rds")

# Adaptive thresholds:
# - If you test on a small excerpt (e.g., 14 tickets), use higher support like 0.2
# - For the full dataset (~473), your earlier baseline: supp ~0.07, conf ~0.04
n_tx <- length(tickets)

if (n_tx < 100) {
  supp <- 0.20
  conf <- 0.60
} else {
  supp <- 0.07
  conf <- 0.04
}

cat("Using parameters:\n")
cat(" - transactions:", n_tx, "\n")
cat(" - supp:", supp, "\n")
cat(" - conf:", conf, "\n\n")

rules <- apriori(
  tickets,
  parameter = list(
    supp   = supp,
    conf   = conf,
    minlen = 2,
    target = "rules"
  )
)

rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)

saveRDS(rules_sorted, "data/processed/rules_sorted.rds")

cat("✅ Rules mined:", length(rules_sorted), "\n")
cat("✅ Saved: data/processed/rules_sorted.rds\n\n")

inspect(head(rules_sorted, 20))
