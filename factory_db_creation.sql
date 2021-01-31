/*
Проект базы данных производственной фирмы.

*/
DROP DATABASE IF EXISTS factory;
CREATE DATABASE factory;
USE factory;


-- Проектировщики.
DROP TABLE IF EXISTS designers;
CREATE TABLE designers (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(20),
	lastname VARCHAR(30),
	birthday DATE,
	email VARCHAR(100) UNIQUE,
	phone BIGINT,
	INDEX users_lastname_firstname_idx(lastname, firstname)
);


-- Проекты. В проект состоит из нескольких чертежей.
-- Нет ли дублирования чертеж принадлежит проектировщику и в проект входят проектировщики
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100), -- название проекта
	created_at DATETIME DEFAULT NOW(),
	INDEX projects_name_idx(name)
);


-- Связки проектировщик-проект.
-- Над проэктом работает один или несколько проектировщиков.
-- Один проектировщик может работать над несколькими проектами.
DROP TABLE IF EXISTS designer_project;
CREATE TABLE designer_project (
	designer_id BIGINT UNSIGNED NOT NULL,
	project_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(), -- когда начал работать над проектом
	FOREIGN KEY (designer_id) REFERENCES designers(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- типы чертежей. Индексы не делаю - замедлят работу.
DROP TABLE IF EXISTS drawing_type;
CREATE TABLE drawing_type (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW()
);


-- Чертежи. У чертежа только один проектировщик. Чертеж входит в несколько проектов.
DROP TABLE IF EXISTS drawings;
CREATE TABLE drawings (
	id SERIAL PRIMARY KEY,
	drawing_name VARCHAR(50), -- наименование чертежа
	drawing_code VARCHAR(50), -- шифр чертежа
	designer_id BIGINT UNSIGNED NOT NULL,
	drawing_type_id BIGINT UNSIGNED NOT NULL, -- тип чертежа
	project_id BIGINT UNSIGNED DEFAULT NULL,
	created_at DATETIME DEFAULT NOW(), -- дата создания чертежа
	change_description TEXT DEFAULT NULL, -- описание ,что изменено по сравнению с предыдущей версией чертежа
	FOREIGN KEY (designer_id) REFERENCES designers(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (drawing_type_id) REFERENCES drawing_type(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES projects(id) ON UPDATE CASCADE ON DELETE SET NULL
);


DROP TABLE IF EXISTS draw_agreement_requests;
CREATE TABLE draw_agreement_requests (
	-- id SERIAL PRIMARY KEY, -- изменили на составной ключ (initiator_user_id, target_user_id)
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	drawings_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    -- `status` TINYINT UNSIGNED,
    `status` ENUM('requested', 'approved', 'declined'),
    -- `status` TINYINT UNSIGNED, -- в этом случае в коде хранили бы цифирный enum (0, 1, 2, 3...)
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME on update NOW(),
	
    PRIMARY KEY (initiator_user_id, drawings_id, target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (target_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/*
DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    password_hash varchar(100),
    phone BIGINT,
    is_deleted bit default 0,
    -- INDEX users_phone_idx(phone), -- помним: как выбирать индексы
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100)
    -- , FOREIGN KEY (photo_id) REFERENCES media(id) -- пока рано, т.к. таблицы media еще нет
);

-- NO ACTION
-- CASCADE 
-- RESTRICT
-- SET NULL
-- SET DEFAULT


ALTER TABLE `profiles` ADD CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке

    FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	-- id SERIAL PRIMARY KEY, -- изменили на составной ключ (initiator_user_id, target_user_id)
	initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    -- `status` TINYINT UNSIGNED,
    `status` ENUM('requested', 'approved', 'declined', 'unfriended'),
    -- `status` TINYINT UNSIGNED, -- в этом случае в коде хранили бы цифирный enum (0, 1, 2, 3...)
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME on update now(),
	
    PRIMARY KEY (initiator_user_id, target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (target_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	admin_user_id BIGINT UNSIGNED,

	INDEX communities_name_idx(name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, community_id), -- чтобы не было 2 записей о пользователе и сообществе
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (community_id) REFERENCES communities(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

    -- записей мало, поэтому индекс будет лишним (замедлит работу)!
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED,
    user_id BIGINT UNSIGNED NOT NULL,
  	body text,
    filename VARCHAR(255),
    `size` INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    -- PRIMARY KEY (user_id, media_id) – можно было и так вместо id в качестве PK
  	-- слишком увлекаться индексами тоже опасно, рациональнее их добавлять по мере необходимости (напр., провисают по времени какие-то запросы)  

-- намеренно забыли, чтобы позднее увидеть их отсутствие в ER-диаграмме
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL,
  	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE `profiles` ADD CONSTRAINT fk_photo_id
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON UPDATE CASCADE ON DELETE set NULL;

   
   
   
Практическое задание по теме “Введение в проектирование БД”
Написать cкрипт, добавляющий в БД vk, которую создали на 3 вебинаре,
3-4 новые таблицы (с перечнем полей, указанием индексов и внешних ключей).
(по желанию: организовать все связи 1-1, 1-М, М-М)

   
   
-- статьи сообществ, в сообществе может быть много статей, у пользователя много статей, у статьи один юзер и одно сообщество.
DROP TABLE IF EXISTS community_articles;
CREATE TABLE community_articles (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
	community_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED,
	body TEXT,
	FOREIGN KEY (community_id) REFERENCES communities(id) ON UPDATE CASCADE ON DELETE CASCADE, -- при удалении сообщества, статья удаляется
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL, -- при удалении юзера, статья не удаляется
	INDEX article_name_idx(name)
);

-- темы обсуждений
DROP TABLE IF EXISTS discussing_topic;
CREATE TABLE discussing_topic (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	moderator_id BIGINT UNSIGNED,
	number_of_messages BIGINT,
	INDEX discussing_topic_idx(name),
	FOREIGN KEY (moderator_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL -- при удалении модератора-юзера, поле зануляется, топик не удаляется
);

-- в тему обсуждений входит много юзеров, каждый юзер может обсуждать много тем
DROP TABLE IF EXISTS users_discussing_topic;
CREATE TABLE users_discussing_topic(
	user_id BIGINT UNSIGNED NOT NULL,
	discussing_topic_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, discussing_topic_id), -- чтобы юзер не мог принадлежать теме более 1 раза
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE, -- при удалении юзера, связка юзер-топик удаляется
    FOREIGN KEY (discussing_topic_id) REFERENCES discussing_topic(id) ON UPDATE CASCADE ON DELETE CASCADE -- при удалении топика, связка удаляется
);

-- сообщения темы, у каждой темы много сообщений, сообщение не может принадлежать нескольким темам. У сообщения 1 автор
DROP TABLE IF EXISTS topic_messages;
CREATE TABLE topic_messages (
	id SERIAL PRIMARY KEY,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
  	message_author BIGINT UNSIGNED NOT NULL,
  	discussing_topic_id BIGINT UNSIGNED NOT NULL,
  	FOREIGN KEY (message_author) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE, -- при удалении юзера, сообщение удаляется
  	FOREIGN KEY (discussing_topic_id) REFERENCES discussing_topic(id) ON UPDATE CASCADE ON DELETE CASCADE -- при удалении топика, сообщение удаляется
);
*/