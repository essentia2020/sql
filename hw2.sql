DROP DATABASE IF EXISTS example; 
CREATE DATABASE example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (id INT UNSIGNED 
PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255),
 KEY index_of_name(name));
 INSERT INTO users VALUES
 (DEFAULT, 'Иванов М.В.'),
 (DEFAULT, 'Орлов А.В.'),
 (DEFAULT, 'Бронницкий К.С.'),
 (DEFAULT, 'Петров В.Н.'),
 (DEFAULT, 'Сидоров О.Б.');