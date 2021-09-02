
-- Consultas
-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
--    Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT ci.city_id, ci.city, cu.first_name, cu.last_name, cu.email, ad.address FROM customer cu, city ci, address ad WHERE ci.city_id=312 AND ci.city_id=ad.city_id AND ad.address_id=cu.address_id;

-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
--    Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
SELECT fi.film_id, fi.title, fi.description, fi.release_year, fi.rating, fi.special_features, ca.name 
FROM film fi, category ca, film_category fc 
WHERE fi.film_id = fc.film_id AND fc.category_id=ca.category_id AND ca.name='Comedy';

-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5?
--    Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.
SELECT ac.actor_id, CONCAT(ac.first_name, " ", ac.last_name) as actor_name, fi.film_id, fi.title, fi.description, fi.release_year
FROM actor ac, film fi, film_actor fa
WHERE fi.film_id=fa.film_id AND fa.actor_id=ac.actor_id AND ac.actor_id=5; 

-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)?
--    Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT st.store_id, ci.city_id, cu.first_name, cu.last_name, cu.email, ad.address
FROM store st, customer cu, city ci, address ad
WHERE st.store_id=cu.store_id AND cu.address_id=ad.address_id AND ad.city_id=ci.city_id AND st.store_id=1 AND (ci.city_id=1 OR ci.city_id=42 OR ci.city_id=312 OR ci.city_id=459); 

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? 
--    Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
--    Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
SELECT fi.title, fi.description, fi.release_year, fi.rating, fi.special_features
FROM actor ac, film fi, film_actor fa
WHERE fi.film_id=fa.film_id AND fa.actor_id=ac.actor_id AND ac.actor_id=15 AND fi.rating='G' AND fi.special_features LIKE '%Behind the scenes%'; 

-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369?
--    Su consulta debe devolver film_id, title, actor_id y actor_name.
SELECT fi.film_id, fi.title, ac.actor_id, CONCAT(ac.first_name, " ", ac.last_name) as actor_name
FROM actor ac, film fi, film_actor fa
WHERE fi.film_id=fa.film_id AND fa.actor_id=ac.actor_id AND fi.film_id=369; 

-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
--    Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).
SELECT fi.film_id, fi.title, fi.description, fi.release_year, fi.rating, fi.special_features, ca.name, fi.rental_rate
FROM film fi, category ca, film_category fc
WHERE fi.film_id=fc.film_id AND fc.category_id=ca.category_id AND fi.rental_rate=2.99 AND ca.name="Drama"; 

-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
--    Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.
SELECT ac.actor_id, CONCAT(ac.first_name, " ", ac.last_name) as actor_name, fi.film_id, fi.title, fi.description, fi.release_year, fi.rating, fi.special_features, ca.name
FROM actor ac, film fi, film_actor fa, category ca, film_category fc
WHERE fi.film_id=fa.film_id AND fa.actor_id=ac.actor_id AND fi.film_id=fc.film_id AND fc.category_id=ca.category_id  AND ac.first_name='SANDRA' AND ac.last_name='KILMER'AND ca.name='Action'; 