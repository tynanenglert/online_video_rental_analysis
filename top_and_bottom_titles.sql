--  This query uses Common Table Expressions and Joins to combine the top and bottom 10 performing titles the respective genre and revenue

WITH temp AS (
  SELECT 
    A.title, 
    F.name, 
    SUM(D.amount) AS total_revenue 
  FROM 
    film A 
    INNER JOIN inventory B ON A.film_id = B.film_id 
    INNER JOIN rental C ON B.inventory_id = C.inventory_id 
    INNER JOIN payment D ON C.rental_id = D.rental_id 
    INNER JOIN film_category E ON A.film_id = E.film_id 
    INNER JOIN category F ON E.category_id = F.category_id 
  GROUP BY 
    title, 
    F.name 
  ORDER BY 
    total_revenue DESC 
  LIMIT 
    10
), bottom_10 AS (
  SELECT 
    A.title, 
    F.name, 
    SUM(D.amount) AS total_revenue 
  FROM 
    film A 
    INNER JOIN inventory B ON A.film_id = B.film_id 
    INNER JOIN rental C ON B.inventory_id = C.inventory_id 
    INNER JOIN payment D ON C.rental_id = D.rental_id 
    INNER JOIN film_category E ON A.film_id = E.film_id 
    INNER JOIN category F ON E.category_id = F.category_id 
  GROUP BY 
    title, 
    F.name 
  ORDER BY 
    total_revenue 
  LIMIT 
    10
) 
SELECT 
  * 
FROM 
  temp 
UNION 
SELECT 
  * 
FROM 
  bottom_10 
ORDER BY 
  total_revenue DESC
