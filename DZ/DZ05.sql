-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

/*
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
	created_at DATETIME,
    updated_at DATETIME
);

INSERT users (firstname, lastname, email, phone, created_at, updated_at)
VALUES
  	('Akeem', 'Green', 'broderick77@example.com', 9528861489, '2010-02-07 23:58:52', '2020-02-07 23:58:52'),
	('Henriette', 'Dibbert', 'kheidenreich@example.com', 9528861467, '2010-02-07 23:58:52', '2015-02-07 23:58:52'),
	('Jarod', 'Yost', 'roderick.keebler@example.net', 9268948368, NULL, NULL),
	('Gudrun', 'Anderson', 'farrell.hermann@example.org', 9266861205, '2005-02-07 23:58:52', '2018-02-07 23:58:52'),
	('Katelin', 'Mante', 'camron.hessel@example.net', 9967282422, NULL, NULL)
;


-- Решение задания 1
UPDATE users
SET
	created_at = NOW()
WHERE
	created_at IS NULL
;

UPDATE users
SET
	updated_at = NOW()
WHERE
	updated_at IS NULL
;

/*
2. Таблица users была неудачно спроектирована.
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10.
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
	created_at VARCHAR(100),
    updated_at VARCHAR(100)
);


INSERT users (firstname, lastname, email, phone, created_at, updated_at)
VALUES
  	('Akeem', 'Green', 'broderick77@example.com', 9528861489, '20.10.2017 8:10', '20.09.2015 8:10'),
	('Henriette', 'Dibbert', 'kheidenreich@example.com', 9528861467, '10.09.2009 8:10', '01.12.2015 8:10'),
	('Jarod', 'Yost', 'roderick.keebler@example.net', 9268948368, '20.05.2001 8:10', '15.12.2004 8:10'),
	('Gudrun', 'Anderson', 'farrell.hermann@example.org', 9266861205, '03.05.2005 8:10', '12.03.2008 8:10'),
	('Katelin', 'Mante', 'camron.hessel@example.net', 9967282422, '25.08.2011 8:10', '23.05.2016 8:10')
;


-- Решение задания 2
-- исправляю данные, для дальнейшего преобразования формата полей в datetime
UPDATE users
SET
	created_at = STR_TO_DATE(created_at,'%d.%m.%Y %h:%i'),
	updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %h:%i')
;

ALTER TABLE users
MODIFY COLUMN created_at DATETIME;

ALTER TABLE users
MODIFY COLUMN updated_at DATETIME;


/*
3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
0, если товар закончился и выше нуля, если на складе имеются запасы.
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Товарные позиции';


DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO `products` VALUES
	(1, 'aut','Et explicabo vitae dolorem assumenda eum temporibus. Corporis in pariatur et nulla. Impedit unde rerum ut sit.',47.84,'2008-02-08 21:46:34','1976-01-15 04:46:20'),
	(2,'dicta','Repudiandae beatae dignissimos et sed veritatis sed omnis. Tenetur error eius et error tenetur. Sit sint est ea omnis autem molestias et.',17106.85,'2007-06-11 12:29:47','1999-03-23 15:56:08'),
	(3,'qui','Officiis sunt totam enim facere. Minus ducimus nisi et. Libero autem aliquid et laudantium non sint sapiente ipsam.',32585916.26,'2002-04-28 15:37:51','2012-03-21 02:30:46'),
	(4,'minus','Dolores veritatis vel sequi praesentium id. Non deleniti sint maxime quisquam cupiditate inventore iste corporis. Et id nihil fugiat odit non consequatur rerum. Quam eos tempore blanditiis rem.',29277768.90,'2004-08-02 10:03:59','1998-08-22 12:52:35'),
	(5,'cumque','Quis rerum incidunt aut nemo. Aut pariatur voluptas veniam corporis dolorem consectetur. Et eaque maiores cum quis. Voluptas aperiam quibusdam repellendus laboriosam veniam repellat.',4740551.30,'1977-12-06 12:17:31','2004-07-18 04:38:53'),
	(6,'officia','Harum deleniti ea qui. Sed commodi magni ex nulla id. Doloribus odit rerum voluptatem quis. Culpa dolor culpa facilis quis consectetur ipsam.',0.00,'2008-05-01 15:08:21','1973-11-01 22:59:59')
;

INSERT INTO `storehouses` VALUES
	(1,'quia','2002-04-11 14:51:53','1982-05-23 01:39:57'),
	(2,'deserunt','2014-04-26 14:29:10','1975-03-11 16:57:16'),
	(3,'officiis','1988-11-02 22:17:42','2010-05-14 17:41:54'),
	(4,'dolor','2013-08-24 04:27:51','1995-08-22 09:06:38'),
	(5,'sit','2004-09-19 16:00:41','2006-03-18 14:37:39')
;

INSERT INTO `storehouses_products` VALUES
	(1,1,1,0,'1970-05-07 11:42:58','2015-08-03 21:04:09'),
	(2,2,2,22,'1991-01-25 03:58:00','1970-02-04 09:21:27'),
	(3,3,3,15,'1975-01-17 20:36:13','2014-01-31 19:37:09'),
	(4,4,4,2237526,'2004-07-13 09:46:41','1998-01-11 20:08:21'),
	(5,5,5,39846,'1996-11-18 11:46:36','1995-04-27 20:28:31'),
	(6,1,6,261,'2016-06-04 07:47:51','2012-04-18 06:00:26'),
	(7,2,1,35351964,'1973-07-06 22:56:05','1998-09-12 23:17:44'),
	(8,3,2,132,'1979-11-26 07:46:56','2010-02-22 21:50:13'),
	(9,4,3,0,'1970-05-12 18:34:11','2010-06-07 11:16:35'),
	(10,5,4,532879039,'1991-01-04 02:49:02','2000-09-11 03:00:41')
;


-- Решение задания 3
SELECT value FROM storehouses_products ORDER BY value = 0, value ASC;

-- решение из видео
SELECT id, value, IF(value > 0, 0, 1) AS sort FROM storehouses_products ORDER BY value; -- показ
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value; -- решение, сортировка по двум полям 


/*
 * 4. Из таблицы users необходимо извлечь пользователей,
 * родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)
 */

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at VARCHAR(100) COMMENT 'Дата рождения'
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-may-05'),
  ('Наталья', '1984-september-12'),
  ('Александр', '1985-june-20'),
  ('Сергей', '1988-august-14'),
  ('Иван', '1998-january-12'),
  ('Мария', '1992-august-29');
  

