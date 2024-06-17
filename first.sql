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

insert into employee
value 
(1, 'Eugene', 'Krabs', 25.50, '2023-01-02'),
(2, 'Sandy', 'Cheeks', 30.00, '2023-02-14'),
(3, 'Squidward', 'Tentacles', 22.75, '2023-03-20'),
(4, 'Patrick', 'Star', 18.00, '2023-04-25'),
(5, 'SpongeBob', 'SquarePants', 20.50, '2023-05-30');

insert into employee(emp_id,first_name)
value (6,"Vivek");

select last_name, first_name
from employee
where emp_id <4;

select * from employee
where hire_date is not null;

SET SQL_SAFE_UPDATES = 0;

update employee
set hourly_pay = 25.50,
 hire_date="2023-01-07"
where emp_id = 6;
select *from employee;

delete from employee
where emp_id=5;
select * from employee;


SET AUTOCOMMIT = OFF;
COMMIT;
DELETE FROM employee;
select * from employee;

rollback;

CREATE TABLE TEST(
my_date date,
my_time time,
my_datetime datetime
);

select * from test;

insert into test values(current_date(), current_time(),now());
insert into test values(current_date()+1, null,null); 


create table products(
product_id int,
product_name varchar(25) unique,
price decimal(4,2)
);

ALTER TABLE products
add constraint
unique (product_name);

select * from products;

INSERT INTO products
values (100,"hamburger",3.99),
		(101,"fries",1.89),
        (102,"sada",1.00),
        (103,"ice cream",1.49);
      
alter table products
modify price decimal (4,2) not null;

insert into products 
values (104,"cookie",0);

CREATE TABLE employee(
emp_id int ,
first_name varchar(20),
last_name varchar(20),
hourly_pay decimal(5,2),
hire_date date,
constraint chk_hourly_pay check (hourly_pay >=10.00)
);


select * from employee;
-- Add the new constraints with different names
ALTER TABLE employee
ADD CONSTRAINT chk_hourly_pay_10 CHECK(hourly_pay >= 10.00);

ALTER TABLE employee
ADD CONSTRAINT chk_hourly_pay_20 CHECK(hourly_pay >= 20.00);


insert into products
values(104,"straw",0.00),
		(105,"nakin",0.99),
        (106,"fork",0.00),
        (107,"spoon",0.00);
        
        SET SQL_SAFE_UPDATES = 0;
delete from products
where product_id >= 104;

ALTER TABLE products MODIFY price DECIMAL(10,2) NULL;

INSERT INTO products (product_id, product_name)
VALUES 
    (104, 'straw'),
    (105, 'napkin'),
    (106, 'fork'),
    (107, 'spoon');

SELECT * FROM products;

create table transactions(
trns_id int,
amount decimal (5,2),
trans_data datetime default now()
);

-- Step 2: Insert five sample records into the transactions table
INSERT INTO transactions (trns_id, amount)
VALUES
   
    (6, 256.00);

-- Step 3: Verify the insertions
SELECT * FROM transactions;


create table trans(
trans_id int primary key,
amount  decimal(5,2)
);

alter table trans
add constraint 
primary key(amount);


insert into trans
values(1002,3.48);
select * from trans;

insert into trans
values(null,3.48);
select * from trans;


select amount from trans
where trans_id = 1002;

create table transaction(
transaction_id int primary key auto_increment,
amount decimal(5,2)
);

insert into transaction(amount)
values(7.5);
select * from transaction;
alter table transaction 
auto_increment = 100;

create table customers(
customer_id int primary key auto_increment,
first_name varchar(20),
last_name varchar(20)
);

insert into customers (first_name,last_name)
values("fred","fisht"),
		("larry","Lboster"),
        ("Bubble","Bass");
select * from customers;

drop table transactions;

create table transactions(
transaction_id int primary key auto_increment,
amount decimal(5,2),
customer_id int,
foreign key(customer_id) references customers(customer_id)
);

select * from transactions;

alter table transactions
drop Foreign key transactions_ibfk_1 ;

alter table transactions
add constraint fk_customer_id
foreign key (customer_id) references customers(customer_id);

insert into transactions (amount, customer_id)
values (1.00 , null);
select * from transactions;

select * from customers;

select * from transactions right join customers
on transactions.customer_id = customers.customer_id;