create database if not exists BlaBlaClothesDB;

use BlaBlaClothesDB;

create table address(
id int primary key auto_increment,
address1 varchar(100) not null,
address2 varchar(100),
county varchar(50),
country varchar(50) not null,
postcode varchar(10) not null);

alter table address add city varchar(20);

insert into address values(1, 'Flat 1', '321 High Street', 'Surrey', 'UK', 'RH4 2LB');
insert into address(address1, county, country, postcode) values('27 Strode Road', 'London', 'UK', 'NW10 2NN');
insert into address(address1, county, country, postcode) values('123 London Road', 'Derbyshire', 'UK', 'SL 3AG');
insert into address(address1, county, country, postcode) values('74 Long Lane', 'Middlesex', 'UK', 'UB10 8SY');
insert into address(address1, county, country, postcode) values('48 Parkland Drive', 'Derbyshire', 'UK', 'DE73 6WL');

create table bank_details(
id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
sort_code varchar(20) not null,
account_number varchar(20) not null,
bank varchar(20));

drop table bank_details;

insert into bank_details values (1, 'Liz', 'Robson', '123456', '987654321', 'First Direct');
insert into bank_details(first_name, last_name, sort_code, account_number, bank) values ('Alice', 'Tildsley', '123456', '346536564', 'Santander');
insert into bank_details(first_name, last_name, sort_code, account_number, bank) values ('Bushra', 'Akhtar', '123456', '23554363', 'Barclays');
insert into bank_details(first_name, last_name, sort_code, account_number, bank) values ('Rorie', 'Page', '123456', '36463626', 'Nationwide');
insert into bank_details(first_name, last_name, sort_code, account_number, bank) values ('John', 'Smith', '43424', '6473249294', 'Natwest');

create table users(
id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
gender varchar(20),
user_name varchar(20) not null,
profile_image blob,
location varchar(20),
social_media_account varchar(20),
delivery_address_id int not null,
foreign key (delivery_address_id) references address(id),
billing_address_id int not null,
foreign key (billing_address_id) references address(id),
bank_details_id int not null,
foreign key (bank_details_id) references bank_details(id));

insert into users values (1, 'Liz', 'Robson', 'Female', 'lizzie', 'lizzie.jpg', 'Surrey', '@liz', 1, 1, 1);
insert into users(first_name, last_name, gender, user_name, profile_image, location, social_media_account, delivery_address_id, billing_address_id, bank_details_id) values ('Alice', 'Tildsley', 'Female', 'alicetil', 'alice.jpeg', 'London', '@alicetil', 2, 3, 2);
insert into users(first_name, last_name, gender, user_name, profile_image, location, social_media_account, delivery_address_id, billing_address_id, bank_details_id) values ('Bushra', 'Akhtar', 'Female', 'Bee', 'bee.jpeg', 'Slough', '@bee', 3, 3, 3);
insert into users(first_name, last_name, gender, user_name, profile_image, location, social_media_account, delivery_address_id, billing_address_id, bank_details_id) values ('Rorie', 'Page', 'Male', 'rpage', 'rorie.png', 'Derby', '@rpage', 4, 4, 4);
insert into users(first_name, last_name, gender, user_name, profile_image, location, social_media_account, delivery_address_id, billing_address_id, bank_details_id) values ('John', 'Smith', 'Male', 'smithy', 'IMG01.jpeg', 'Liverpool', '@smithy123', 5, 5, 5);

create table items(
id int primary key auto_increment,
item_name varchar(50) not null,
brand varchar(50) not null,
size varchar(50) not null,
category varchar(50) not null,
sub_category varchar(50),
colour varchar(50) not null,
item_description varchar(100) not null,
retail_price float not null,
rental_price float not null,
collection varchar(50),
item_type varchar(50),
location varchar(50) not null,
owner_id int not null,
foreign key (owner_id) references users(id));

insert into items values (1, 'Sweatshirt', 'Tala', '10', 'Tops', 'Sweatshirts', 'Blue', 'Tala blue soft sweatshirt', 20, 5, 'Sportswear', 'Unisex', 'London', 1);
insert into items(item_name, brand, size, category, colour, item_description, retail_price, rental_price, collection, item_type, location, owner_id) values ('Dungarees', 'Zara', '10', 'Jumpsuit', 'Black', 'Black cotton dungarees', 30, 3, 'Loungewear', 'Mens', 'Surrey', 2);
insert into items(item_name, brand, size, category, sub_category, colour, item_description, retail_price, rental_price, collection, item_type, location, owner_id) values ('Trousers', 'Mango', '12', 'Trousers', 'Full-length', 'Black', 'Long black formal trousers', 30, 3, 'Office', 'Womens', 'Surrey', 2);
insert into items(item_name, brand, size, category, sub_category, colour, item_description, retail_price, rental_price, collection, item_type, location, owner_id) values ('Nike trainers', 'Nike', '5', 'Shoes', 'Trainers', 'White', 'Casual trainers', 45, 4, 'Sportswear', 'Unisex', 'Derby', 4);
insert into items(item_name, brand, size, category, sub_category, colour, item_description, retail_price, rental_price, collection, item_type, location, owner_id) values ('Mom jeans', 'Topshop', '12', 'Trousers', 'Jeans', 'Blue', 'Tapered mom jeans', 40, 5, 'Everyday', 'Womens', 'Liverpool', 5);

create table order_history(
id int primary key auto_increment,
item_id int not null,
foreign key (item_id) references items(id),
order_date date not null,
renter_id int not null,
foreign key (renter_id) references users(id),
item_price float not null,
item_review float not null);

insert into order_history values (1, 1, '2022-03-10', 3, 22, 9);
insert into order_history(item_id, order_date, renter_id, item_price, item_review) values (2, '2022-2-16', 2, 13.99, 5);
insert into order_history(item_id, order_date, renter_id, item_price, item_review) values (3, '2022-01-03', 4, 12, 7);
insert into order_history(item_id, order_date, renter_id, item_price, item_review) values (4, '2022-03-04', 1, 5, 8);

select * from items;
select * from users;
select * from address;
select * from bank_details;
select * from order_history;