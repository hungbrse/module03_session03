create database session03_ex01;
use session03_ex01;

create table product(
id int auto_increment primary key,
name varchar(100),
created date
);



create table color(
id int auto_increment primary key,
name varchar(100),
status bit
);



create table size(
id int auto_increment primary key,
name varchar(100),
status bit
);


create table product_detail(
id int auto_increment primary key,
productId int,foreign key(productId) references product(id),
colorId int,foreign key(colorId) references color (id),
sizeId int,foreign key(sizeId) references size(id),
price double,
stock int,
status bit
);

insert into color(name,status) values('red',1);
insert into color(name,status) values('blue',1);
insert into color(name,status) values('green',1);


insert into size(name,status) values('XXL',1);

INSERT INTO product(name, created) VALUES ('mu phot', '1995-07-07');


INSERT INTO product_detail(productId, colorId,sizeId,price,stock,status) VALUES (2,3,5,2000,10,0);


select * from product_detail where price > 1200;
select * from color;
select * from size;
select * from product_detail where id = 1;


