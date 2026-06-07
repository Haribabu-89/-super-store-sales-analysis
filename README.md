# Super Store Sales and Performance Analysis — SQL

**Author:** K Haribabu &nbsp;|&nbsp; **Institute:** Besant Technology &nbsp;|&nbsp; **Date:** March 2026

---

## Project Overview

Analysed 10,000+ US retail sales records using MySQL to uncover revenue trends, regional performance, profit patterns, and customer segment behaviour. The project covers 25 structured SQL queries spanning beginner to advanced concepts.

---

## Dataset

| Table   | Description                                          |
|---------|------------------------------------------------------|
| `store` | 10,000+ retail sales records across US regions       |
| `emp`   | Employee reference table linked by region            |

**Key columns:** `city`, `state`, `region`, `category`, `subcategory`, `segment`, `sales`, `profit`, `quantity`, `discount`, `shipmode`, `postalcode`

---

## Tools Used

- MySQL / MySQL Workbench

---

## SQL Concepts Covered

| Category              | Concepts                                                  |
|-----------------------|-----------------------------------------------------------|
| Filtering             | WHERE, BETWEEN, LIKE, NOT LIKE, IS NOT NULL               |
| Aggregation           | SUM, COUNT, AVG, MAX, MIN, GROUP BY, HAVING               |
| Sorting & Pagination  | ORDER BY ASC/DESC, LIMIT, OFFSET                          |
| Subqueries            | IN, ALL, ANY, Nested subqueries, Correlated subqueries    |
| String Functions      | LENGTH, CONCAT, UPPER, LOWER, REVERSE                     |
| Joins                 | INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN, NATURAL JOIN |

---

## Key Queries & Findings

| # | Query Focus | Key Finding |
|---|-------------|-------------|
| 2 | Segment × Country sales | Consumer segment generated ~$1.16M — highest of all segments |
| 3 | Regional sales ranking | West region ranked #1; Central and South ranked 3rd and 4th after offset |
| 4 | Category quantity | Technology had the lowest total quantity (6,939 units) |
| 5 | High-margin states | 12 states achieved profit margins above 30% |
| 9 | High-profit orders | California had 11 orders with profit between $1,000–$2,000 |
| 16 | Sales range filter | Multiple cities had sales between all Henderson values and any Los Angeles value |
| 17 | Max sales region | South region recorded the single highest sale |
| 18 | 3rd min sales region | Central region had the 3rd minimum sales value |

---

## File Structure

```
super-store-sales-sql/
│
├── queries.sql          ← All 25 SQL queries, cleanly formatted
├── SQL_Project_Report.pdf  ← Full project documentation with output screenshots
└── README.md            ← This file
```

---

## How to Run

1. Import the `store` and `emp` tables into your MySQL database
2. Open `queries.sql` in MySQL Workbench
3. Run queries individually or all at once

---

## Connect

- **LinkedIn:** [linkedin.com/in/k-haribabu-1160a42bb](https://linkedin.com/in/k-haribabu-1160a42bb)
- **Portfolio:** [haribabu-89.github.io](https://haribabu-89.github.io)
- **GitHub:** [github.com/Haribabu-89](https://github.com/Haribabu-89)