-- Решение задания 4
SELECT name, birthday_at FROM users
WHERE birthday_at LIKE '%may%' OR birthday_at LIKE '%august%';


-- решение из видео
SELECT name FROM users WHERE date_format(birthday_at, '%M') IN ('may', 'august'); 

/*
 * 5. Из таблицы catalogs извлекаются записи при помощи запроса.
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
 */

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    birthday_at DATETIME
);

INSERT users (firstname, lastname, email, phone, birthday_at)
VALUES
  	('Akeem', 'Green', 'broderick77@example.com', 9528861489, '1985-10-20'),
	('Henriette', 'Dibbert', 'kheidenreich@example.com', 9528861467, '1975-12-01'),
	('Jarod', 'Yost', 'roderick.keebler@example.net', 9268948368, '2001-05-16'),
	('Gudrun', 'Anderson', 'farrell.hermann@example.org', 9266861205, '1996-03-18'),
	('Katelin', 'Mante', 'camron.hessel@example.net', 9967282422, '1979-01-01')
;


-- Решение задания 5
-- Сделал не catalogs, но я посчитал, что смысл задания тот же
-- способ 1
SELECT * FROM users WHERE id IN (5, 1, 2)
ORDER BY
    CASE id
        WHEN 5 THEN 1
        WHEN 1 THEN 2
        WHEN 2 THEN 3
    END ASC;

   -- способ 2
SELECT * FROM users WHERE id IN (5, 1, 2)
ORDER BY
  FIELD(`id`, "5, 1, 2") DESC;
   
