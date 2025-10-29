-- Mendapatkan director, dan berapa genre yang di direct
SELECT directors.first_name, directors.last_name, COUNT(
        DISTINCT directors_genres.genre
    ) as total_genre
FROM directors
    JOIN directors_genres ON directors.id = directors_genres.director_id
GROUP BY
    directors.id,
    directors.first_name,
    directors.last_name;

-- Mendapatkan actors yang memiliki roles lebih dari 5
SELECT actors.first_name, actors.last_name, COUNT(roles.actor_id) AS total_roles
FROM actors
    JOIN roles ON actors.id = roles.actor_id
GROUP BY
    actors.id,
    actors.first_name,
    actors.last_name
HAVING
    COUNT(roles.actor_id) > 5;