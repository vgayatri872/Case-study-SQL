create database truYum;
use truYum;

create table menu_items (
item_id int primary key,
item_name varchar(40) not null,
price float not null,
date_of_launch date not null,
free_delivery enum("Yes","No"),
available enum("Yes", "No")
);

create table users (
user_id int primary key,
user_name varchar(90)
);

create table cart (
cart_id int primary key,
item_id int,
user_id int,
foreign key (user_id) references users(user_id),
foreign key (item_id) references menu_items(item_id));

insert into menu_items (item_id,item_name,price,date_of_launch,free_delivery,available) values (1,'Sandwich', 100.00,'2016-09-01', 'Yes', 'Yes');
insert into menu_items (item_id,item_name,price,date_of_launch,free_delivery,available) values (2,'Cake', 120.00, '2015-03-09', 'Yes', 'No');
insert into menu_items (item_id,item_name,price,date_of_launch,free_delivery,available) values (3,'Pizza', 99.00, '2017-01-08', 'Yes', 'Yes');
insert into menu_items (item_id,item_name,price,date_of_launch,free_delivery,available) values (4,'Coke', 99.00, '2017-03-05', 'Yes', 'No');
insert into menu_items (item_id,item_name,price,date_of_launch,free_delivery,available) values (5,'Burger', 129.00, '2018-04-09', 'No', 'Yes');
 
select * from menu_items;

select*from menu_items
where available = 'Yes';

select item_name from menu_items 
where item_id = 3;

update menu_items
set item_name = 'French Fries'
where item_id = 1;

insert into users values (1,'Dwight');
insert into users values (2,'Jeffrey');

insert into cart values (1,2,1), (2,3,1), (3,5,1);

select a.item_name from menu_items as a join cart as b on a.item_id = b.item_id where b.user_id = 1;

select sum(a.price) from menu_items as a join cart as b on a.item_id = b.item_id where b.user_id = 1;

delete from cart where user_id = 1 and item_id = 3;