/*1. ���������� ���� MySQL. �������� � �������� ���������� ���� .my.cnf,
����� � ��� ����� � ������, ������� ���������� ��� ���������.
*/
-- ������ ��� ���������� � ��� ����� ������

/*2. �������� ���� ������ example, ���������� � ��� ������� users,
��������� �� ���� ��������, ��������� id � ���������� name.
*/

create database example 
use example;
create table users (
	id INT,
	name VARCHAR(100)
);

/*3. �������� ���� ���� ������ example �� ����������� �������,
���������� ���������� ����� � ����� ���� ������ sample.
*/

create database sample
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump example > mysql.sql
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql sample < mysql.sql
-- ������������ (� �� sample ��������� ������� users � ����� ���������)

/*4. (�� �������) ������������ ����� �������� � ������������� ������� mysqldump.
�������� ���� ������������ ������� help_keyword ���� ������ mysql.
������ ��������� ����, ����� ���� �������� ������ ������ 100 ����� �������.
*/

-- mysqldump mysql help_keyword --where="true limit 100" > one_table_dump.sql
-- ���� ����� ��������
CREATE database one_table_dump
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql one_table_dump < one_table_dump.sql
-- ERROR 3723 (HY000) at line 25: The table 'help_keyword' may not be created in the reserved tablespace 'mysql'.
-- �� ���� �����������, ������ ���� �� �����������.