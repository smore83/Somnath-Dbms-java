-- Find out the number of documentaries with deleted scenes:
SELECT COUNT(*) AS documentary_count
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (
        SELECT category_id
        FROM category
        WHERE name = 'Documentary'
    )
) AND special_features LIKE '%Deleted Scenes%';

-- Find out the number of sci-fi movies rented by the store managed by Jon Stephens:
SELECT COUNT(*) AS sci_fi_count
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN store ON inventory.store_id = store.store_id
JOIN staff ON store.manager_staff_id = staff.staff_id
WHERE film_category.category_id = (
    SELECT category_id
    FROM category
    WHERE name = 'Sci-Fi'
) AND staff.first_name = 'Jon' AND staff.last_name = 'Stephens';


-- Find out the total sales from Animation movies:
SELECT SUM(payment.amount) AS total_sales
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Animation';


-- Find out the top 3 rented categories of movies by "PATRICIA JOHNSON":
SELECT category.name, COUNT(*) AS rental_count
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE customer.first_name = 'PATRICIA' AND customer.last_name = 'JOHNSON'
GROUP BY category.name
ORDER BY rental_count DESC
LIMIT 3;

-- Find out the number of R-rated movies rented by "SUSAN WILSON":
SELECT COUNT(*) AS r_rated_count
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE customer.first_name = 'SUSAN' AND customer.last_name = 'WILSON'
  AND film.rating = 'R';

