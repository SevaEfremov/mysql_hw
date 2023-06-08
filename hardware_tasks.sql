-- 1. Вывести суммарное количество единиц техники на складе
SELECT SUM(hardware.amount) AS 'Кол-во техники на складе'
FROM hardware;

-- 2. Вывести какие товары на складе закончились
SELECT * FROM hardware
WHERE amount = 0;

-- 3. Вывести среднюю цену монитора
SELECT AVG(hardware.price) AS 'Средняя цена монитора'
FROM hardware
WHERE title LIKE 'Монитор%';

-- 4. Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой
SELECT * FROM hardware
WHERE title LIKE 'Клавиатура%'
ORDER BY price ASC;

-- 5. Вывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, результаты отсортировать от максимального количества до минимального
SELECT hardware.tag, COUNT(*) AS 'Кол-во'
FROM hardware
GROUP BY hardware.tag
ORDER BY hardware.tag DESC;

-- 6. Вывести количество товарных позиций со скидками на складе 
SELECT COUNT(*) AS 'по скидке'
FROM hardware
WHERE tag LIKE 'discount';


-- 7. Вывести название и цену самой дорогой новинки
SELECT hardware.title, hardware.price
FROM hardware 
WHERE tag LIKE 'new'
ORDER BY price DESC
LIMIT 1; 

-- 8. Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре
INSERT INTO hardware (title, price, amount, tag)
VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', 54500, 1, 'new');

-- 9. Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2
-- DELETE FROM hardware
-- WHERE hardware.title = 'Очки PS VR 2' AND hardware.id > 0;