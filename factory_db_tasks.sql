/*	
6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);
*/
-- 	6.1. Выбрать первых 2 проектировщиков, выпустивших больше всех чертежей.
	
-- Не нужно идти в профессии, так как чертежи делают только проектировщики.

USE factory;

SELECT 
	COUNT(e.id) AS drawings_cnt,
	CONCAT(e.firstname , ' ', e.lastname) as name
FROM employees e 
JOIN drawings d 
ON e.id = d.employee_id 
GROUP BY e.id
ORDER BY drawings_cnt DESC
LIMIT 2;

-- 6.2. Найти проектировщиков кто сделал хотябы 1 чертеж типа 'detail'.

USE factory;

SELECT id, firstname, lastname, email
FROM employees
WHERE id IN (
	SELECT employee_id FROM drawings
		WHERE drawing_type_id IN (
			SELECT id FROM drawing_types
				WHERE name = 'detail')
);
-- даже без DISTINCT выводит уникальные имена пользователей

-- 6.3. Вывести тех Технологов (их почту и телефон), кто согласовал хотябы 1 чертеж и выпустил хотябы 1 технологию.

USE factory;

SELECT 
	DISTINCT e.id,
	CONCAT(e.firstname , ' ', e.lastname) as name,
	e.email,
	e.phone	
FROM employees e 
JOIN draw_agreement_requests dar 
ON e.id = dar.target_user_id 
JOIN technologies t 
ON e.id = t.employee_id 
WHERE dar.status = 'approved';

-- 6.4. Найти чертежи (вывести шифр и название), которые входят в несколько спецификаций (т.е. более чем в 1 спецификацию).

USE factory;

SELECT
	d.id,
	d.drawing_code,
	d.drawing_name
FROM drawings d 
JOIN spec_drawing sd 
ON sd.drawing_id = d.id
GROUP BY d.id
HAVING COUNT(d.id) >= 2;


-- 6.5. Посчитать общее количество технологий, спецификаций и чертежей, выпущенных пользователями старше 40 лет.

USE factory;

SELECT SUM(xxx.total)
FROM (
	SELECT COUNT(e.id) AS total
	FROM employees e 
	JOIN specifications s 
	ON e.id = s.employee_id 
	WHERE TIMESTAMPDIFF (YEAR, birthday, NOW()) > 40

	UNION ALL
	
	SELECT COUNT(e.id) AS total
	FROM employees e 
	JOIN technologies t 
	ON e.id = t.employee_id 
	WHERE ((TO_DAYS(NOW()) - TO_DAYS(birthday)) / 365.25) > 40
	
	UNION ALL
	
	SELECT COUNT(e.id) AS total
	FROM employees e
	JOIN drawings d 
	ON e.id = d.employee_id
	WHERE TIMESTAMPDIFF (YEAR, birthday, NOW()) > 40
	)xxx;

-- 6.6. Подсчитать средний возраст технологов, не выпустивших ни одной технологии.

USE factory;
	
SELECT FLOOR(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday)) / 365.25)) as average_age
FROM employees e
JOIN positions p
ON e.position_id = p.id 
LEFT JOIN technologies t
ON e.id = t.employee_id 
WHERE t.employee_id IS NULL AND p.name LIKE 'tech%';

/*
7. представления (минимум 2);
*/

/*
7.1. Создать представление, которое выводит Шифр трех самых свежих чертежей.
 */

USE factory;

CREATE OR REPLACE VIEW v_fresh_three AS
	SELECT d.drawing_code 
	FROM drawings d 
	ORDER BY d.created_at DESC
	LIMIT 3;

SELECT * FROM v_fresh_three;

/*
7.2. Создать представление, которое выводит Имя Фамилию Должность сотрудника и ставит '+' в соседнем столбце,
если сотрудник создал хотябы 1 чертеж или хотябы 1 технологию, или '-', если не создал ничего.
 */
	
USE factory;
	
CREATE OR REPLACE VIEW v_doers AS
	SELECT e.firstname , e.lastname , p.name AS profession, IF(e.id IN (xxx.employee_id) ,'+','-') AS 'doers'
	FROM employees e
	LEFT JOIN positions p ON e.position_id = p.id 
	LEFT JOIN (
		SELECT DISTINCT t.employee_id
		FROM technologies t 
		UNION
		SELECT d.employee_id
		FROM drawings d 
	) AS xxx ON xxx.employee_id = e.id;

SELECT * FROM v_doers;
	
/*
7.3. Представление для процедуры 8.1., выводит список годов, в которых был выпущен хотябы 1 чертеж.
*/

USE factory;

CREATE OR REPLACE VIEW v_years_drawings AS
	SELECT DISTINCT YEAR(created_at) AS year_exists
	FROM drawings d ;

SELECT * FROM v_years_drawings;	

/*
8. хранимые процедуры (2) / триггеры (2);
*/

