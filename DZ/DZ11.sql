/*
Практическое задание по теме “Оптимизация запросов”
1) Создайте таблицу logs типа Archive.
Пусть при каждом создании записи в таблицах users, catalogs и products
в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
 */

-- Задание 1. Подготовка.

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
  ('Мария', '1992-08-29'),
  ('Антон', '1990-10-05'),
  ('Максим', '1984-11-12'),
  ('Елена', '1985-05-20'),
  ('Александр', '1988-02-14');

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

 
-- Задание 1. Решение.
/*
Практическое задание по теме “Оптимизация запросов”
1) Создайте таблицу logs типа Archive.
Пусть при каждом создании записи в таблицах users, catalogs и products
в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
 */


DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME,
	table_name VARCHAR(255),
	table_id INT,
	content VARCHAR(255)	
) ENGINE=archive;


-- Триггер для users
DROP TRIGGER IF EXISTS logs_users_add_trigger;
DELIMITER //

CREATE TRIGGER logs_users_add_trigger
AFTER INSERT
ON users FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, table_id, content)
		VALUES (NEW.created_at, 'users', NEW.id, NEW.name);
END
DELIMITER ;

-- Проверка триггера для users
INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05');

SELECT * FROM users;
SELECT * FROM logs; 


-- Триггер для products
DROP TRIGGER IF EXISTS logs_products_add_trigger;
DELIMITER //

CREATE TRIGGER logs_products_add_trigger
AFTER INSERT
ON products FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, table_id, content)
		VALUES (NEW.created_at, 'products', NEW.id, NEW.name);
END
DELIMITER ;

-- Проверка триггера для products
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1);

SELECT * FROM products;
SELECT * FROM logs; 


-- Триггер для catalogs
DROP TRIGGER IF EXISTS logs_catalogs_add_trigger;
DELIMITER //

CREATE TRIGGER logs_catalogs_add_trigger
AFTER INSERT
ON catalogs FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, table_id, content)
		VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END
DELIMITER ;

-- Проверка триггера для catalogs
INSERT INTO catalogs VALUES
  (NULL, 'Видеокамеры');

SELECT * FROM catalogs;
SELECT * FROM logs; 


/*
2) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/
 
-- Задание 2. Решение. 
INSERT INTO users (name, birthday_at)
	SELECT
		fst.name AS name,
		fst.birthday_at AS birthday_at 
	FROM
		users AS fst,
	  	users AS snd,
	  	users AS trd,
	  	users AS frth,
	  	users AS ffth,
	  	users AS sxth
	limit 1000000;

-- Задание 2. Проверка. 
SELECT *
FROM users
ORDER BY id DESC
limit 3

