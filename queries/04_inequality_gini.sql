 -- What are the Gini coefficient trends from 2019 to 2024?
SELECT year, ROUND(AVG(gini_coefficient), 2) AS avg_gini
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
WHERE year between 2019 AND 2024
group BY year
order by year;

-- Which countries saw poverty rate recover but Gini kept rising?
SELECT country,
  ROUND(AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END), 2) AS poverty_2019,
  ROUND(AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END), 2) AS poverty_2024,
  ROUND(
    AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END) -
    AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END)
  , 2) AS poverty_change,
  ROUND(AVG(CASE WHEN year = 2019 THEN gini_coefficient END), 2) AS gini_2019,
  ROUND(AVG(CASE WHEN year = 2024 THEN gini_coefficient END), 2) AS gini_2024,
  ROUND(
    AVG(CASE WHEN year = 2024 THEN gini_coefficient END) -
    AVG(CASE WHEN year = 2019 THEN gini_coefficient END)
  , 2) AS gini_change
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
GROUP BY country
HAVING poverty_change > 0 AND gini_change > 0
ORDER BY gini_change DESC;




-- Top 10 most unequal countries in 2024 vs 2015?