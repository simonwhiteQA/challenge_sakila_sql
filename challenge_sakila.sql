/* QA - Community: Sakila Challenge */

SELECT * FROM actor;

SELECT first_name, last_name FROM actor WHERE first_name='John';

SELECT * FROM actor WHERE last_name='Neeson';

SELECT * FROM actor WHERE actor_id LIKE '%0';

SELECT title, description FROM film WHERE film_id='100';

SELECT * FROM film WHERE rating='R';

SELECT * FROM film WHERE rating!='R';

SELECT * FROM film ORDER BY length ASC LIMIT 10;

SELECT title, length FROM film WHERE length=(SELECT max(length) FROM film);

SELECT * FROM film WHERE special_features LIKE '%Deleted Scenes%';

SELECT last_name FROM actor GROUP BY last_name HAVING count(last_name)=1 ORDER BY last_name DESC;

SELECT last_name, count(last_name) c FROM actor GROUP BY last_name HAVING c>1 ORDER BY c DESC;

SELECT a.first_name, a.last_name, COUNT(f.film_id) Film_Count 
FROM actor a JOIN film_actor f ON a.actor_id = f.actor_id
GROUP BY a.actor_id HAVING Film_Count ORDER BY Film_Count DESC LIMIT 1;

SELECT title, r.rental_date, date_add(r.rental_date, INTERVAL f.rental_duration DAY) AS Due_Date
FROM film f JOIN inventory i ON f.film_id=i.film_id
JOIN rental r ON i.inventory_id=r.inventory_id WHERE title='Academy Dinosaur' AND r.return_date IS NULL;

SELECT avg(length) AS Avg_Runtime FROM film;

SELECT c.name, avg(f.length) AS Avg_Runtime
FROM film_category fc JOIN film f ON f.film_id=fc.film_id
JOIN category c ON c.category_id=fc.category_id 
GROUP BY c.name;

SELECT * FROM film WHERE description LIKE '%Robot%';

SELECT count(film_id) AS '2010_Movies' FROM film WHERE release_year='2010';

SELECT f.title, c.name
FROM film_category fc JOIN film f ON f.film_id=fc.film_id
JOIN category c ON c.category_id=fc.category_id 
WHERE c.name='Horror';

SELECT first_name, last_name FROM staff WHERE staff_id='2';

SELECT a.actor_id, a.first_name, a.last_name, f.title FROM film f JOIN film_actor fa ON f.film_id=fa.film_id
JOIN actor a ON a.actor_id=fa.actor_id 
WHERE a.first_name='Fred' AND a.last_name='Costner';

SELECT DISTINCT count(country) FROM country;

SELECT name FROM language GROUP BY name HAVING count(name)=1 ORDER BY name DESC;

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER BY first_name ASC;

SELECT c.name AS Film_Category, COUNT(fc.film_id) Film_Count 
FROM category c JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name HAVING Film_Count ORDER BY Film_Count DESC LIMIT 1;
