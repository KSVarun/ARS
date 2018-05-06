drop table users cascade constraints;

CREATE TABLE USERS (slNo number(5) primary key, username varchar2(20) ,password varchar2(20),role varchar2(12),mobileNo number(10));

insert into users values(1,'Varun','asd123','admin',7798813392);
insert into users values(2,'Shagufta','456','executive',7798853392);

create sequence user_no start with 2;

drop table flightinformation cascade constraints;

create table flightinformation (flightNo number(5) primary key, airline varchar2(20),
depCity varchar2(10),arrCity varchar2(10),depDate date,arrDate date,depTime varchar2(10),
arrTime varchar2(10),firstSeats number(5),firstSeatsFare number(5),businessSeats number(5),businessSeatsFare
number(5));

INSERT INTO flightinformation VALUES(
12346,'IndiGo','Mumbai','Chennai',to_date('2017-12-13','YYYY-DD-MM'),to_date('2017-12-14','YYYY-DD-MM'),
'08:10','09:15:00',78,7900,67,6900); 
INSERT INTO FLIGHTINFORMATION VALUES(
12645,'jee','Pune','Bangalore',to_date('2017-12-14','YYYY-DD-MM'),to_date('2017-12-15','YYYY-DD-MM'),
'01:00','5:30:10',78,7609,67,6090); 

drop table BOOKINGINFORMATION cascade constraints;

CREATE TABLE BOOKINGINFORMATION(
bookingId number(5) primary key,
custEmail varchar2(25),
noOfPassengers number(5),
classType varchar2(10),
totalFare number(10),
seatNumber varchar2(20),
creditCardInfo varchar2(20),
srcCity varchar2(10),
destCity varchar2(10),
flightNo number(5),
foreign key(flightNo) references flightinformation(flightNo) on delete cascade);


select * from flightinformation;

select * from bookinginformation;

select * from users;

delete from users where username='Varun'; 

select * from users where username='Sahgufta' and password='345';

create sequence hibernate_sequence;

select sum(firstSeats),sum(businessSeats) from flightinformation;