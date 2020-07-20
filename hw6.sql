-- ���������������� �������, ������� ����������� �� �������, ���������� ��������� ������������� �/��� ��������� (JOIN ���� �� ���������).


-- ����� ����� ��������� ������������. 
-- �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.

select concat(firstname, ' ', lastname) as `user` from users where id = 
(select from_user_id from
(select from_user_id, count(*) as total from messages where to_user_id = 18 group by from_user_id) as total 
where (select max(total) from messages));
 
-- ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

select count(id) from likes
where user_id in 
(select id from 
(select timestampdiff(year, birthday, NOW()) as age, p.user_id as id from profiles p where id = likes.user_id order by age desc limit 10) 
as young );

-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

select count(user_id ) as gender from profiles p2 group by gender 
where user_id in (select user_id as ids from likes l2);


-- ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.

