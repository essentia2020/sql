-- Операторы, фильтрация, сортировка и ограничение
update users
set created_at = NOW() where created_at = null,
set updated_at = NOW() where updated_at = null;

alter table users modify created_at, updated_at DATETIME;

select * from storehouses_products order by if (value = 0, 1, 0), value;

select id, name, birthday_at from users where DATE_FORMAT(birthday_at, month) IN ('may', 'august');

-- Агрегация данных

select ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) as avg_age from users;

select 
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_of_birthday_in_this_Year,
    COUNT(*) as amount_of_birthday
from users
group by week_day_of_birthday_in_this_Year
order by amount_of_birthday desc;


