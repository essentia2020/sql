-- ����������, ����������, �������������

-- 1. � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. 
-- ����������� ����������.

start transaction;
insert into sample.users (select * from shop.users where id = 1);
commit;

-- 2. �������� �������������, ������� ������� �������� name �������� ������� �� ������� products
-- � ��������������� �������� �������� name �� ������� catalogs.

create view cap as select p.name as p_name, c.name as c_name from products p
join catalogs c 
on p.catalog_id = c.id;

-- �������� ��������� � �������, ��������

-- �������� �������� ������� hello(), ������� ����� ���������� �����������, 
-- � ����������� �� �������� ������� �����. � 6:00 �� 12:00 ������� ������ ���������� ����� 
-- "������ ����", � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
-- � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����".

DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT '������ ����';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT '������ ����';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT '������ �����';
	ELSE
		SELECT '������ ����';
	END IF;
END //
delimiter ;

CALL hello();

-- � ������� products ���� ��� ��������� ����: name � ��������� ������ � description 
-- � ��� ���������. ��������� ����������� ����� ����� ��� ���� �� ���. 
-- ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. 
-- ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. 
-- ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.

DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(products.name) AND ISNULL(products.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NULL � ����� ����� �����������';
	END IF;
END //
delimiter ;





