

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

       -- SOLUTION1
SELECT
	first_name,
    last_name,
    email,
    store_id
FROM 
	staff;


/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 
       -- SOLUTION2
SELECT
	store_id,
		COUNT(CASE WHEN store_id = 1 OR store_id = 2 THEN inventory_id ELSE NULL END) AS inventory_in_store
FROM 
	inventory
GROUP BY 
	store_id;



/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/
			 -- SOLUTION3
SELECT DISTINCT 
	store_id,
		COUNT(CASE WHEN (store_id = 1 AND active = 1) OR (store_id = 2 AND active = 1)  THEN 'active' ELSE NULL END) AS active_customers
FROM 
	customer
GROUP BY 
	store_id;




/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/
			 -- SOLUTION4
SELECT
		COUNT(email) AS customers_emails
FROM 
	customer;





/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/
			-- SOLUTION5
SELECT 
	store_id,
        COUNT( DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY 
	store_id;
    
SELECT 
        COUNT( DISTINCT name) AS unique_Categories
FROM category;



/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/
			-- SOLUTION6
SELECT 
	MIN(replacement_cost) AS least_expensive,
	MAX(replacement_cost) AS least_expensive,
	AVG(replacement_cost) AS least_expensive
FROM 
	film;



/*
7.	We are interested in having you put payment monitoring systems     and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/
		-- SOLUTION7
SELECT  DISTINCT
	staff_id,
		AVG(CASE WHEN staff_id = 1 OR staff_id = 2 THEN amount ELSE '-' END) AS average_amount,
		MAX(CASE WHEN staff_id = 2 OR staff_id = 1 THEN amount ELSE '-' END) AS maximum_amount
FROM 
	payment
		GROUP BY staff_id
		ORDER BY staff_id DESC;



/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/
		-- SOLUTION8
SELECT DISTINCT
	customer_id,
    COUNT(rental_id) AS rentals_count
FROM 
	payment
GROUP BY 
	customer_id
ORDER BY  
    rentals_count DESC;

