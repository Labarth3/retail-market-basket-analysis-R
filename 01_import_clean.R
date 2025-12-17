suppressPackageStartupMessages({
  library(arules)
})

in_path  <- "data/raw/transactions.csv"
out_path <- "data/processed/tickets.rds"

if (!file.exists(in_path)) {
  stop("❌ Missing file: ", in_path, "\nPlace your basket file in data/raw/transactions.csv")
}

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

# IMPORTANT:
# - No header required
# - First column is transaction id, then items separated by ';'
tickets <- read.transactions(
  file   = in_path,
  format = "basket",
  sep    = ";",
  cols   = 1
)

saveRDS(tickets, out_path)

cat("✅ Imported transactions:", length(tickets), "\n")
cat("✅ Saved:", out_path, "\n\n")
summary(tickets)
