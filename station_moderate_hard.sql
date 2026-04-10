-- QUERY 1
-- Find states where the average latitude is greater than the overall average latitude of all stations

SELECT STATE, AVG(LAT_N) AS avg_latitude
FROM STATION
GROUP BY STATE
HAVING AVG(LAT_N) > (SELECT AVG(LAT_N) FROM STATION)
ORDER BY avg_latitude DESC;


-- QUERY 2
-- Find cities that appear in multiple states

SELECT CITY, COUNT(DISTINCT STATE) AS state_count,
GROUP_CONCAT(DISTINCT STATE) AS states
FROM STATION
GROUP BY CITY
HAVING COUNT(DISTINCT STATE) > 1
ORDER BY state_count DESC, CITY;


-- QUERY 3
-- For each state, find the northernmost and westernmost stations (highest LAT_N and lowest LONG_W)

SELECT STATE,
       MAX(CASE WHEN LAT_N = (SELECT MAX(LAT_N) FROM STATION s2 WHERE s2.STATE = STATION.STATE) 
           THEN CITY END) AS northernmost_city,
       MAX(LAT_N) AS north_latitude,
       MAX(CASE WHEN LONG_W = (SELECT MIN(LONG_W) FROM STATION s2 WHERE s2.STATE = STATION.STATE) 
           THEN CITY END) AS westernmost_city,
       MIN(LONG_W) AS west_longitude
FROM STATION
GROUP BY STATE
ORDER BY STATE;


-- QUERY 4
-- Find pairs of stations in the same state that are closest to each other

SELECT s1.STATE,
       s1.CITY AS station1,
       s2.CITY AS station2,
       ROUND(SQRT(POWER(s1.LAT_N - s2.LAT_N, 2) + POWER(s1.LONG_W - s2.LONG_W, 2)), 4) AS distance
FROM STATION s1
JOIN STATION s2 ON s1.STATE = s2.STATE AND s1.ID < s2.ID
WHERE ROUND(SQRT(POWER(s1.LAT_N - s2.LAT_N, 2) + POWER(s1.LONG_W - s2.LONG_W, 2)), 4) = (
  SELECT MIN(ROUND(SQRT(POWER(a.LAT_N - b.LAT_N, 2) + POWER(a.LONG_W - b.LONG_W, 2)), 4))
  FROM STATION a
  JOIN STATION b ON a.STATE = b.STATE AND a.ID < b.ID
  WHERE a.STATE = s1.STATE
)
ORDER BY s1.STATE;


-- QUERY 5
-- For each state, find stations that are closer than the average distance between stations in that state

SELECT s1.STATE, 
       s1.CITY AS city1,
       s2.CITY AS city2,
       ROUND(SQRT(POWER(s1.LAT_N - s2.LAT_N, 2) + POWER(s1.LONG_W - s2.LONG_W, 2)), 4) AS distance,
       ROUND((SELECT AVG(ROUND(SQRT(POWER(a.LAT_N - b.LAT_N, 2) + POWER(a.LONG_W - b.LONG_W, 2)), 4))
              FROM STATION a
              JOIN STATION b ON a.STATE = b.STATE AND a.ID < b.ID
              WHERE a.STATE = s1.STATE), 4) AS avg_distance_in_state
FROM STATION s1
JOIN STATION s2 ON s1.STATE = s2.STATE AND s1.ID < s2.ID
WHERE ROUND(SQRT(POWER(s1.LAT_N - s2.LAT_N, 2) + POWER(s1.LONG_W - s2.LONG_W, 2)), 4) < (
  SELECT AVG(ROUND(SQRT(POWER(a.LAT_N - b.LAT_N, 2) + POWER(a.LONG_W - b.LONG_W, 2)), 4))
  FROM STATION a
  JOIN STATION b ON a.STATE = b.STATE AND a.ID < b.ID
  WHERE a.STATE = s1.STATE
)
ORDER BY s1.STATE, distance;
