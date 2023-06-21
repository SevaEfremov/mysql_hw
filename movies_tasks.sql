-- 1. Вывести сколько фильмов сняла кинокомпания Universal Pictures

SELECT COUNT(*) AS UniversalMovies
FROM movies
JOIN companies ON companies_id = companies.id
WHERE companies.title = 'Universal Pictures'
;

-- 2. Вывести сколько всего фильмов было снято режиссером Фрэнсисом Фордом Копполой

SELECT COUNT(*) AS ФренсисMovies
FROM movies
JOIN directors ON directors_id = directors.id
WHERE directors.full_name = 'Фрэнсис Форд Коппола'
;

-- 3. Вывести количество снятых фильмов за последние 20 лет

SELECT COUNT(*) AS Last20YearsMovies
FROM movies
WHERE movies.year > '2003'
;

-- 4. Вывести все жанры фильмов в которых снимал Стивен Спилберг в течении всей своей карьеры

SELECT COUNT(*) AS AllGenresStive
FROM genres
JOIN movies ON genres_id = genres.id
JOIN directors ON directors_id = directors.id
WHERE directors.full_name = 'Стивен Спилберг'
;
-- НЕ УВЕРЕН!!!

-- 5. Вывести названия, жанры и режиссеров 5 самых дорогих фильмов

SELECT movies.title, genres.title, directors.full_name
FROM movies
JOIN genres ON genres_id = genres.id
JOIN directors ON directors_id = directors.id
ORDER BY budget DESC
LIMIT 5
;

-- 6. Вывести имя режиссера с самым большим количеством фильмов

SELECT directors.full_name AS MostHaviousDirector -- , COUNT(movies.id) AS AllMovies
FROM movies
JOIN directors ON directors_id = directors.id
GROUP BY directors.id
ORDER BY COUNT(movies.id) DESC
LIMIT 1
;

-- 7. Вывести названия и жанры фильмов, снятые самой большой кинокомпанией (по сумме всех бюджетов фильмов)

SELECT movies.title AS "Название фильма", genres.title AS "Жанр фильма"
FROM movies
JOIN genres ON genres_id = genres.id
WHERE companies_id = ( 
	SELECT companies.id 
    FROM companies
    JOIN movies ON movies.companies_id = companies.id
    GROUP BY companies.id
    ORDER BY SUM(movies.budget) DESC
    LIMIT 1
);

-- 8. Вывести средний бюджет фильмов, снятых кинокомпанией Warner Bros.

SELECT AVG(movies.budget)
FROM movies
JOIN companies ON movies.companies_id = companies.id
WHERE companies.title = 'Warner Bros.'
;

-- 9. Вывести количество фильмов каждого жанра и средний бюджет по жанру

SELECT COUNT(movies.title) AS QuanityMovies, AVG(movies.budget) AS AvgBuget_Genre
FROM movies
GROUP BY genres_id
;

-- 10. Найти и удалить комедию "Дикие истории" 2014-го года

DELETE FROM movies WHERE movies.title = 'Дикие истории' AND movies.year = 2014
;
DELETE FROM movies WHERE id IN (208)
;
