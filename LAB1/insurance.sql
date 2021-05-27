create database insurance;
create table person(
driver_id varchar(10),
 name varchar(20) ,
 address varchar(100),
 primary key(driver_id)
);
create table car
(
reg_num varchar(10),
model varchar(10),
year int,
primary key(reg_num)
);

create table accident
(
report_num int,
accident_date date,
location varchar(20),
primary key(report_num)
);

create table owns
(
driver_id varchar(10),
reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);

create table participated
(
driver_id varchar(10),
reg_num varchar(10),
report_num int	,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);
select *from car;

use insurance;
insert into person values('A01', 'Richard', 'Srinivas Nagar');
insert into person values('A02', 'Pradeep', 'Rajaji Nagar');
insert into person values('A03', 'Smith', 'Ashok Nagar');
insert into person values('A04', 'Viru', 'N.R Colony');
insert into person values('A05', 'John', 'HanumanthNagar');
select * from person;

insert into car values('KA052255', 'Indica', '1990');
insert into car values('KA052251', 'Lacer', '1957');
insert into car values('KA052252', 'Tyota', '1998');
insert into car values('KA052253', 'Honda', '2008');
insert into car values('KA052254', 'Audi', '2005');
select * from car;

insert into  accident values('11', '2002-03-01', 'Basvangudi Road');
insert into  accident values('12', '2008-04-05', 'KANAKPURA Road');
insert into  accident values('13', '2000-09-10', 'Ring Road');
insert into  accident values('14', '2004-05-12', 'Mysore Road');
insert into  accident values('15', '2003-07-28', 'Mysore Road');
select * from accident;

insert into  owns values('A01', 'KA052255');
insert into  owns values('A02', 'KA052251');
insert into  owns values('A03', 'KA052252');
insert into  owns values('A04', 'KA052253');
insert into  owns values('A05', 'KA052254');
select * from owns;

INSERT INTO PARTICIPATED VALUES('A01', 'KA052255', 11, 10000);
INSERT INTO PARTICIPATED VALUES('A02', 'KA052251', 12, 50000);
INSERT INTO PARTICIPATED VALUES('A03', 'KA052252', 13, 25000);
INSERT INTO PARTICIPATED VALUES('A04', 'KA052253', 14, 3000);
INSERT INTO PARTICIPATED VALUES('A05', 'KA052254', 15, 5000);
select * from participated;

UPDATE PARTICIPATED SET DAMAGE_AMOUNT = 25000 WHERE REPORT_NUM = 12;
select *from participated;

INSERT INTO ACCIDENT VALUES(16, '2008-02-21', 'Bulltemple Road');
select * from accident;


SELECT COUNT(DISTINCT DRIVER_ID) FROM ACCIDENT, PARTICIPATED 
WHERE ACCIDENT.REPORT_NUM = PARTICIPATED.REPORT_NUM
AND ACCIDENT_DATE LIKE '2008%';

SELECT COUNT(REPORT_NUM) FROM CAR, PARTICIPATED
WHERE CAR.REG_NUM = PARTICIPATED.REG_NUM
AND MODEL = "AUDI";

