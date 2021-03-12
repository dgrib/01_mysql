-- 9. Транзакции, переменные, представления.

/*
1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
 */

-- Подготовка к заданию 1.
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
 
-- SELECT * FROM shop.users;

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Антон', '1990-10-05'),
  ('Максим', '1984-11-12'),
  ('Елена', '1985-05-20'),
  ('Александр', '1988-02-14'),
  ('Дмитрий', '1998-01-12'),
  ('Дарья', '1992-08-29');
 
-- SELECT * FROM sample.users;
 
-- Решение задания 1.
START TRANSACTION;

INSERT INTO sample.users (name, birthday_at, created_at, updated_at)
SELECT name, birthday_at, created_at, updated_at
FROM shop.users
WHERE id = 1;

DELETE FROM shop.users
WHERE id = 1;

COMMIT;
-- SELECT * FROM shop.users;
-- SELECT * FROM sample.users;
-- проверил, транзакция работает. На запущенном в командной строке другом сеансе подключения к sample и shop,
-- там изменения INSERT и DELETE не видно, пока я тут не сделаю COMMIT;

/*
2. Создайте представление, которое выводит название name товарной позиции из таблицы products
и соответствующее название каталога name из таблицы catalogs.
*/

-- Подготовка к заданию 2.
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
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);


 -- Решение задания 2.
USE shop;

CREATE OR REPLACE VIEW prod AS SELECT p.name AS product_name, c.name AS catalog_name
FROM products p
LEFT JOIN catalogs c
ON p.catalog_id = c.id;

SELECT * FROM prod;

/*
3. (по желанию) Пусть имеется таблица с календарным полем created_at.
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2018-08-04', '2018-08-16' и 2018-08-17.
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1,
если дата присутствует в исходном таблице и 0, если она отсутствует.
 */

-- Подготовка к заданию 3.
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
    body TEXT,
    created_at DATETIME DEFAULT NOW()
);

INSERT INTO `messages` VALUES 
	('1','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et.','2018-08-01'),
	('2','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi.','2018-08-04'),
	('3','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit.','2018-08-16'),
	('4','Voluptas omnis enim quia porro debitis facilis eaque ut.','2018-08-17');


-- Решение задания 3. 
DROP PROCEDURE IF EXISTS insert_date;
DELIMITER //
CREATE PROCEDURE insert_date ()
BEGIN
	DECLARE i INT DEFAULT 1;
	DROP TABLE IF EXISTS dates_range;
	CREATE TABLE dates_range (
		date_list DATE);
	
	REPEAT
		SET @new_data = CONCAT('2018-08-', i);
		INSERT INTO dates_range VALUES
			(@new_data);
		SET i = i + 1;
	 UNTIL i >= 32
  END REPEAT;
END//
DELIMITER ;

CALL insert_date();

SELECT dr.date_list AS `date`, IF(m.created_at IS NOT NULL, 1, 0) AS date_exists
FROM dates_range dr
LEFT JOIN messages m 
ON m.created_at = dr.date_list;


/*
4. (по желанию) Пусть имеется любая таблица с календарным полем created_at.
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
 */

-- Подготовка к заданию 4.
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
    body TEXT,
    created_at DATETIME DEFAULT NOW()
);

INSERT INTO `messages` VALUES 
	('1','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et.','2018-08-02'),
	('2','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi.','2021-08-15'),
	('3','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit.','2018-08-16'),
	('4','Voluptas omnis enim quia porro debitis facilis eaque ut.','2018-08-17'),
	('5','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et.','2018-08-05'),
	('6','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi.','2018-08-10'),
	('7','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit.','2018-08-16'),
	('8','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et.','2018-08-08'),
	('9','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi.','2018-08-04'),
	('10','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit.','2020-08-22');

-- Решение задания 4. 

-- просто выборка SELECT не вставлялась в DELETE, пришлось создать представление
CREATE VIEW fresh_five AS
	SELECT id
	FROM messages m 
	ORDER BY m.created_at DESC
	LIMIT 5

-- SELECT * FROM fresh_five
	

DELETE FROM messages 
WHERE id NOT IN (
	SELECT * FROM fresh_five
	)

-- проверка
-- SELECT * FROM messages m ORDER BY created_at DESC;


-- 9. Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)
-- Не делаю.


-- 9. Хранимые процедуры и функции, триггеры.

/*
1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер",
с 00:00 до 6:00 — "Доброй ночи".
*/

DROP FUNCTION IF EXISTS hello;

DELIMITER //
CREATE FUNCTION hello ()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	IF TIME_TO_SEC(NOW()) < TIME_TO_SEC('06:00') THEN
    	RETURN "Доброй ночи";
    ELSEIF TIME_TO_SEC(NOW()) < TIME_TO_SEC('12:00') THEN
    	RETURN "Доброе утро";
    ELSEIF TIME_TO_SEC(NOW()) < TIME_TO_SEC('18:00') THEN
    	RETURN "Добрый день";
    ELSE
    	RETURN "Добрый вечер";
    END IF;
END//
DELIMITER ;


SELECT hello();


/*
2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
Допустимо присутствие обоих полей или одно из них.
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */

-- Подготовка к заданию 2.
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

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);


-- Решение задания 2.
USE shop;
 
DROP TRIGGER IF EXISTS check_null_values;

DELIMITER //

CREATE TRIGGER check_null_values
BEFORE INSERT
ON products FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Сработал ТРИГГЕР! Имя и описание не могут быть одновременно NULL!';
	END IF;
END

DELIMITER ;

-- SELECT * FROM products;

-- Проверка задания 2. Этот запрос выполнится.
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', NULL, 12700.00, 1);

-- Проверка задания 2. Этот запрос не выполнится, срабатывает триггер.
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', NULL, 12700.00, 1),
  (NULL, NULL, 4780.00, 1);

/*
3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
Вызов функции FIBONACCI(10) должен возвращать число 55.
 */

-- Решение задания 3. 1 вариант
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;
 
DROP FUNCTION IF EXISTS `sample`.`fib_number`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `sample`.`fib_number`(num INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE return_fib INT DEFAULT 0;

	WHILE i < num + 1 DO
		SET return_fib = return_fib + i;
		SET i = i + 1;
	END WHILE;

	RETURN return_fib;
END
DELIMITER ;
 
SELECT sample.fib_number(10);


-- Решение задания 3. 2 вариант (без дополнительной переменной)
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

DROP FUNCTION IF EXISTS `sample`.`fib_number`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `sample`.`fib_number`(num INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE return_fib INT DEFAULT 0;

	WHILE num > 0 DO
		SET return_fib = return_fib + num;
		SET num = num - 1;
	END WHILE;

	RETURN return_fib;
END
DELIMITER ;

SELECT fib_number(10);

