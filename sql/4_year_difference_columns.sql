-- 4. Add columns: first January date, current date, year difference
SELECT 
  year,
  STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d') AS first_jan,
  CURDATE() AS today,
  TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d'), CURDATE()) AS year_diff
FROM infectious_cases;
