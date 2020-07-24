-- Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).


-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select concat(firstname, ' ', lastname) as `user` from users where id = 
(select from_user_id from
(select from_user_id, count(*) as total from messages where to_user_id = 18 group by from_user_id) as total 
where (select max(total) from messages));
 
-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select count(id) from likes
where user_id in 
(select id from 
(select timestampdiff(year, birthday, NOW()) as age, p.user_id as id from profiles p where id = likes.user_id order by age desc limit 10) 
as young );

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select gender, count(*) from profiles p2 
where user_id in (select user_id as ids from likes l2)
group by gender;


-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

