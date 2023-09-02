--  This query is used to return the replacement cost and total revenue by movie title

SELECT 
  A.title, 
  A.replacement_cost, 
  SUM(D.amount) AS total_revenue 
FROM 
  film A 
  INNER JOIN inventory B ON A.film_id = B.film_id 
  INNER JOIN rental C ON B.inventory_id = C.inventory_id 
  INNER JOIN payment D ON C.rental_id = D.rental_id 
GROUP BY 
  title, 
  replacement_cost 
ORDER BY 
  total_revenue DESC
