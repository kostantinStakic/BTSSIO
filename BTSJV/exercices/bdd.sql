drop database if exists logintest;

create database logintest;

use logintest;

create table user(
id int auto_increment primary key,
mail varchar(50),
mdp varchar(20)
);



insert into user values(null, 'test@mail.com','123');

	SELECT * FROM user WHERE mail = '' AND mdp = '';

	SELECT * FROM user WHERE mail = '' OR 1=1 -- ' AND mdp = ''