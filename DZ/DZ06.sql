-- 6. Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”


/*
1. Пусть задан некоторый пользователь.
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/

-- Пусть задан пользователь с id 1

USE vk;

SELECT from_user_id + to_user_id - 1  as most_frequent_talk_friend
FROM
	messages
WHERE from_user_id + to_user_id - 1 IN (
	SELECT initiator_user_id 
		FROM friend_requests 
		WHERE target_user_id = 1 and status = 'approved'
	union
	SELECT target_user_id 
		FROM friend_requests 
		WHERE initiator_user_id = 1 and status = 'approved')
GROUP BY
	from_user_id + to_user_id - 1
ORDER BY
	COUNT(from_user_id + to_user_id - 1) DESC
LIMIT 1;

-- JOIN? решение от преподавателя
SELECT
	from_user_id,
	CONCAT(u.firstname, ' ', u.lastname) as name,
	COUNT(*) as 'messages count'
FROM messages m
JOIN users u ON u.id = m.from_user_id
WHERE to_user_id = 1 -- AND friend_request = 'approved' тогда решается
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
-- LIMIT 1;


/*
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

USE vk;

SELECT COUNT(*) likes_amount FROM likes
WHERE media_id IN (
	SELECT id FROM media
		WHERE user_id IN (
			SELECT user_id 
			FROM profiles
			WHERE TIMESTAMPDIFF (YEAR, birthday, NOW()) < 10
		)
	);

-- JOIN
SELECT COUNT(*)
FROM likes l
JOIN media m ON l.media_id = m.id 
JOIN profiles p ON m.user_id = p.user_id
WHERE TIMESTAMPDIFF (YEAR, p.birthday, NOW()) < 10


/*
3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

USE vk;

SELECT
	COUNT(id) as cnt,
	CASE (SELECT gender FROM profiles WHERE user_id = likes.user_id)
		WHEN 'm' THEN 'Мужчины'
		WHEN 'f' THEN 'Женщины'
	END as 'Поставили лайки:'
FROM
	likes
GROUP BY (SELECT gender FROM profiles WHERE user_id = likes.user_id);


-- JOIN

SELECT COUNT(l.media_id) as cnt, p.gender
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
GROUP BY p.gender
ORDER BY cnt DESC;


