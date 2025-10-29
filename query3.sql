-- Mendapatkan director, dan berapa genre yang di direct
SELECT directors.first_name, directors.last_name, count(directors_genres.genre) as total_genre
FROM directors
    JOIN directors_genres ON directors.id = directors_genres.director_id
GROUP BY (
        directors.id,
        directors.first_name,
        directors.last_name
    );