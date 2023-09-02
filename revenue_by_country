--  This query is used to return the total revenue and total customers by country 

SELECT 
  F.country, 
  COUNT(distinct A.customer_id) AS total_customers, 
  SUM(amount) AS total_revenue 
FROM 
  customer A 
  INNER JOIN rental B ON A.customer_id = B.customer_id 
  INNER JOIN payment C ON B.rental_id = C.rental_id 
  INNER JOIN address D ON A.address_id = D.address_id 
  INNER JOIN city E ON D.city_id = E.city_id 
  INNER JOIN country F ON E.country_id = F.country_id 
GROUP BY 
  country 
ORDER BY 
  total_revenue DESC
