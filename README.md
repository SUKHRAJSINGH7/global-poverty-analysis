# 🌍 SQL + Tableau analysis of global poverty & COVID-19 impact across 40 countries (2015–2024

> How COVID-19 reversed a decade of progress — and what the data reveals about inequality, recovery, and the world's most vulnerable nations.

---

## 📊 Live Dashboard

👉 [View Interactive Dashboard on Tableau Public](https://public.tableau.com/app/profile/sukhraj.singh6336/viz/Global_poverty_analysis/GlobalPovertyCOVID-19ImpactAnalysis)

---

## 🔍 Key Findings

1. **Mali was hit hardest by COVID** — poverty spiked +11.37 points (61% → 72.5%), the largest increase of any country in the dataset
2. **The world got less poor but no more equal** — global poverty fell 4.49 points over 10 years but the Gini coefficient barely moved
3. **21 countries got less poor AND more unequal simultaneously** — recovery masked rising inequality
4. **36 of 40 countries recovered by 2024** — but Yemen, Mali, Egypt & Nepal are still going backwards
5. **Sub-Saharan Africa vs North America: a 36x poverty gap** — 37.84% vs 1.05% average poverty rate
6. **Latin America's quiet success** — nearly halved its poverty rate from 18% to 10% over 10 years

---

## 📁 Repo Structure

```
global-poverty-analysis/
├── data/
│   └── exports/                  ← CSV files powering the Tableau dashboard
│       ├── 01_global_trend.csv
│       ├── 02_covid_impact.csv
│       ├── 03_regional_breakdown.csv
│       ├── 04_gini_inequality.csv
│       └── 05_recovery.csv
├── queries/                      ← All SQL analysis files
│   ├── 01_overview.sql
│   ├── 02_covid_impact.sql
│   ├── 03_regional_breakdown.sql
│   ├── 04_inequality_gini.sql
│   └── 05_recovery.sql
├── report/
│   └── blog_post.md              ← Full written analysis
└── README.md
```

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| SQL (DuckDB) | Data cleaning, analysis, and querying |
| Tableau Public | Interactive dashboard and visualization |
| Git / GitHub | Version control and portfolio hosting |

---

## 📖 Read the Full Report[
](https://github.com/SUKHRAJSINGH7/global-poverty-analysis/blob/main/report/Blog_Post.md)
[The World Got Less Poor — But Nobody Got More Equal]

A deep dive into what the data actually shows about COVID's impact,
regional inequality, and the countries still struggling in 2024.

---

## 📂 Data Source

[Global Poverty & Economic Inequality 2015–2024](https://www.kaggle.com/datasets/hamnamunir/global-poverty-and-economic-inequality-2015-2024) via Kaggle

- 40 countries across 10 regions
- 10 years of data (2015–2024)
- 25 economic and social indicators

> All cleaned and analysis-ready CSV files are included in `/data/exports/` — no downloads required.

---

## 🚀 How to Run the Queries

1. Install [DuckDB](https://duckdb.org/)
2. Clone this repo
3. Open terminal in your project folder and run:

```bash
duckdb
```
Then run any query file:

```sql
.read queries/01_overview.sql
```
All data is already in `/data/exports/` — ready to go.
