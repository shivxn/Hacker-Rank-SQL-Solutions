# HackerRank SQL Queries - STATION Table

A collection of progressive SQL queries on the STATION table, ranging from easy to hard difficulty levels.

## 📋 Table of Contents

- [Database Schema](#database-schema)
- [Queries](#queries)
- [How to Use](#how-to-use)
- [Difficulty Levels](#difficulty-levels)

---

## 📊 Database Schema

**Table: STATION**

| Field | Type | Description |
|-------|------|-------------|
| ID | NUMBER | Primary key |
| CITY | VARCHAR(21) | City name |
| STATE | VARCHAR(2) | State code (e.g., 'CA', 'NY') |
| LAT_N | NUMBER | Northern latitude coordinate |
| LONG_W | NUMBER | Western longitude coordinate |

**Note:** LAT_N represents northern latitude and LONG_W represents western longitude.

---

## 🔍 Queries

### Q1: Get all stations in a specific state
- **Difficulty:** Easy
- **Concepts:** Basic SELECT, WHERE clause
- **File:** `station_queries.sql` (Query 1)

### Q2: Get distinct cities with their state, ordered alphabetically
- **Difficulty:** Easy
- **Concepts:** DISTINCT, ORDER BY
- **File:** `station_queries.sql` (Query 2)

### Q3: Find stations with latitude and longitude within specific range
- **Difficulty:** Easy-Medium
- **Concepts:** WHERE with multiple conditions, AND operator
- **File:** `station_queries.sql` (Query 3)

### Q4: Find the station closest to a specific coordinate
- **Difficulty:** Medium
- **Concepts:** Distance calculation, ORDER BY, LIMIT
- **File:** `station_queries.sql` (Query 4)

### Q5: Find the city and state with maximum distance between northernmost and westernmost points
- **Difficulty:** Hard
- **Concepts:** GROUP BY, Aggregation functions, Complex calculations
- **File:** `station_queries.sql` (Query 5)

---

## 💻 How to Use

### Option 1: Copy All Queries
Open `station_queries.sql` and copy the query you need

### Option 2: Run Specific Query
```sql
-- Copy the query number you want from station_queries.sql
-- Paste it into your SQL editor
-- Execute it
```

### Option 3: Import File
```sql
-- Some SQL clients support direct file import
-- Check your HackerRank interface for import options
```

---

## 📈 Difficulty Levels

- **Q1 & Q2 & Q3:** Easy to Easy-Medium - Basic filtering, ordering, distinct values
- **Q4:** Medium - Distance calculations, aggregations
- **Q5:** Hard - Complex GROUP BY, multiple aggregations, mathematical calculations

---

## 🎯 Learning Path

1. Start with Q1 & Q2 to master basic SELECT, WHERE, DISTINCT
2. Move to Q3 for multiple conditions in WHERE
3. Try Q4 to learn distance calculations
4. Challenge yourself with Q5 for complex aggregations

---

## 📝 Notes

- All coordinates can be used for distance calculations
- Use these queries as templates for geographic/spatial data problems
- Modify state codes and coordinate ranges as needed

---

**Created for:** HackerRank SQL Practice
**Status:** Ready to use ✅
