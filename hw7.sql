-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ 
-- orders в интернет магазине.

select u.name, o.id from users u 
right join orders o 
on u.id = o.user_id;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

select p.name, c.name from products p 
join catalogs c 
on p.catalog_id = c.id;

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов 
-- cities (label, name). Поля from, to и label содержат английские названия городов, 
-- поле name — русское. Выведите список рейсов flights с русскими названиями городов.
drop table if exists flights;
create table flights(
id SERIAL PRIMARY KEY,
`from` VARCHAR(50) not null, 
`to` VARCHAR(50) not null
);

drop table if exists cities;
create table cities(
label VARCHAR(50) primary key, 
name VARCHAR(50)
);

alter table flights
add constraint fk_from_label
foreign key (`from`)
references cities(label);

alter table flights
add constraint fk_to_label
foreign key (`to`)
references cities(label);

insert into cities values
('Moscow', 'Москва'),
('Saint Petersburg', 'Санкт-Петербург'),
('Omsk', 'Омск'),
('Tomsk', 'Томск'),
('Ufa', 'Уфа');

insert into flights values
(null, 'Moscow', 'Saint Petersburg'),
(null, 'Saint Petersburg', 'Omsk'),
(null, 'Omsk', 'Tomsk'),
(null, 'Tomsk', 'Ufa'),
(null, 'Ufa', 'Moscow');


SELECT name FROM cities AS `from` WHERE label in (select `from` from flights)
union 
SELECT name FROM cities as `to` WHERE label in (select `to` from flights);
;