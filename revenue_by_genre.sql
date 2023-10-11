--  This query is used to return the total revenue by genre 

SELECT 
  A.name, 
  SUM(E.amount) AS total_revenue 
FROM 
  category A 
  INNER JOIN film_category B ON A.category_id = B.category_id 
  INNER JOIN inventory C ON B.film_id = C.film_id 
  INNER JOIN rental D ON C.inventory_id = D.inventory_id 
  INNER JOIN payment E ON D.rental_id = E.rental_id 
GROUP BY 
  A.name 
ORDER BY 
  total_revenue DESC
