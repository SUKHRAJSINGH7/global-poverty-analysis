-- What is the global average poverty rate for each year?
SELECT year, round(AVG(poverty_rate_pct), 2) AS avg_poverty_rate
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group BY year
order by year;
-- What is average poverty rate per region?
SELECT region, round(AVG(poverty_rate_pct), 2) AS avg_poverty_rate
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group BY region
order by avg_poverty_rate DESC;
-- How many countries are in each income group?
SELECT income_group, COUNT(DISTINCT country) AS country_count
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group BY income_group
order by COUNT(DISTINCT country) DESC;