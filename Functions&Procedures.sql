--Create a Stored Procedure that will insert a new film into the film table with the following arguments: title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating

CREATE OR REPLACE PROCEDURE insert_new_film(
	title varchar, 
	description varchar, 
	release_year integer, 
	language_id integer, 
	rental_duration integer, 
	rental_rate numeric(4,2), 
	length integer, 
	replacement_cost NUMERIC(5,2), 
	rating mpaa_rating
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;


CALL insert_new_film('New Movie', 'A movie that is new to the film list.', 2024, 1, 7, 9.99, 117, 14, 'R'); 

SELECT * FROM film ORDER BY film_id DESC;




--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

SELECT * 
from film 
ORDER BY film_id DESC;

DROP FUNCTION num_of_films;

CREATE OR REPLACE FUNCTION num_of_films(cat_id integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
	DECLARE cat_count integer;
BEGIN 
	SELECT count(*) INTO cat_count
	FROM film_category 
	WHERE category_id = cat_id;
	RETURN cat_count;
END;
$$;

SELECT num_of_films(15);





