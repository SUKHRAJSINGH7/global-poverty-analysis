-- Which countries fully recovered vs still below 2019 levels?
SELECT country, 
ROUND(AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END), 2) AS poverty_2019, 
ROUND(AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END), 2) AS poverty_2024,
ROUND(
  AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END) -
  AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END)
, 2) AS recovery_,
CASE WHEN poverty_2024 < poverty_2019 THEN 'Recovered' ELSE 'Not Recovered' END AS status
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
GROUP BY country
ORDER BY recovery_ DESC;

-- GDP per capita vs poverty rate recovery comparison
SELECT country, 
ROUND(AVG(CASE WHEN year = 2019 THEN gdp_per_capita_usd END), 2) AS gdp_per_capita_2019, 
ROUND(AVG(CASE WHEN year = 2024 THEN gdp_per_capita_usd END), 2) AS gdp_per_capita_2024,
ROUND(AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END), 2) AS poverty_2019, 
ROUND(AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END), 2) AS poverty_2024,
CASE 
    WHEN AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END) < AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END)
    THEN 'Recovered'
    ELSE 'Not Recovered'
END AS status
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
GROUP BY country
ORDER BY (AVG(CASE WHEN year = 2024 THEN gdp_per_capita_usd END) - AVG(CASE WHEN year = 2019 THEN gdp_per_capita_usd END)) DESC;

-- 2024 global snapshot vs 2015 starting point
SELECT 
ROUND(AVG(CASE WHEN year = 2015 THEN gdp_per_capita_usd END), 2) AS gdp_per_capita_2015, 
ROUND(AVG(CASE WHEN year = 2024 THEN gdp_per_capita_usd END), 2) AS gdp_per_capita_2024,
ROUND(AVG(CASE WHEN year = 2015 THEN poverty_rate_pct END), 2) AS poverty_2015, 
ROUND(AVG(CASE WHEN year = 2024 THEN poverty_rate_pct END), 2) AS poverty_2024,
ROUND(AVG(CASE WHEN year = 2015 THEN gini_coefficient END), 2) AS gini_2015,
ROUND(AVG(CASE WHEN year = 2024 THEN gini_coefficient END), 2) AS gini_2024,
ROUND(AVG(CASE WHEN year = 2015 THEN hdi_score END), 2) AS hdi_2015,
ROUND(AVG(CASE WHEN year = 2024 THEN hdi_score END), 2) AS hdi_2024
FROM read_csv_auto('data/global_poverty_economic_inequality.csv');
