/*
Проект базы данных производственной фирмы.
Требования к курсовому проекту:
1. Составить общее текстовое описание БД и решаемых ею задач;

Проект хранения данных производственной фирмы.
У каждого сотрудника фирмы есть должность.
Проектировщики делают чертежи, потом отправляют чертежи на согласование Технологам, запросом на согласование.
Технолог может подтвердить чертеж или отправить чертеж на доработку обратно проектировщику. 
Чертежи бывают двух типов.
	1 Тип Деталь, на такой чертеж пишется технология (по которой изготавливается деталь) Технологом.
		Технология принадлежит одному Технологу, ссылается на чертеж типа Деталь. У 1 детали могут быть разные технологии.
	2 Тип Сборочная единица, на такой чертеж пишется спецификация, в которую входят составляющие Сборку - детали или даже другие Сборочные единицы.
Проект, это совокупность чертежей (деталей и сборок), относящихся к проекту. Чертеж может входить в несколько проектов.
У проекта есть лидер, один из проектировщиков.

2. минимальное количество таблиц - 10;

Есть.

3. скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами);

Есть.

4. создать ERDiagram для БД;

Приложено к общему архиву Курсовой работы.

5. скрипты наполнения БД данными;

Есть.

*/


DROP DATABASE IF EXISTS factory;
CREATE DATABASE factory;
USE factory;


-- Должности.
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

-- Должности: вставка.
INSERT INTO `positions` (`id`, `name`)
	VALUES
		('1', 'designer'),
		('2', 'technologist'),
		('3', 'accauntant');

	
-- Сотрудники.
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(20),
	lastname VARCHAR(30),
	birthday DATE,
	email VARCHAR(100) UNIQUE,
	phone BIGINT,
	position_id BIGINT UNSIGNED COMMENT 'Должность',
	FOREIGN KEY (position_id) REFERENCES `positions`(id) ON UPDATE CASCADE ON DELETE SET NULL,
	INDEX users_lastname_firstname_idx(lastname, firstname)
);

-- Сотрудники: вставка.
INSERT INTO `employees` VALUES
	(1,'Rylee','Mueller','1990-05-28','yundt.briana@example.org',9495514764,1),
	(2,'Paige','Romaguera','1976-11-01','ian.reichel@example.net',9501749254,2),
	(3,'Shaina','Jones','2001-11-21','marlee.mohr@example.org',9953739325,3),
	(4,'Johanna','Bartoletti','1981-04-12','ila69@example.com',9503726805,1),
	(5,'Maximillia','Predovic','2002-11-28','pat73@example.org',9853894967,2),
	(6,'Vivianne','Hyatt','1976-03-15','river50@example.com',9836532499,3),
	(7,'Americo','Lind','1987-05-18','monahan.dorian@example.com',9974470440,1),
	(8,'Shyanne','Abernathy','1975-02-15','oschroeder@example.org',9790197979,2),
	(9,'Jess','Berge','1995-04-17','gorczany.therese@example.org',9178409066,3),
	(10,'Lavina','Lockman','1970-09-27','melyna.eichmann@example.net',9020362004,1),
	(11,'Lucio','Bartell','1976-04-22','aferry@example.com',9385287162,2),
	(12,'Mozelle','Price','1973-12-18','qorn@example.org',9533509543,3),
	(13,'Chad','Langworth','1996-09-08','sydni12@example.net',9287515504,1),
	(14,'Kip','Ullrich','2000-11-19','jkirlin@example.net',9321533091,2),
	(15,'Christophe','Adams','1972-08-20','wiza.rollin@example.org',9302843091,3),
	(16,'Grady','McLaughlin','1995-12-23','vmertz@example.org',9585587609,1),
	(17,'Gertrude','Dibbert','1984-06-01','hheathcote@example.net',9304320116,2),
	(18,'Hilda','Stark','1978-08-11','zmarquardt@example.org',9127542019,3),
	(19,'Alvina','Grant','1998-07-29','mlegros@example.net',9922224678,1),
	(20,'Jaylin','Jast','2002-05-26','sprosacco@example.com',9945005603,2),
	(21,'Donny','Waters','1997-10-16','jaylin68@example.com',9801450707,3),
	(22,'Keely','Lind','1975-10-01','bernier.jovany@example.net',9276350263,1),
	(23,'Lera','Rosenbaum','1989-08-04','effie.morissette@example.net',9174585760,2),
	(24,'Dortha','Dibbert','1987-12-13','kris.gavin@example.org',9436008798,3),
	(25,'Julian','Hahn','1996-10-08','qhickle@example.org',9870761806,1),
	(26,'Angelica','Brown','1995-11-21','elliot45@example.com',9262160136,2),
	(27,'Wilfred','Grant','1983-04-17','dorris.hamill@example.com',9547486173,3),
	(28,'Theresia','Rice','1982-03-07','katherine29@example.org',9194510720,1),
	(29,'Jaydon','Jacobi','1973-05-24','schimmel.wilton@example.com',9829627587,2),
	(30,'Lolita','Ullrich','1994-04-09','fhilpert@example.org',9143191822,3);


