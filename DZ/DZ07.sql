-- 7. Тема “Сложные запросы”


/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

USE shop;

SELECT DISTINCT u.id, u.name
FROM users u
JOIN orders o
ON u.id=o.user_id;

-- нужен INNER JOIN запрос
-- DISTINCT стоит так как Геннадий сделал два заказа, и он будет два раза в списке пользователей, а это не нужно

/* 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
 */

USE shop;

SELECT p.id, p.name, c.name
FROM products p
LEFT JOIN catalogs c
ON p.catalog_id=c.id;

-- LEFT JOIN так как не нужны разделы catalogs, которые не соответствуют ни одному товару
-- аналогично заданию на уроке, где надо было вывести список пользоваателей и присоединить к ним имеющиеся сообщения

/* 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
 * Поля from, to и label содержат английские названия городов, поле name — русское.
 * Выведите список рейсов flights с русскими названиями городов.
*/

DROP DATABASE IF EXISTS schedule;
CREATE DATABASE schedule;
USE schedule;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	from_city VARCHAR(50),
	to_city VARCHAR(50)
);

INSERT INTO flights (`id`, `from_city`, `to_city`)
VALUES
	(1, 'moscow', 'omsk'),
	(2, 'novgorod', 'kazan'),
	(3, 'irkutsk', 'moscow'),
	(4, 'omsk', 'irkutsk'),
	(5, 'moscow', 'kazan');
	
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(50),
	name VARCHAR(50)
);

INSERT INTO cities (`label`, `name`)
VALUES
	('moscow', 'Москва'),
	('novgorod', 'Новгород'),
	('irkutsk', 'Иркутск'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
	

-- Решение задания 3.
SELECT 
	CASE f.from_city
		WHEN f.from_city THEN (SELECT c.name FROM cities c WHERE c.label = f.from_city)
	END as 'from',
	CASE f.to_city
		WHEN f.to_city THEN (SELECT c.name FROM cities c WHERE c.label = f.to_city)
	END as 'to'
FROM flights f



