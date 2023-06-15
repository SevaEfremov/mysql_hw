-- 1. Найти автора с самым большим числом книг и вывести его имя

SELECT authors.name 
FROM authors
JOIN authors_books ON authors_id = authors.id
GROUP BY authors.name
ORDER BY COUNT(authors_books.authors_id) DESC
LIMIT 1 
;

-- 2. Вывести пять самых старых книг у которых указан год издания

SELECT books.title 
FROM books
WHERE year > 0
ORDER BY books.year ASC
LIMIT 5
;

-- 3. Вывести общее количество книг на полке в кабинете

SELECT COUNT(*) AS Quanity
FROM books
JOIN shelves ON shelves.id = shelves_id
WHERE shelves.title = "%Полка в кабинете%"
;

-- 4. Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне

SELECT books.title, authors.name, books.year
FROM authors_books
JOIN authors ON authors_id = authors.id
JOIN books ON books_id = books.id
JOIN shelves ON shelves_id = shelves.id
WHERE shelves.title = "Полка в спальне"
;

-- 5. Вывести названия и годы издания книг, написанных автором 'Лев Толстой'

SELECT books.title, books.year
FROM books
JOIN authors_books ON books_id = books.id
JOIN authors ON authors_id = authors.id
WHERE authors.name = "Лев Толстой"
;

-- 6. Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А"

SELECT books.title
FROM books
JOIN authors_books ON books.id = books_id
JOIN authors ON authors.id = authors_id
WHERE authors.name LIKE 'А%'
;

-- 7. Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя»

SELECT books.title, authors.name
FROM books
JOIN authors_books ON books_id = books.id
JOIN authors ON authors_id = authors.id
JOIN shelves ON shelves_id = shelves.id
WHERE shelves.title LIKE '%верхняя%' OR shelves.title LIKE '%нижняя%'
;

-- 8. Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД

UPDATE books
JOIN authors_books ON books_id = books.id
JOIN authors ON authors_id = authors.id
SET books.friends_id = (SELECT friends.id FROM friends WHERE friends.name = 'Иванов Иван')
WHERE books.title = 'Божественная комедия' AND authors.name = 'Данте Алигьери' AND books.id > 0
;

-- 9. Добавить в базу книгу «Краткие ответы на большие вопросы», год издания 2020, автор «Стивен Хокинг», положить ее на полку в кабинете

 INSERT INTO authors (name)
     VALUES('Стивен Хокинг')
     ;
 INSERT INTO books (title, year, shelves_id)
     VALUES('Краткие ответы на большинство вопросов', '2020', 1)
;