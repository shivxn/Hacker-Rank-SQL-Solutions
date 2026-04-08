-- QUERY 1
-- Find districts where the average population is greater than 
-- the overall average population of all USA cities

SELECT DISTRICT, AVG(POPULATION) AS avg_district_population
FROM CITY
WHERE COUNTRYCODE = 'USA'
GROUP BY DISTRICT
HAVING AVG(POPULATION) > (SELECT AVG(POPULATION) FROM CITY WHERE COUNTRYCODE = 'USA')
ORDER BY avg_district_population DESC;


-- QUERY 2
-- Get cities that have population greater than all cities 
-- in their respective district except themselves

SELECT NAME, DISTRICT, POPULATION
FROM CITY c1
WHERE COUNTRYCODE = 'USA'
  AND POPULATION >= (SELECT MAX(POPULATION) FROM CITY c2 
                     WHERE c2.COUNTRYCODE = 'USA' 
                     AND c2.DISTRICT = c1.DISTRICT 
                     AND c2.NAME != c1.NAME)
ORDER BY DISTRICT, POPULATION DESC;


-- QUERY 3
-- Find cities where population is between the 50th and 75th 
-- percentile of USA city populations

SELECT NAME, DISTRICT, POPULATION
FROM CITY c1
WHERE COUNTRYCODE = 'USA'
  AND POPULATION >= (
    SELECT POPULATION FROM CITY
    WHERE COUNTRYCODE = 'USA'
    ORDER BY POPULATION
    LIMIT 1 OFFSET (SELECT FLOOR(COUNT(*) * 0.5) - 1 FROM CITY WHERE COUNTRYCODE = 'USA')
  )
  AND POPULATION <= (
    SELECT POPULATION FROM CITY
    WHERE COUNTRYCODE = 'USA'
    ORDER BY POPULATION
    LIMIT 1 OFFSET (SELECT FLOOR(COUNT(*) * 0.75) - 1 FROM CITY WHERE COUNTRYCODE = 'USA')
  )
ORDER BY POPULATION;


-- QUERY 4
-- Get top 3 cities by population in each district along with 
-- their rank within that district

SELECT NAME, DISTRICT, POPULATION, rank_in_district
FROM (
  SELECT NAME, DISTRICT, POPULATION,
         RANK() OVER (PARTITION BY DISTRICT ORDER BY POPULATION DESC) AS rank_in_district
  FROM CITY
  WHERE COUNTRYCODE = 'USA'
)
WHERE rank_in_district <= 3
ORDER BY DISTRICT, rank_in_district;


-- QUERY 5
-- Find districts where the total population exceeds the average 
-- total population across all districts, and show cumulative 
-- population contribution percentage

SELECT DISTRICT, 
       total_district_population,
       ROUND(100.0 * total_district_population / 
             (SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = 'USA'), 2) 
       AS percentage_of_total
FROM (
  SELECT DISTRICT, SUM(POPULATION) AS total_district_population
  FROM CITY
  WHERE COUNTRYCODE = 'USA'
  GROUP BY DISTRICT
  HAVING SUM(POPULATION) > (SELECT AVG(district_total) 
                             FROM (SELECT SUM(POPULATION) AS district_total
                                   FROM CITY
                                   WHERE COUNTRYCODE = 'USA'
                                   GROUP BY DISTRICT))
)
ORDER BY total_district_population DESC;
