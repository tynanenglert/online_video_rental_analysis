--  This query is used to return the name, country, city, and total amount paid of the top 5 revenue-generating customers

SELECT 
  CONCAT(B.first_name, ' ', B.last_name) AS cust_name, 
  E.country, 
  D.city, 
  SUM(amount) AS total_amt_paid 
FROM 
  payment A 
  INNER JOIN customer B ON A.customer_id = B.customer_id 
  INNER JOIN address C ON B.address_id = C.address_id 
  INNER JOIN city D ON C.city_id = D.city_id 
  INNER JOIN country E ON D.country_id = E.country_id 
GROUP BY 
  cust_name, 
  country, 
  city 
ORDER BY 
  total_amt_paid DESC 
LIMIT 
  5
