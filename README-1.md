# HackerRank SQL Queries - CITY Table

A collection of progressive SQL queries on the CITY table, ranging from moderate to hard difficulty levels.

## 📋 Table of Contents

- [Database Schema](#database-schema)
- [Queries](#queries)
- [How to Use](#how-to-use)
- [Difficulty Levels](#difficulty-levels)

---

## 📊 Database Schema

**Table: CITY**

| Field | Type | Description |
|-------|------|-------------|
| ID | NUMBER | Primary key |
| NAME | VARCHAR(17) | City name |
| COUNTRYCODE | VARCHAR(3) | Country code (e.g., 'USA') |
| DISTRICT | VARCHAR(20) | District/State name |
| POPULATION | NUMBER | Population count |

---

## 🔍 Queries

### Q1: Get American cities from specific districts with population range
- **Concepts:** WHERE clause, IN operator, BETWEEN, ORDER BY

### Q2: Get American cities with population filter and multiple ordering
- **Concepts:** WHERE clause, Multiple ORDER BY, Column selection

### Q3: Find total population by district
- **Concepts:** GROUP BY, SUM aggregation, ORDER BY

### Q4: Get cities above average population
- **Concepts:** Subqueries, AVG aggregation, WHERE with subquery

### Q5: Find highest population city in each district
- **Concepts:** Correlated subquery, MAX aggregation, Complex WHERE logic

---

## 💻 How to Use

### Option 1: Copy All Queries
Open `queries.sql` and copy the query you need

### Option 2: Run Specific Query
```sql
-- Copy the query number you want from queries.sql
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

- **Q1 & Q2:** Moderate - Basic filtering, ordering, multiple conditions
- **Q3:** Medium - Introduction to GROUP BY and aggregations
- **Q4:** Medium-Hard - Subqueries and comparisons
- **Q5:** Hard - Correlated subqueries and complex logic

---

## 🎯 Learning Path

1. Start with Q1 & Q2 to master basic SELECT, WHERE, ORDER BY
2. Move to Q3 to understand GROUP BY and aggregations
3. Try Q4 to learn subqueries
4. Challenge yourself with Q5 for correlated subqueries

---

## 📝 Notes

- All queries filter for `COUNTRYCODE = 'USA'`
- Modify the conditions as needed for different countries
- Use these as templates for similar problems

---

**Created for:** HackerRank SQL Practice
**Status:** Ready to use ✅
