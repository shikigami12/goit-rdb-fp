-- 2. Normalize infectious_cases to 3NF
-- Create country table
CREATE TABLE IF NOT EXISTS country (
                                       id INT AUTO_INCREMENT PRIMARY KEY,
                                       entity VARCHAR(255) NOT NULL,
    code VARCHAR(10) NOT NULL
    );

-- Create normalized infectious_case_3nf table
CREATE TABLE IF NOT EXISTS infectious_case_3nf (
                                                   id INT AUTO_INCREMENT PRIMARY KEY,
                                                   country_id INT,
                                                   year INT,
                                                   number_yaws INT,
                                                   polio_cases INT,
                                                   cases_guinea_worm INT,
                                                   number_rabies DOUBLE,
                                                   number_malaria DOUBLE,
                                                   number_hiv DOUBLE,
                                                   number_tuberculosis DOUBLE,
                                                   number_smallpox INT,
                                                   number_cholera_cases INT,
                                                   FOREIGN KEY (country_id) REFERENCES country(id)
    );

-- Fill country table with unique entity/code pairs
INSERT IGNORE INTO country (entity, code)
SELECT DISTINCT entity, code FROM infectious_cases;

-- Import data into infectious_case_3nf, converting text to numbers
INSERT INTO infectious_case_3nf (
    country_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases
)
SELECT
    c.id,
    ic.year,
    NULLIF(ic.number_yaws, ''),
    NULLIF(ic.polio_cases, ''),
    NULLIF(ic.cases_guinea_worm, ''),
    CAST(NULLIF(ic.number_rabies, '') as DOUBLE),
    CAST(NULLIF(ic.number_malaria, '') as DOUBLE),
    CAST(NULLIF(ic.number_hiv, '') as DOUBLE),
    CAST(NULLIF(ic.number_tuberculosis, '') as DOUBLE),
    NULLIF(ic.number_smallpox, ''),
    NULLIF(ic.number_cholera_cases, '')
FROM infectious_cases ic
JOIN country c ON ic.entity = c.entity AND ic.code = c.code;

-- Preview new data
SELECT * FROM infectious_case_3nf LIMIT 100;
