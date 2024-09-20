create database session03_ex02;
use session03_ex02;

create table customer(
id int auto_increment primary key,
name varchar(255),
cAge tinyint
);

insert into customer(name,cAge) values('minh quan', 10);
insert into customer(name,cAge) values('ngoc oanh', 20);
insert into customer(name,cAge) values('hong ha', 50);


create table oder(
oId int auto_increment primary key,
cId int, foreign key(cId) references customer(id),
oDate datetime,
oTotalPrice int
);

INSERT INTO oder(cId, oDate, oTotalPrice) VALUES (1, '2006-03-21', 150000);
INSERT INTO oder(cId, oDate, oTotalPrice) VALUES (2, '2006-03-23', 200000);
INSERT INTO oder(cId, oDate, oTotalPrice) VALUES (1, '2006-03-16', 170000);

create table product(
pId int auto_increment primary key,
pName varchar(25),
pPrice int
);

insert into product(pname,pPrice) values ('may giat',300);
insert into product(pname,pPrice) values ('tu lanh',500);
insert into product(pname,pPrice) values ('dieu hoa',700);
insert into product(pname,pPrice) values ('quat',100);
insert into product(pname,pPrice) values ('bep dien',200);
insert into product(pname,pPrice) values ('may hut bui ',500);


create table orderDetail(
oId int, foreign key(oId) references oder(oId),
pId int,foreign key(pId) references product(pId),
odQTY int 
);

insert into orderDetail(oId,pId,odQTY) values(1,1,3);
insert into orderDetail(oId,pId,odQTY) values(1,3,7);
insert into orderDetail(oId,pId,odQTY) values(1,4,2);
insert into orderDetail(oId,pId,odQTY) values(2,1,1);
insert into orderDetail(oId,pId,odQTY) values(3,1,8);
insert into orderDetail(oId,pId,odQTY) values(2,5,4);
insert into orderDetail(oId,pId,odQTY) values(2,3,3);
select oder.oId ,oder.oDate, oder.oTotalPrice from oder;
select oder.cId,orderDetail.pId from oder inner join orderDetail on oder.oId = orderDetail.oId;
select * from customer;
select * from oder;
select customer.id ,customer.name  from customer left join oder on customer.id = oder.cId where oder.cId is null ; 
SELECT 
    oder.oId, 
    oder.oDate, 
    SUM(orderDetail.odQTY * product.pPrice) AS totalPrice 
FROM 
    oder 
JOIN 
    orderDetail ON orderDetail.oId = oder.oId 
JOIN 
    product ON product.pId = orderDetail.pId 
GROUP BY 
    oder.oId, 
    oder.oDate
;
 
