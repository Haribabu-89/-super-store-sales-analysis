-- ============================================================
--  SUPER STORE SALES AND PERFORMANCE ANALYSIS
--  Author  : K Haribabu
--  Institute: Besant Technology
--  Guide   : Mr. KaviBharathi
--  Date    : 06/03/2026
--  Tool    : MySQL
-- ============================================================
--  Dataset : store (10,000+ US retail sales records)
--            emp   (employee reference table)
--  Topics  : SELECT, WHERE, GROUP BY, HAVING, ORDER BY,
--            LIMIT/OFFSET, Subqueries, Joins, String Functions
-- ============================================================


-- ------------------------------------------------------------
-- QUERY 1: Display all distinct states in the store
-- ------------------------------------------------------------
SELECT DISTINCT state
FROM store;


-- ------------------------------------------------------------
-- QUERY 2: Display segment, country, total sales, and number
--          of orders for each country in every segment
-- ------------------------------------------------------------
SELECT
    segment,
    country,
    SUM(sales)  AS total_sales,
    COUNT(*)    AS number_of_orders
FROM store
GROUP BY segment, country;


-- ------------------------------------------------------------
-- QUERY 3: Display region and total sales ordered by highest
--          sales, using LIMIT 5 and OFFSET 2
-- ------------------------------------------------------------
SELECT
    region,
    SUM(sales) AS total_sales
FROM store
GROUP BY region
ORDER BY SUM(sales) DESC
LIMIT 5 OFFSET 2;


-- ------------------------------------------------------------
-- QUERY 4: Display category and total quantity — bottom 3
-- ------------------------------------------------------------
SELECT
    category,
    SUM(quantity) AS total_quantity
FROM store
GROUP BY category
ORDER BY SUM(quantity) ASC
LIMIT 3;


-- ------------------------------------------------------------
-- QUERY 5: Display states with profit margin above 30%
--          (Question says >10%, query filters >30%)
-- ------------------------------------------------------------
SELECT
    state,
    (SUM(profit) / SUM(sales)) * 100 AS margin
FROM store
GROUP BY state
HAVING (SUM(profit) / SUM(sales)) * 100 > 30;


-- ------------------------------------------------------------
-- QUERY 6: Display state and region where state starts with
--          'K' and region does NOT end with 'A'
-- ------------------------------------------------------------
SELECT
    state,
    region
FROM store
WHERE state   LIKE 'K%'
  AND region  NOT LIKE '%a';


-- ------------------------------------------------------------
-- QUERY 7: Display city and region where profit is between
--          500 and 2000 AND sales is NOT between 50 and 100
-- ------------------------------------------------------------
SELECT
    city,
    region
FROM store
WHERE profit BETWEEN 500  AND 2000
  AND sales  NOT BETWEEN 50 AND 100;


-- ------------------------------------------------------------
-- QUERY 8: Display all records where discount = 0 and profit
--          is NOT NULL
-- ------------------------------------------------------------
SELECT *
FROM store
WHERE discount = 0
  AND profit IS NOT NULL;


-- ------------------------------------------------------------
-- QUERY 9: Display count of orders and maximum sales per
--          state where profit is between 1000 and 2000
-- ------------------------------------------------------------
SELECT
    state,
    COUNT(*)    AS number_of_orders,
    MAX(sales)  AS max_sales
FROM store
WHERE profit BETWEEN 1000 AND 2000
GROUP BY state;


-- ------------------------------------------------------------
-- QUERY 10: Display average profit and minimum sales where
--           region starts with 'S' and category does NOT
--           start with 'f'
-- ------------------------------------------------------------
SELECT
    AVG(profit) AS avg_profit,
    MIN(sales)  AS min_sales
FROM store
WHERE region   LIKE 'S%'
  AND category NOT LIKE 'f%';


-- ------------------------------------------------------------
-- QUERY 11: Display count of orders where sales > 100,
--           grouped by profit, having at least 4 orders
-- ------------------------------------------------------------
SELECT
    profit,
    COUNT(*) AS number_of_orders
FROM store
WHERE sales > 100
GROUP BY profit
HAVING COUNT(*) >= 4;


-- ------------------------------------------------------------
-- QUERY 12: Display profit, region, and segment ordered by
--           profit in descending order
-- ------------------------------------------------------------
SELECT
    profit,
    region,
    segment
FROM store
ORDER BY profit DESC;


-- ------------------------------------------------------------
-- QUERY 13: Display sales and profit where sales is greater
--           than the sales value where profit = 500
--           (Subquery)
-- ------------------------------------------------------------
SELECT
    sales,
    profit
FROM store
WHERE sales > (
    SELECT sales
    FROM store
    WHERE profit = 500
);


