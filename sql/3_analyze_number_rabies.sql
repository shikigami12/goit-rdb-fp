-- 3. Analyze Number_rabies per country
SELECT 
  entity, code,
  AVG(CAST(number_rabies AS DECIMAL(15,4))) AS avg_rabies,
  MIN(CAST(number_rabies AS DECIMAL(15,4))) AS min_rabies,
  MAX(CAST(number_rabies AS DECIMAL(15,4))) AS max_rabies,
  SUM(CAST(number_rabies AS DECIMAL(15,4))) AS sum_rabies
FROM infectious_cases
WHERE number_rabies IS NOT NULL AND number_rabies != ''
GROUP BY entity, code
ORDER BY avg_rabies DESC
LIMIT 10;
