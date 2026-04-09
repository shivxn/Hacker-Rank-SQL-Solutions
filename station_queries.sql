-- QUERY 1
-- Get all stations in California state

SELECT *
FROM STATION
WHERE STATE = 'CA';


-- QUERY 2
-- Get distinct cities from stations, ordered alphabetically along with their state

SELECT DISTINCT CITY, STATE
FROM STATION
ORDER BY CITY, STATE;


-- QUERY 3
-- Find stations with latitude between 30 and 40 and longitude between -100 and -90

SELECT ID, CITY, STATE, LAT_N, LONG_W
FROM STATION
WHERE LAT_N BETWEEN 30 AND 40
  AND LONG_W BETWEEN -100 AND -90
ORDER BY LAT_N DESC, LONG_W;


-- QUERY 4
-- Find the station closest to latitude 40.5 and longitude -75.5 
-- (Manhattan coordinates)

SELECT ID, CITY, STATE, LAT_N, LONG_W,
       ROUND(SQRT(POWER(LAT_N - 40.5, 2) + POWER(LONG_W - (-75.5), 2)), 4) AS distance
FROM STATION
ORDER BY distance ASC
LIMIT 1;


-- QUERY 5
-- For each state, find the pair of stations with maximum distance between them

SELECT s1.STATE, 
       s1.CITY AS city1, 
       s2.CITY AS city2,
       ROUND(SQRT(POWER(s1.LAT_N - s2.LAT_N, 2) + POWER(s1.LONG_W - s2.LONG_W, 2)), 4) AS distance
FROM STATION s1
JOIN STATION s2 ON s1.STATE = s2.STATE AND s1.ID < s2.ID
WHERE ROUND(SQRT(POWER(s1.LAT_N - s2.LAT_N, 2) + POWER(s1.LONG_W - s2.LONG_W, 2)), 4) = (
  SELECT MAX(ROUND(SQRT(POWER(a.LAT_N - b.LAT_N, 2) + POWER(a.LONG_W - b.LONG_W, 2)), 4))
  FROM STATION a
  JOIN STATION b ON a.STATE = b.STATE AND a.ID < b.ID
  WHERE a.STATE = s1.STATE
)
ORDER BY s1.STATE;
