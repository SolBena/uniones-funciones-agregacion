--------------Micro desafío - Paso 1: -------------

--Los títulos y el nombre del género de todas las series de la base de datos.
SELECT title, name
FROM series
INNER JOIN genres ON series.genre_id = genres.id

--Listar los títulos de los episodios junto con el nombre y apellido de los actores */

/* SELECT title, first_name, last_name
FROM episodes
INNER JOIN actors ON episodes.id = actors.id */

SELECT episodes.title, first_name, last_name
FROM episodes
INNER JOIN actor_episode ON actor_episode.episode_id = episodes.id
INNER JOIN actors ON actors.id = actor_episode.actor_id 

---------------Micro desafío - Paso 2: ------------------

--Todos los actores o actrices que han trabajado en la saga de la Guerra de las galaxias */

SELECT first_name, last_name
FROM actors
INNER JOIN actor_movie ON actors.id = actor_movie.actor_id
INNER JOIN movies ON movies.id = actor_movie.movie_id
WHERE movies.title LIKE '%galaxias%'

----------------Micro desafío - Paso 3:--------------------

--Listar los títulos de cada película con su género correspondiente. En el caso de que no tenga género, mostraremos una leyenda que diga "no tiene género".

SELECT title, COALESCE(name, "no tiene genero")
FROM movies
LEFT JOIN genres ON movies.genre_id = genres.id

-------------Micro desafío - Paso 4: ------------------

-- Cantidad de días desde su estreno hasta su fin, la columna que mostrará dicha cantidad la renombraremos: “Duración”

SELECT title, DATEDIFF(end_date, release_date) AS 'Duración'
FROM series

---------------Micro desafío - Paso 5:-----------------

--Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 caracteres.

SELECT first_name, last_name
FROM actors
WHERE LENGTH(first_name) >= 6
ORDER BY first_name

--Debemos mostrar la cantidad total de los episodios guardados en la base de datos.

SELECT COUNT(*)
FROM episodes

--Mostrar eltítulo de todas las series y el total de temporadas que tiene cada una de ellas.

SELECT series.title, COUNT(seasons.id) AS 'Cantidad de temporadas'
FROM series
INNER JOIN seasons ON series.id = seasons.serie_id
GROUP BY series.title

--Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor o igual a 3.

SELECT genres.name, COUNT(movies.id)
FROM genres
INNER JOIN movies ON movies.genre_id = genres.id
GROUP BY name
HAVING COUNT(movies.id) >= 3