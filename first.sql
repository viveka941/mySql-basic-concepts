show databases;
create database myDB;
use myDB;
ALTER DATABASE myDB READ ONLY = 0;
CREATE TABLE employee(
emp_id int ,
first_name varchar(20),
last_name varchar(20),
hourly_pay decimal(5,2),
hire_date date
)

select * from employee;

rename table employee to workers;
drop table workers;

alter table employee
add phone_number varchar(15);

alter table employee
rename column  emali to email;

alter table employee
modify column email varchar(100);

alter table employee
modify email varchar(100) 
after last_name;

alter table employee
drop column email;