-- решение из видео
SELECT FIELD(0, 5, 1, 2) -- функция сравнивает первый аргумент со всеми остальными, возвращает 0 если агрумент не входит в данный список
-- если агрумент входит в список то возвращает его позицию в списке SELECT FIELD(2, 5, 1, 2) вернет 3
-- эта функция позволит нам пронумеровать строки результирующей таблицы
 SELECT id, name, FIELD(id, 5, 1, 2) AS pos FROM catalogs WHERE id IN (5, 1, 2);
-- в столбзе Pos задается порядок 5 элемент помещается первым, 1 вторым, 2 третим
-- теперь сортируем таблицу по этому вычисляемому полю
 SELECT * FROM users WHERE id IN (5, 1, 2)
ORDER BY
  FIELD(`id`, "5, 1, 2") DESC;
 
 
 
-- Практическое задание теме «Агрегация данных»

/*
1. Подсчитайте средний возраст пользователей в таблице users.
 */

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    birthday_at DATETIME
);


INSERT users (firstname, lastname, email, phone, birthday_at)
VALUES
  	('Akeem', 'Green', 'broderick77@example.com', 9528861489, '1985-10-20'),
	('Henriette', 'Dibbert', 'kheidenreich@example.com', 9528861467, '1975-12-01'),
	('Jarod', 'Yost', 'roderick.keebler@example.net', 9268948368, '2001-05-16'),
	('Gudrun', 'Anderson', 'farrell.hermann@example.org', 9266861205, '1996-03-18'),
	('Katelin', 'Mante', 'camron.hessel@example.net', 9967282422, '1979-01-01')
;


-- Решение задания 1

-- способ 1
SELECT
	FLOOR(AVG(((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25))) AS Average_age
FROM users;

-- способ 2
SELECT
	AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS Average_age
FROM users;



/*
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    birthday_at DATETIME
);

INSERT INTO `users` VALUES
	(1,'Francisca','Bahringer','shamill@example.org',395320,'1989-06-22 02:06:45'),
	(2,'Fred','Johnson','quinten.walter@example.org',0,'1985-06-06 17:27:43'),
	(3,'Reva','Fay','roxanne.glover@example.net',1,'2012-07-22 07:37:30'),
	(4,'Margaretta','Hagenes','josie32@example.org',1,'2019-08-09 21:18:34'),
	(5,'Eleanore','Conn','braun.demetris@example.com',471785,'1979-09-17 04:33:34'),
	(6,'Katelyn','Aufderhar','wolff.lulu@example.net',1,'2005-03-28 12:28:04'),
	(7,'Brice','Ward','ryan69@example.org',1,'1980-03-07 22:06:31'),
	(8,'Beulah','Ortiz','jenkins.salvatore@example.net',1,'1976-03-13 22:19:00'),
	(9,'Hassan','Gaylord','jadyn.littel@example.org',918652,'1973-03-31 20:57:48'),
	(10,'Mitchell','Lesch','terrence.hayes@example.org',180408,'1986-03-05 08:25:36'),
	(11,'Johanna','Weissnat','lueilwitz.emmanuelle@example.net',191203,'2011-11-16 04:17:22'),
	(12,'Yvonne','Barrows','amy37@example.net',952162,'2007-01-30 15:50:48'),
	(13,'Liam','Dicki','bert55@example.org',316,'1974-06-05 11:15:33'),
	(14,'Leta','Yost','cschultz@example.org',1,'2006-11-10 15:18:23'),
	(15,'Wallace','Baumbach','kamron78@example.net',489141,'1979-06-14 16:06:44');


-- Решение задания 2
SELECT
	COUNT(*) AS amount_of_birthdays,
	DAYNAME(CONCAT(DATE_FORMAT(NOW(), '%Y'), '-', DATE_FORMAT(birthday_at, '%m-%d'))) AS day_name
FROM
	users
GROUP BY
	day_name
ORDER BY
	amount_of_birthdays DESC;

-- решение из видео
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
	COUNT(*) AS total
	FROM users
	GROUP BY `day`
	ORDER BY total DESC;

/*
3. Подсчитайте произведение чисел в столбце таблицы.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    value BIGINT
);

INSERT INTO `users` VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5);

-- Решение задания 3
SELECT EXP(SUM(LN(value))) AS multiplication FROM users;
