-- 1. Create schema and set as default
CREATE SCHEMA IF NOT EXISTS pandemic;
USE pandemic;
CREATE TABLE `infectious_cases` (
                                    `Entity` text,
                                    `Code` text,
                                    `Year` int DEFAULT NULL,
                                    `Number_yaws` text,
                                    `polio_cases` text,
                                    `cases_guinea_worm` text,
                                    `Number_rabies` text,
                                    `Number_malaria` text,
                                    `Number_hiv` text,
                                    `Number_tuberculosis` text,
                                    `Number_smallpox` text,
                                    `Number_cholera_cases` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM infectious_cases LIMIT 10;
