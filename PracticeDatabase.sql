create database if not exists mydatabase;
use mydatabase;
show tables;
create table items(
id int primary key auto_increment,
item_desc varchar(120),
item_name varchar(50) not null,
price float not null);

create table users(
id int primary key auto_increment,
user_name varchar(20) not null,
email varchar(50) not null,
user_id varchar(10) not null,
item_id int not null,
foreign key (item_id) references items(id));

insert into items values (1, 'super old-school hat', 'Hat', 9.95);
select * from items;

insert into users values (1, 'Sherlock Holmes', 'sholmes@gmail.com', 'sholmes', 1);
select * from users;

insert into items(item_desc, item_name, price) values ('Super cool magnifying glass', 'Magnifying glass', 15.95);
select * from items;
