-- 5. User-defined function for year difference (MySQL)
DELIMITER //
CREATE FUNCTION year_diff_from_now(y INT)
RETURNS INT DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(y, '-01-01'), '%Y-%m-%d'), CURDATE());
END //
DELIMITER ;

-- Use the function
SELECT year, year_diff_from_now(year) AS year_diff FROM infectious_cases;
