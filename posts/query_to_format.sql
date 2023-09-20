SELECT a.actor_id, a.first_name, a.last_name, f.title, f.description
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id;