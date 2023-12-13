CREATE TABLE customers(
customer_id int primary key,
customer_name varchar(255),
contact_number varchar(20),
email varchar(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    hire_date DATE,
    job_title VARCHAR(100)
);

insert into customers (customer_id,customer_name,contact_number,email) values(1,'yousef aldeeb','+962-795837513','yousef.aldeeb11@gmail.com'),
                                                                             (2,'alaa aldeeb','+962-799228686','alaa.aldeeb@gmail.com');

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES (11, 1, '2023-12-01', 150.00),
                                                                            (12, 2, '2023-12-02', 200.50);

INSERT INTO products (product_id, product_name, price) VALUES (111, 'watch1', 19.99),
                                                              (112, 'watch2', 35.50);

INSERT INTO employees (employee_id, employee_name, hire_date, job_title) VALUES (1111, 'Ahmad Aldeeb', '2023-12-10', 'HR'),
                                                                                (1112, 'Mohammad Aldeeb', '2022-12-11', 'Manager');
select * from customers;
select * from orders;
select * from products;
select * from employees;
