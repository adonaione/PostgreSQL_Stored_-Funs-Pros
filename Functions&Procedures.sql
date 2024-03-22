--Create a Stored Procedure that will insert a new film into the film table with the following arguments: title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating

CREATE OR REPLACE PROCEDURE insert_new_film @title varchar, @description varchar, @release_year integer, @language_id integer, @length integer @replacement_cost integer, @rating varchar
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	WHERE title = @title AND description = @description and release_year=@release_year and language_id=@language_id and rental_duration=@rental_duration and rental_rate=@rental_rate, length=@length and replacement_cost=@replacement_cost and rating=@rating
	);
END;
$$;


EXEC insert_new_film @title = 'New Movie', @description = 'A movie that is new to the film list.', @release_year = '2024', @language_id = '1', @length = '117', @replacement_cost = '14.99', @rating = 'R'; 


--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

CREATE OR REPLACE FUNCTION num_of_films(category_id integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
	DECLARE film_num integer;
BEGIN 
	SELECT count(*)
	FROM film f 
	JOIN film_category fc 
	ON f.film_id = fc.film_id 
	GROUP BY fc.category_id
	WHERE fc.category_id = category_id;
RETURN film_num;
END;
$$;

SELECT num_of_films('11');





