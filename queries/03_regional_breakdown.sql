-- What is the poverty rate by region across all years?
SELECT year, region, round(AVG(poverty_rate_pct), 2) AS avg_poverty_rate
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group BY year, region
order by region, year;


-- Which region recovered fastest after 2021?
SELECT region, ROUND(AVG(CASE WHEN year = 2021 THEN poverty_rate_pct END), 2) AS poverty_2021,
ROUND(AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END), 2) AS poverty_2024,
ROUND(
  AVG(CASE WHEN year = 2021 THEN poverty_rate_pct END) - 
  AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END)
, 2) AS recovery_
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group by region
order by recovery_ DESC
Limit 10;

-- Sub-Saharan Africa vs Latin America vs South Asia comparison
SELECT year, region, round(AVG(poverty_rate_pct), 2) AS avg_poverty_rate
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
WHERE region IN ('Sub-Saharan Africa', 'Latin America & Caribbean', 'South Asia')
group BY year, region
order by region, year;