# Retail Market Basket Analysis (Full R)

## 📌 Project overview
This project applies Market Basket Analysis techniques in R to analyze retail transaction data
and identify purchasing patterns between products.

The goal is to transform transactional data into **actionable business recommendations**
for retail decision-making (bundles, cross-selling, merchandising).

---

## 📊 Dataset
- Retail transaction tickets (basket format)
- Each transaction contains all products purchased together
- Products mainly from beverages and deli / prepared food categories
- Dataset anonymized and used for educational purposes

---

## 🧠 Methodology
1. Data import and cleaning
2. Exploratory Data Analysis (EDA)
3. Association rule mining using the Apriori algorithm
4. Rule filtering using support, confidence and lift
5. Business interpretation of the strongest rules

---

## 📈 Techniques & Tools
- R
- arules
- arulesViz
- tidyverse
- RMarkdown

---

## 💡 Key insights
- Strong complementarities between beverages and deli products
- Frequent co-purchases involving water, soda, cold cuts and prepared meals
- Clear opportunities for bundle offers and impulse buying strategies

---

## 🏪 Business recommendations
- Aperitif bundles (snacks + drinks)
- Event-based offers (sports nights)
- Cross-merchandising between beverages and deli sections
- Promotion of underperforming products through bundles

---

## ▶️ How to run the project
1. Place a basket-formatted transaction file in `data/raw/transactions.csv`
2. Run the scripts in order:
   - `R/01_import_clean.R`
   - `R/02_eda.R`
   - `R/03_apriori_rules.R`
   - `R/04_rules_filtering.R`
   - `R/05_visualization.R`
3. Open `reports/report.html`
