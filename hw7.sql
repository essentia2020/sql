-- 1. ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� 
-- orders � �������� ��������.

select u.name, o.id from users u 
right join orders o 
on u.id = o.user_id;

-- 2. �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

select p.name, c.name from products p 
join catalogs c 
on p.catalog_id = c.id;

-- 3. (�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� 
-- cities (label, name). ���� from, to � label �������� ���������� �������� �������, 
-- ���� name � �������. �������� ������ ������ flights � �������� ���������� �������.
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
('Moscow', '������'),
('Saint Petersburg', '�����-���������'),
('Omsk', '����'),
('Tomsk', '�����'),
('Ufa', '���');

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