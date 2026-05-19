-- What was the global poverty rate in 2019 vs 2020 vs 2021?
SELECT year, round(AVG(poverty_rate_pct), 2) AS avg_poverty_rate
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
WHERE year between 2019 AND 2021
group BY year
order by year;

-- Finding: Poverty unexpectedly dropped in 2020 then spiked in 2021
-- Possible reasons: reporting lag, government stimulus masking impact
-- The 2021 rebound may be the true COVID effect showing up

-- Which countries had the biggest poverty spike between 2019 and 2021?
SELECT country, MAX(CASE WHEN year = 2019 THEN poverty_rate_pct END) AS poverty_2019,
MAX(CASE WHEN year = 2020 THEN poverty_rate_pct END) AS poverty_2020,
MAX(CASE WHEN year = 2021 THEN poverty_rate_pct END) AS poverty_2021,
ROUND(
  MAX(CASE WHEN year = 2021 THEN poverty_rate_pct END) - 
  MAX(CASE WHEN year = 2019 THEN poverty_rate_pct END)
, 2) AS spike
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group by country
order by spike DESC
Limit 10;
-- Mali: biggest spike +11.37 points (61.16% → 72.53%)
-- Myanmar: +3.98 points — military coup compounded COVID impact
-- Even wealthy nations affected: France +0.54, Germany +0.26
-- Scale of impact: poor nations hit 20x harder than rich nations

--  How many years of progress were erased?
    -- Globally: COVID did NOT dramatically reverse the trend  
    --  2021 (22.73%) was still lower than 2018 (23.76%)
    -- BUT: global averages hide country-level devastation
    -- Mali 2021 poverty (72.53%) was worse than any year in the dataset
    -- Key insight: aggregate numbers can mask humanitarian crises happening in specific countries 

-- Did high-income countries get affected too?
SELECT income_group,
ROUND(AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END), 2) AS poverty_2019,
ROUND(AVG(CASE WHEN year = 2020 THEN poverty_rate_pct END), 2) AS poverty_2020,
ROUND(AVG(CASE WHEN year = 2021 THEN poverty_rate_pct END), 2) AS poverty_2021,
ROUND(
  AVG(CASE WHEN year = 2021 THEN poverty_rate_pct END) - 
  AVG(CASE WHEN year = 2019 THEN poverty_rate_pct END)
, 2) AS spike
FROM read_csv_auto('data/global_poverty_economic_inequality.csv')
group by income_group
order by spike DESC
Limit 10;