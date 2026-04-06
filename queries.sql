-- ============================================================
-- HackerRank SQL Queries - CITY Table
-- 5 Progressive Queries (Moderate to Hard)
-- ============================================================

-- ============================================================
-- QUERY 1:
-- Description: Get American cities from specific districts 
--              with population between 50,000 and 500,000
-- Concepts: WHERE, IN operator, BETWEEN, ORDER BY
-- ============================================================

-- Q1 Start
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' 
  AND DISTRICT IN ('California', 'Texas')
  AND POPULATION BETWEEN 50000 AND 500000
ORDER BY POPULATION DESC;
-- Q1 End


-- ============================================================
-- QUERY 2:
-- Description: Get American cities with population > 100,000
--              ordered by district and then by population
-- Concepts: WHERE, Multiple ORDER BY, Column selection
-- ============================================================

-- Q2 Start
SELECT NAME, DISTRICT, POPULATION
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000
ORDER BY DISTRICT, POPULATION DESC;
-- Q2 End


-- ============================================================
-- QUERY 3: 
-- Description: Find the total population for each district 
--              in USA, ordered by total population
-- Concepts: GROUP BY, SUM aggregation, ORDER BY
-- ============================================================

-- Q3 Start
SELECT DISTRICT, SUM(POPULATION) AS total_population
FROM CITY
WHERE COUNTRYCODE = 'USA'
GROUP BY DISTRICT
ORDER BY total_population DESC;
-- Q3 End


-- ============================================================
-- QUERY 4: 
-- Description: Get American cities with population greater 
--              than the average population of all USA cities
-- Concepts: Subqueries, AVG aggregation, WHERE with subquery
-- ============================================================

-- Q4 Start
SELECT NAME, POPULATION
FROM CITY
WHERE COUNTRYCODE = 'USA' 
  AND POPULATION > (SELECT AVG(POPULATION) FROM CITY WHERE COUNTRYCODE = 'USA')
ORDER BY POPULATION DESC;
-- Q4 End


-- ============================================================
-- QUERY 5: 
-- Description: Find the city with the highest population 
--              in each district
-- Concepts: Correlated subquery, MAX aggregation
-- ============================================================

-- Q5 Start
SELECT NAME, DISTRICT, POPULATION
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION = (SELECT MAX(POPULATION) FROM CITY c2 WHERE c2.DISTRICT = CITY.DISTRICT);
-- Q5 End


-- ============================================================
-- ============================================================
