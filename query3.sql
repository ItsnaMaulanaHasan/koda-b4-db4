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

-- Mendapatkan directors paling produktif sepanjang masa
SELECT directors.first_name, directors.last_name, COUNT(movies_directors.director_id)
FROM directors
    JOIN movies_directors ON directors.id = movies_directors.director_id
GROUP BY
    directors.id,
    directors.first_name,
    directors.last_name
HAVING
    COUNT(movies_directors.director_id) = (
        SELECT MAX(movie_count)
        FROM (
                SELECT COUNT(movies_directors.movie_id) AS movie_count
                FROM movies_directors
                GROUP BY
                    movies_directors.director_id
            )
    );

-- Mendapatkan tahun tersibuk sepanjang masa
SELECT year, COUNT(year) AS total_movie
FROM movies
GROUP BY
    year
HAVING
    COUNT(year) = (
        SELECT MAX(count_year)
        FROM (
                SELECT COUNT(year) AS count_year
                FROM movies
                GROUP BY
                    year
            )
    );

-- Mendapatkan movies dengan genres yang dibuatkan menjadi 1 kolom (value dipisahkan dengan koma), menggunakan string_agg
SELECT
    movies.name AS movie_name,
    string_agg(
        movies_genres.genre,
        ', '
        ORDER BY movies.name
    ) AS movie_with_genre
FROM movies
    JOIN movies_genres ON movies.id = movies_genres.movie_id
GROUP BY
    movies.name