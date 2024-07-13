drop database salesdb;
create database salesdb;
use salesdb;
create table productlines(
 productline varchar(50) primary key,
 textDescription varchar(4000) ,
 htmlDescription mediumtext,
 image mediumblob

);
create  table products(
   productcode varchar(15) primary key,
   productname varchar(70) not null,
   productscale varchar(10) not null,
   productvendor varchar(50) not null,
   productdescription text not null,
   quantityinstock smallint not null,
   buyprice decimal(10,2) not null,
   msrp decimal(10,2) not null,
   productline varchar(50),
    foreign key(productline) references productlines(productline)
);

create table employee(
 employeenumber int primary key ,
 lastname varchar(50) not null,
 firstname varchar(50) not null,
 extension varchar(10) not null,
 email varchar(100) not null,
 jobTitle varchar(50) not null,
 reportsto int,
 officeCode varchar(50),
foreign key(officeCode) references offices(officeCode),
foreign key(reportsto) references employee(employeenumber));


create table offices(
 officecode varchar(10) primary key,
 city varchar(50) not  null,
 phone varchar(50) not null,
 adressline1 varchar(50) not null,
 adressline2 varchar(50) ,
 state varchar(50),
 country varchar(50) not null,
 postalcode varchar(15) not null,
 territory varchar(10) not null
);

create table customers(
 customernumber int primary key,
 customername varchar(50) not null,
 contactlastname varchar(50) not null,
 contactfirstname varchar(50) not null,
 phone varchar(50) not null,
 adressline1 varchar(50) not null,
 city varchar(50) not null,
 state varchar(50),
 postalcode varchar(15),
 country varchar(50) not null,
 creditlimit decimal(10,2),
 salesrepemployeenumber int,
 foreign key (salesrepemployeenumber) references employee(employeenumber)
);

create table orders(
ordernumber int primary key,
orderdate date not null,
shippeddate date,
comments text,
status varchar(15) not null,
customernumber int ,
foreign key(customernumber) references customers(customernumber));


create table orderdetails(
quantityordered int not null,
priceeach decimal(10,2) not null,
orderlinenumber smallint not null,
productcode varchar(15),
ordernumber int,
foreign key(ordernumber) references orders(ordernumber),
foreign key(productcode) references  products(productcode));


create table paymentstable(
checknumber varchar(50) primary key,
paymentdate date not null,
amount decimal(10,2) not null,
customernumber int,
foreign key(customernumber) references customers(customernumber)
);