/*
8.1. Создать процедуру, которая ищет самый минимальный год выпущенного чертежа и самый максимальный год,
строит диапазон от min до max годов, и если в какой-то из годов был выпупущен хоть один чертеж,
то считать год продуктивным и ставить в соседней колонке 'efficient', иначе 'worthless'
*/

USE factory;

DROP PROCEDURE IF EXISTS pr_efficient_years;
DELIMITER //
CREATE PROCEDURE pr_efficient_years()
BEGIN
	DROP TABLE IF EXISTS drawings_years_range;
	CREATE TABLE drawings_years_range (
		years_list YEAR);

	SET @min_year := (SELECT MIN(year_exists) FROM v_years_drawings);
	SET @max_year := (SELECT MAX(year_exists) FROM v_years_drawings);

	REPEAT
	
		INSERT INTO drawings_years_range VALUES
			(@min_year);
		SET @min_year = @min_year + 1;
	
		UNTIL @min_year > @max_year
	END REPEAT;

	SELECT
		dyr.years_list,
		IF(yd.year_exists IS NOT NULL, 'efficient', 'worthless') AS `productivity`
	FROM drawings_years_range dyr
	LEFT JOIN v_years_drawings yd ON dyr.years_list = yd.year_exists;
	
END//
DELIMITER ;


CALL pr_efficient_years;


/*
8.2. Создать процедуру, которая выводит количество выпущенных чертежей заданным по фамилии пользователем.
*/

USE factory;

DROP PROCEDURE IF EXISTS pr_lastname_draw_count;
DELIMITER //
CREATE PROCEDURE pr_lastname_draw_count(lastname_request VARCHAR(50))
BEGIN
	DECLARE draw_num INT;
	DECLARE answer VARCHAR(255);

	SET @draw_num = (
		SELECT
			COUNT(e.id)
		FROM employees e
		JOIN technologies t
		ON e.id = t.employee_id 
		WHERE e.lastname = lastname_request
	);

	SELECT CONCAT('Сотрудник по фамилии: ', lastname_request, ' выполнил ', @draw_num, ' чертежей.') AS answer;
END//
DELIMITER ;


CALL pr_lastname_draw_count('Ullrich');
-- Выдает: Сотрудник по фамилии:  Ullrich выполнил 4 чертежей.
CALL pr_lastname_draw_count('Ullric');
-- Выдает: Сотрудник по фамилии:  Ullric выполнил 0 чертежей.
CALL pr_lastname_draw_count('Price');
CALL pr_lastname_draw_count('Predovic');

/*
8.3. Создать триггер, который вводит текущую дату создания чертежа, при попытке вставить значение NULL или значение даты "из будущего".
*/

USE factory;

DROP TRIGGER IF EXISTS insert_current_data;

DELIMITER //

CREATE TRIGGER insert_current_data
BEFORE INSERT 
ON drawings FOR EACH ROW
BEGIN
	IF NEW.created_at IS NULL OR NEW.created_at > current_date() THEN
		SET NEW.created_at = current_date();
	END IF;
END

DELIMITER ;

INSERT INTO `drawings` VALUES
	(NULL, 'PBL-01.000','Клапан',1,2, NULL);
-- запрос вставит текущую дату благодаря триггеру

INSERT INTO `drawings` VALUES
	(NULL, 'RDL-01.000','Клапан',1,2, '2022-01-24 19:30:20');
-- запрос вставит текущую дату благодаря триггеру

SELECT * FROM drawings;


/*
8.4. Создать триггер, который отменяет операцию и выводит ошибку, если при вставке имени или фамилии сотрудника присутствует русская буква.
 */

USE factory;

DROP TRIGGER IF EXISTS stop_enter_russian_names;

DELIMITER //

CREATE TRIGGER stop_enter_russian_names
BEFORE INSERT 
ON employees FOR EACH ROW
BEGIN
	IF NEW.firstname RLIKE '[а-яё]+' OR NEW.lastname RLIKE '[а-яё]+' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Сработал ТРИГГЕР! Имя и Фамилия не могут содержать русские буквы!';
	END IF;
END

DELIMITER ;

INSERT INTO `employees` VALUES
	(NULL,'Иван','Mueller','1990-05-28','yundt.briana@example.org',9495514764,1);
-- выведет ошибку

INSERT INTO `employees` VALUES
	(NULL,'Joe','Моржов','1990-05-28','yundt1.briana@example.org',9495514764,1);
-- выведет ошибку

INSERT INTO `employees` VALUES
	(NULL,'Joe','Mueller','1990-05-28','yundt2.briana@example.org',9495514764,1);
-- запрос отработает без ошибки

INSERT INTO `employees` VALUES
	(NULL,'Joe','Muellerц','1990-05-28','yundt23.briana@example.org',9495514764,1);
-- выведет ошибку

SELECT * FROM employees;
