--- // Maven Movies //
--- Analysis of Rental Patterns and Film Popularity in MavenMovies 

--- Rental Trends :-
--- Q: Analyze the monthly rental trends over the available data period?
SELECT 
DATE_FORMAT(rental_date, '%Y-%m') AS month_year, 
COUNT(r.rental_id) AS total_rentals
FROM 
rental r
WHERE 
rental_date BETWEEN '2005-05-24' AND '2005-08-23'
GROUP BY 
month_year
ORDER BY 
month_year;

--- Q2: Determine the peak rental hours in a day based on rental transactions?
SELECT 
HOUR(p.payment_date) AS rental_hour,
COUNT(r.rental_id) AS number_of_rentals
FROM 
rental r
JOIN 
payment p ON r.rental_id = p.rental_id
GROUP BY 
HOUR(p.payment_date)
ORDER BY 
number_of_rentals DESC;

---  Film Popularity:-
--- Q: 	Identify the top 10 most rented films?  
SELECT 
f.film_id, 
f.title, 
COUNT(r.rental_id) AS rental_count
FROM 
film f
JOIN 
inventory i ON f.film_id = i.film_id
JOIN 
rental r ON i.inventory_id = r.inventory_id
GROUP BY 
f.film_id, f.title
ORDER BY 
rental_count DESC
LIMIT 10;

--- Q2: Determine which film categories have the highest number of rentals?
SELECT 
c.name AS category_name,
COUNT(r.rental_id) AS rental_count
FROM 
category c
JOIN 
film_category fc ON c.category_id = fc.category_id
JOIN 
inventory i ON fc.film_id = i.film_id
JOIN 
rental r ON i.inventory_id = r.inventory_id
GROUP BY 
c.category_id, c.name
ORDER BY 
rental_count DESC;

--- Store Performance
--- Q1: Identify which store generates the highest rental revenue.

SELECT 
s.store_id,
SUM(p.amount) AS total_revenue
FROM 
store s
JOIN 
staff st ON st.store_id = s.store_id
JOIN 
rental r On r.staff_id = st.staff_id
JOIN 
payment p ON r.rental_id = p.rental_id
GROUP BY 
s.store_id
ORDER BY 
total_revenue DESC
LIMIT 1;

--- Q2: Determine the distribution of rentals by staff members to assess performance.
SELECT 
s.staff_id,
CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
COUNT(r.rental_id) AS rental_count
FROM 
staff s
JOIN 
rental r ON s.staff_id = r.staff_id
GROUP BY 
s.staff_id, staff_name
ORDER BY 
rental_count DESC;

SELECT 
    DATE_FORMAT(rental_date, '%Y-%m') AS month_year, 
    COUNT(r.rental_id) AS total_rentals
FROM 
    rental r
WHERE 
    rental_date BETWEEN '2005-05-24' AND '2005-08-23'
GROUP BY 
    month_year
ORDER BY 
    month_year;
















  
