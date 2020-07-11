-- добавляем поле для пароля
ALTER TABLE vk.users ADD pass varchar(255) NOT NULL;
-- изменяем тип данных столбца
ALTER TABLE users MODIFY phone VARCHAR(100) NULL;
alter table profiles add name varchar(255) not null;
alter table profiles add lastname varchar(255) not null;


-- INSERT #1

insert into users (id, login, email, phone, pass)
values (1, 'homyak', 'user1@mail.ru', '+79150000000', '123456');

insert into users (id, login, email, pass, phone)
values (2, 'bizon', 'user2@gmail.com', 'qwerty', '+79010000000');

insert into users (login, email, pass, phone)
values ('bizon2', 'user23@gmail.com', 'qwerty', '+79010000001');

insert into users (login, email, pass, phone) values
('spartach', 'user33@gmail.com', 'qwerty', '+79010000002'),
('bizon3', 'user53@gmail.com', 'qwerty', '+79010000003');

-- INSERT#2
insert into users 
set
	login = 'zloy',
	email = 'user4@mail.ru',
	phone = '+79129999999',
	pass = '123456';

-- INSERT #3
insert into vk.users (login, email, pass, phone)
select vk2.users.lastname, vk2.users.email, example.users.pass, vk2.users.phone from vk2.users
join example.users 
on vk2.users.id = example.users.id
where vk2.users.id > 10 and vk2.users.id < 100;

insert into profiles (user_id, name, lastname, hometown)
select (student_id - 140), name, surname, city from example.student where student_id<1000

-- UPDATE 
update users
set
	login = 'lost'
where login = 'bizon3';

delete from vk.users;

-- SELECT
select 'Hello, world!';
select * from users limit 20;
select distinct names from profiles limit 20;
select name, lastname, hometown from profiles where name not in ('Марина', 'Ольга', 'Екатерина', 'Светлана', 'Дмитрий');

select * from users where id>=20 and id<=40;

select * from users where id between 20 and 40;

select hometown from profiles where hometown like 'Мирный';

select hometown from profiles where hometown like 'Чехов%';

select hometown from profiles where hometown like '%ов%';

select hometown from profiles where hometown like 'Чехов-__';

select hometown from profiles where hometown like '____';

select concat(name, ' ', lastname ) as fullname from profiles limit 20;

select count(*) from users;

select count(photo_id) from profiles;

select count(distinct hometown) from profiles where hometown like 'Чехов%';

select count(hometown) as total_citezenship, hometown from profiles group by hometown;

select count(hometown) as total_citezenship, hometown from profiles group by hometown order by total_citezenship;

select count(hometown) as total_citezenship, hometown from profiles group by hometown order by total_citezenship DESC;

select count(hometown) as total_citezenship, hometown from profiles group by hometown having total_citezenship>=3;

update users 
set phone = null
where phone = '';


select * from users where phone = NULL;
select * from users where phone is NULL;

----
