/*1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf,
задав в нем логин и пароль, который указывался при установке.
*/
-- Захожу без параметров и без ввода пароля

/*2. Создайте базу данных example, разместите в ней таблицу users,
состоящую из двух столбцов, числового id и строкового name.
*/

create database example 
use example;
create table users (
	id INT,
	name VARCHAR(100)
);

/*3. Создайте дамп базы данных example из предыдущего задания,
разверните содержимое дампа в новую базу данных sample.
*/

create database sample
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump example > mysql.sql
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql sample < mysql.sql
-- развернулось (в БД sample появилась таблица users с двумя колонками)

/*4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump.
Создайте дамп единственной таблицы help_keyword базы данных mysql.
Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/

-- mysqldump mysql help_keyword --where="true limit 100" > one_table_dump.sql
-- файл дампа создался
CREATE database one_table_dump
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql one_table_dump < one_table_dump.sql
-- ERROR 3723 (HY000) at line 25: The table 'help_keyword' may not be created in the reserved tablespace 'mysql'.
-- не смог разобраться, почему дамп не выполняется.