-- Типы чертежей. Индексы не делаю - замедлят работу.
DROP TABLE IF EXISTS drawing_types;
CREATE TABLE drawing_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

-- Типы чертежей: вставка (деталь, сборочный чертеж).
INSERT INTO drawing_types (`id`, `name`)
	VALUES
		('1', 'detail'),
		('2', 'assembly');


-- Чертежи. У чертежа только один проектировщик. Чертеж входит в несколько проектов.
DROP TABLE IF EXISTS drawings;
CREATE TABLE drawings (
	id SERIAL PRIMARY KEY,
	drawing_code VARCHAR(50) UNIQUE COMMENT 'Шифр чертежа',
	drawing_name VARCHAR(50) COMMENT 'Наименование чертежа',
	employee_id BIGINT UNSIGNED,
	drawing_type_id BIGINT UNSIGNED, -- тип чертежа
	created_at DATETIME DEFAULT NOW(), -- дата создания чертежа
	FOREIGN KEY (employee_id) REFERENCES employees(id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (drawing_type_id) REFERENCES drawing_types(id) ON UPDATE CASCADE ON DELETE SET NULL,
	INDEX drawing_name_idx(drawing_name)
);

-- Чертежи: вставка.
INSERT INTO `drawings` VALUES
	(1,'FLV-01.000','Клапан',1,2,'2015-02-21 18:08:31'),
	(2,'FLV-01.001','Корпус',1,1,'2015-12-08 20:25:42'),
	(3,'FLV-01.002','Втулка',1,1,'2016-08-06 17:32:33'),
	(4,'FLV-01.003','Кольцо упорное',1,1,'2011-01-19 13:23:38'),
	(5,'FLV-01.004','Пружина',1,1,'2015-02-16 08:33:47'),
	
	(6,'DV-03.000','Двигатель',7,2,'2019-03-09 18:37:24'),
	(7,'DV-03.001','Переводник ловильный',7,1,'2018-04-28 09:27:51'),
	(8,'DV-03.002','Колпак',7,1,'2018-12-19 11:07:34'),
	(9,'DV-03.100','Секция шпиндельная',10,2,'2020-03-28 19:43:47'),
	(10,'DV-03.101','Вал',10,1,'2019-02-15 16:28:00'),
	(11,'DV-03.102','Подшипник',10,1,'2019-06-14 10:09:15'),
	(12,'DV-03.200','Секция двигательная',13,2,'2020-03-16 11:02:02'),
	(13,'DV-03.201','Ротор',13,1,'2019-09-14 06:50:10'),
	(14,'DV-03.202','Статор',13,1,'2018-10-25 23:54:25'),
	(15,'DV-03.203','Гайка',13,1,'2019-06-25 13:26:10'),
	
	(16,'SR-02.000','Спайдер',22,2,'2019-09-13 12:16:05'),
	(17,'SR-02.001','Захват',22,1,'2020-12-08 02:16:16'),
	(18,'SR-02.002','Кольцо',22,1,'2019-07-11 08:33:39'),
	(19,'SR-02.003','Корпус',22,1,'2019-01-01 17:01:23'),
	(20,'SR-02.004','Втулка',28,1,'2020-09-01 00:44:27');


-- Запрос на согласование чертежа.
DROP TABLE IF EXISTS draw_agreement_requests;
CREATE TABLE draw_agreement_requests (
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	drawings_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    `status` ENUM('empty', 'requested', 'approved', 'declined') DEFAULT 'empty',
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME on update NOW(),
	
    PRIMARY KEY (initiator_user_id, drawings_id), -- проектировщик может послать на согласование каждый чертеж только 1 раз
    FOREIGN KEY (initiator_user_id) REFERENCES employees(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (target_user_id) REFERENCES employees(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (drawings_id) REFERENCES drawings(id) ON UPDATE CASCADE ON DELETE CASCADE
    -- запрос на согласование удалится при удалении пользователя или чертежа.
);

-- Запрос на согласование чертежа: вставка.
INSERT INTO `draw_agreement_requests` VALUES 
	(1,1,5,'approved','1977-07-13 12:56:24','2020-02-01 04:46:59'),
	(1,2,5,'empty','2007-08-09 12:34:56','2020-05-21 16:26:39'),
	(1,3,5,'declined','1979-02-03 08:44:31','2020-08-10 06:19:47'),
	(1,4,5,'approved','2016-01-15 01:12:27','2020-02-02 13:53:32'),
	(1,5,8,'approved','2020-05-12 01:21:09','2020-12-11 04:12:10'),
	(7,6,8,'requested','2010-11-09 11:09:25','2020-09-13 00:23:43'),
	(7,7,8,'declined','2013-05-25 03:59:26','2020-05-18 16:45:56'),
	(7,8,8,'approved','2017-07-17 16:40:56','2020-04-30 15:54:37'),
	(10,9,14,'requested','1997-02-12 22:42:37','2020-04-06 08:20:44'),
	(10,10,14,'approved','1997-01-20 12:11:11','2020-05-06 14:54:02'),
	(10,11,14,'empty','1987-04-21 14:58:57','2020-08-22 00:41:05'),
	(13,12,20,'approved','1980-11-08 19:12:44','2020-12-01 11:21:01'),
	(13,13,20,'requested','1986-01-03 23:56:53','2020-11-19 13:09:17'),
	(13,14,20,'requested','1993-05-22 23:49:13','2020-07-11 18:57:10'),
	(13,15,26,'empty','2021-01-05 21:01:21','2020-01-09 03:49:18'),
	(22,16,26,'approved','1998-07-09 10:47:59','2020-04-06 15:26:12'),
	(22,17,26,'approved','2007-12-06 23:31:01','2020-12-30 21:55:38'),
	(22,18,29,'approved','2018-06-15 22:42:17','2020-06-22 03:09:31'),
	(22,19,29,'empty','1993-09-17 03:06:29','2020-01-21 06:43:38'),
	(22,20,29,'empty','1975-03-13 11:48:54','2020-01-23 21:42:07');


-- Проекты.
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE, -- название проекта
	created_at DATETIME DEFAULT NOW(),
	leader_id BIGINT UNSIGNED,
	FOREIGN KEY (leader_id) REFERENCES employees(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Проекты: вставка.
INSERT INTO `projects` VALUES 
	(1,'Flow Valve','2016-05-13 11:07:13',1),
	(2,'DriveMotor','2017-01-06 05:28:40',2),
	(3,'Spider','2018-10-24 12:42:35',3),
	(4,'Bypass Valve','2018-11-22 12:42:35',3);


-- Связки чертеж-проект. Связь М-М
-- В один проект входит несколько чертежей.
-- Один чертеж может входить в несколько проектов.
DROP TABLE IF EXISTS drawing_project;
CREATE TABLE drawing_project (
	drawing_id BIGINT UNSIGNED NOT NULL,
	project_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	PRIMARY KEY (drawing_id, project_id),
	FOREIGN KEY (drawing_id) REFERENCES drawings(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE
	-- при удалении чертежа или проекта удаляется связка чертеж-проект
);

-- Связки чертеж-проект: вставка.
INSERT INTO `drawing_project` VALUES 
	(1,1,'2020-01-01 06:46:42'),
	(2,1,'2020-06-18 19:40:18'),
	(3,1,'2020-04-13 14:38:58'),
	(4,1,'2020-03-23 11:09:42'),
	(5,1,'2020-05-07 20:46:19'),
	
	(6,2,'2020-04-15 06:44:09'),
	(7,2,'2020-03-16 05:27:51'),
	(8,2,'2020-03-15 16:40:15'),
	(9,2,'2020-08-20 07:51:11'),
	(10,2,'2020-10-07 05:53:48'),
	(11,2,'2020-03-25 06:31:16'),
	(12,2,'2020-04-27 17:20:46'),
	(13,2,'2020-10-06 21:51:40'),
	(14,2,'2020-08-08 12:06:50'),
	(15,2,'2020-05-29 04:15:24'),
	
	(16,3,'2020-11-05 08:42:54'),
	(17,3,'2020-06-20 05:20:36'),
	(18,3,'2020-05-09 01:50:29'),
	(19,3,'2020-12-05 21:39:10'),
	(20,3,'2020-07-16 03:09:28');


-- Технологии. Технология принадлежит одному Технологу, ссылается на чертеж типа Деталь. У 1 детали могут быть разные технологии.
DROP TABLE IF EXISTS technologies;
CREATE TABLE technologies (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	employee_id BIGINT UNSIGNED,
	drawing_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (employee_id) REFERENCES employees(id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (drawing_id) REFERENCES drawings(id) ON UPDATE CASCADE ON DELETE CASCADE -- при удалении чертежа, удаляем технологию
);

-- Технологии: вставка.
INSERT INTO `technologies`
	VALUES
		(1,'FLV-01.001T',2,2,'2020-11-09 12:34:51'),
		(2,'FLV-01.002T',2,3,'2020-08-03 06:37:12'),
		(3,'FLV-01.003T',2,4,'2020-05-12 14:06:08'),
		(4,'FLV-01.004T',5,5,'2020-04-28 21:11:02'),
		(5,'FLV-01.001T1',5,2,'2020-01-25 09:40:46'),
		
		(6,'DV-03.001T',5,7,'2020-06-30 13:51:36'),
		(7,'DV-03.002T',8,8,'2020-11-05 21:09:48'),
		(8,'DV-03.001T1',8,7,'2020-01-21 11:05:29'),
		(9,'DV-03.001T2',8,7,'2020-06-04 07:26:34'),
		
		(10,'DV-03.102T',8,11,'2020-01-24 19:30:20'),
		(11,'DV-03.102T1',14,11,'2020-09-04 02:36:51'),
		
		(12,'DV-03.201T',14,13,'2020-09-08 01:50:34'),
		(13,'DV-03.201T1',14,13,'2020-12-19 10:44:27'),
		(14,'DV-03.202T',14,14,'2020-08-11 19:22:13'),
		(15,'DV-03.203T',20,15,'2020-11-12 04:59:52'),
		(16,'DV-03.201T2',20,13,'2020-03-12 08:07:17'),
		
		(17,'SR-02.001T',20,17,'2020-07-13 11:10:35'),
		(18,'SR-02.002T',20,18,'2020-07-28 11:45:32'),
		(19,'SR-02.003T',20,19,'2020-03-06 22:51:29'),
		(20,'SR-02.004T',20,20,'2020-11-13 04:37:59');


-- Спецификации. Принадлежит одному проектировщику. 
DROP TABLE IF EXISTS specifications;
CREATE TABLE specifications (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	employee_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (employee_id) REFERENCES employees(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Спецификации: вставка.
INSERT INTO `specifications`
	VALUES
		(1,'FLV-01.000S',1,'2020-10-02 00:18:46'),
		(2,'DV-03.000S',7,'1976-08-04 00:21:00'),
		(3,'DV-03.100S',10,'2001-12-13 00:25:38'),
		(4,'DV-03.200S',13,'1987-11-14 11:21:47'),
		(5,'SR-02.000S',22,'1989-09-19 05:49:28'),
		
		(6,'FLV-01.000S1',1,'2001-12-13 00:25:38'),
		(7,'FLV-01.000S2',1,'1987-11-14 11:21:47'),
		(8,'SR-02.000S1',22,'1989-09-19 05:49:28');


-- Связка спецификация-чертеж.
-- У 1 сборочной единицы (чертежа) могут быть несколько спецификаций. В спецификацию входят чертежи деталей и чертежи сборочных единиц. 
DROP TABLE IF EXISTS spec_drawing;
CREATE TABLE spec_drawing (
	id SERIAL PRIMARY KEY,
	spec_id BIGINT UNSIGNED NOT NULL,
	drawing_id BIGINT UNSIGNED,
	FOREIGN KEY (spec_id) REFERENCES specifications(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (drawing_id) REFERENCES drawings(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Связка спецификация-чертеж: вставка.
INSERT INTO `spec_drawing`
	VALUES
		(1,1,2),(2,1,3),(3,1,4),(4,1,5), -- FLV-01.000S
	
		(5,2,7),(6,2,8),(7,2,9),(8,2,12), -- DV-03.000S
	
		(9,3,10),(10,3,11), -- DV-03.100S
	
		(11,4,13),(12,4,14),(13,4,15), -- DV-03.200S
	
		(14,5,17),(15,5,18),(16,5,19),(17,5,20), -- SR-02.000S
	
		(18,6,2),(19,6,20),(20,6,4),(21,6,5), -- FLV-01.000S1
		
		(22,7,2),(23,7,3),(24,7,18),(25,7,5), -- FLV-01.000S1
		
		(26,8,17),(27,8,18),(28,8,19),(29,8,3) -- SR-02.000S
		;
		
	