-- ------------------------------------------------------------
-- QUERY 14: Display employee names (ename) who work in
--           regions that have 'Furniture' category sales
--           (Subquery with IN)
-- ------------------------------------------------------------
SELECT ename
FROM emp
WHERE region IN (
    SELECT region
    FROM store
    WHERE category = 'furniture'
);


-- ------------------------------------------------------------
-- QUERY 15: Display string function results —
--           LENGTH of shipmode, CONCAT of segment + city,
--           UPPER of country, LOWER of state,
--           REVERSE of region
-- ------------------------------------------------------------
SELECT
    LENGTH(shipmode)          AS shipmode_length,
    CONCAT(segment, city)     AS segment_city,
    UPPER(country)            AS country_upper,
    LOWER(state)              AS state_lower,
    REVERSE(region)           AS region_reversed
FROM store;


-- ------------------------------------------------------------
-- QUERY 16: Display city and sales where sales is greater
--           than ALL Henderson sales AND less than ANY
--           Los Angeles sales (ALL / ANY Subqueries)
-- ------------------------------------------------------------
SELECT
    city,
    sales
FROM store
WHERE sales > ALL (
        SELECT sales
        FROM store
        WHERE city = 'Henderson'
    )
  AND sales < ANY (
        SELECT sales
        FROM store
        WHERE city = 'Los Angeles'
    );


-- ------------------------------------------------------------
-- QUERY 17: Display region of the record with the 1st
--           maximum (highest) sales value
-- ------------------------------------------------------------
SELECT region
FROM store
WHERE sales IN (
    SELECT MAX(sales)
    FROM store
);


-- ------------------------------------------------------------
-- QUERY 18: Display region of the record with the 3rd
--           minimum sales value (nested subqueries)
-- ------------------------------------------------------------
SELECT region
FROM store
WHERE sales IN (
    SELECT MIN(sales)
    FROM store
    WHERE sales > (
        SELECT MIN(sales)
        FROM store
        WHERE sales > (
            SELECT MIN(sales)
            FROM store
        )
    )
);


-- ------------------------------------------------------------
-- QUERY 19: Display states in the region where employee
--           'himaakar' works (Correlated Subquery)
-- ------------------------------------------------------------
SELECT state
FROM store
WHERE region IN (
    SELECT region
    FROM emp
    WHERE ename = 'himaakar'
);


-- ------------------------------------------------------------
-- QUERY 20: Display city, subcategory, and ename using
--           CROSS JOIN where profit > 500
-- ------------------------------------------------------------
SELECT
    store.city,
    store.subcategory,
    emp.ename
FROM store
CROSS JOIN emp
    ON store.region = emp.region
   AND store.profit > 500;


-- ------------------------------------------------------------
-- QUERY 21: Display country, postalcode, and ename using
--           INNER JOIN where sales < 100
-- ------------------------------------------------------------
SELECT
    store.country,
    store.postalcode,
    emp.ename
FROM store
INNER JOIN emp
    ON store.region = emp.region
   AND store.sales < 100;


-- ------------------------------------------------------------
-- QUERY 22: Display shipmode, segment, and empno using
--           LEFT OUTER JOIN where category is
--           'furniture' or 'office supplies'
-- ------------------------------------------------------------
SELECT
    store.shipmode,
    store.segment,
    emp.empno
FROM store
LEFT JOIN emp
    ON store.region = emp.region
   AND store.category IN ('furniture', 'office supplies');


-- ------------------------------------------------------------
-- QUERY 23: Display state, subcategory, and empno using
--           RIGHT OUTER JOIN where quantity > 4
-- ------------------------------------------------------------
SELECT
    store.state,
    store.subcategory,
    emp.empno
FROM store
RIGHT JOIN emp
    ON store.region = emp.region
   AND store.quantity > 4;


-- ------------------------------------------------------------
-- QUERY 24: Display city and ename using JOIN (alias as
--           self join style) where profit > 2000
-- ------------------------------------------------------------
SELECT
    e1.city,
    e2.ename
FROM store e1
JOIN emp e2
    ON e1.region = e2.region
   AND e1.profit > 2000;


-- ------------------------------------------------------------
-- QUERY 25: Display subcategory, segment, postalcode, and
--           ename using NATURAL JOIN
-- ------------------------------------------------------------
SELECT
    subcategory,
    segment,
    postalcode,
    ename
FROM store
NATURAL JOIN emp;


-- ============================================================
--  END OF QUERIES
--  Total: 25 queries covering SELECT, WHERE, GROUP BY,
--         HAVING, ORDER BY, LIMIT/OFFSET, Subqueries (IN,
--         ALL, ANY, Nested), String Functions, and all
--         JOIN types (INNER, LEFT, RIGHT, CROSS, NATURAL)
-- ============================================================
