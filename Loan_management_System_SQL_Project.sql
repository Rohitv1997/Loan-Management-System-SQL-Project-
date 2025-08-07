use rohit

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    city VARCHAR(50),
    phone VARCHAR(15)
);



CREATE TABLE Loan_Applications (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    tenure_months INT,
    loan_type VARCHAR(50),
    start_date DATE,
    status VARCHAR(20), -- e.g. Approved, Rejected, Ongoing
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

select * from Loan_Applications

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    due_date DATE,
    status VARCHAR(20), -- Paid, Delayed, Pending
    FOREIGN KEY (loan_id) REFERENCES Loan_Applications(loan_id)
);

select * from Payments

INSERT INTO Customers (customer_id, name, dob, city, phone) VALUES
(101, 'Amit Sharma', '1990-05-12', 'Mumbai', '9876543210'),
(102, 'Priya Mehta', '1988-08-22', 'Delhi', '9123456789'),
(103, 'Rahul Verma', '1995-03-30', 'Bangalore', '9988776655'),
(104, 'Sneha Joshi', '1992-11-15', 'Pune', '9112233445'),
(105, 'Vikram Patel', '1985-01-09', 'Ahmedabad', '9001122334');


INSERT INTO Loan_Applications (loan_id, customer_id, loan_amount, interest_rate, tenure_months, loan_type, start_date, status) VALUES
(201, 101, 500000, 8.5, 60, 'Home Loan', '2023-01-15', 'Ongoing'),
(202, 102, 200000, 12.0, 36, 'Personal Loan', '2022-06-10', 'Ongoing'),
(203, 103, 1500000, 9.5, 120, 'Home Loan', '2021-03-01', 'Approved'),
(204, 104, 100000, 13.5, 24, 'Education Loan', '2024-04-20', 'Rejected'),
(205, 105, 750000, 10.0, 48, 'Car Loan', '2022-12-05', 'Ongoing');

INSERT INTO Payments (payment_id, loan_id, payment_date, amount_paid, due_date, status) VALUES
(301, 201, '2023-02-15', 10000, '2023-02-10', 'Paid'),
(302, 201, '2023-03-16', 10000, '2023-03-10', 'Delayed'),
(303, 202, '2022-07-10', 7000, '2022-07-10', 'Paid'),
(304, 202, '2022-08-10', 7000, '2022-08-10', 'Paid'),
(305, 205, '2023-01-05', 15000, '2023-01-05', 'Paid'),
(306, 205, '2023-02-05', 15000, '2023-02-05', 'Pending');


select * from customers;
select * from Loan_Applications;
select * from Payments;

1. select * from customers

2. select name, city from customers

3. select * from customers where city ='Mumbai'

4. select * from Loan_Applications where loan_amount > 300000

5. select * from customers order by name

6. select * from Loan_Applications where status = 'approved' 

7. select * from payments order by payment_date desc limit 5

8. select * from customers where city <> 'delhi'

9. select * from customers where name like 'a%'

10. select * from customers where city= 'pune' or city= 'mumbai'

11. select * from Loan_Applications where loan_amount between 100000 and 500000

12. select count(*) from customers

13. select distinct loan_type from Loan_Applications

14. select * from payments where payment_date = current_date

15. select customers.name , Loan_Applications.loan_amount  from customers join Loan_Applications on customers.customer_id= Loan_Applications.customer_id

16. select l.loan_id,l.status, sum(p.amount_paid) as Total_amount_paid from Loan_Applications l join payments p on l.loan_id = p.loan_id GROUP BY l.loan_id, l.status;
    select * from Loan_Applications;
    select * from Payments;

17. SELECT c.name
FROM Customers c
JOIN Loan_Applications l ON c.customer_id = l.customer_id
LEFT JOIN Payments p ON l.loan_id = p.loan_id
WHERE p.payment_id IS NULL;
select * from customers;
select * from Loan_Applications;
select * from Payments;

18. select c.city, sum(l.loan_amount) as Total_loan_amount from customers c join Loan_Applications l on c.customer_id=l.customer_id group by c.city,l.loan_amount;
    select * from customers;
    select * from Loan_Applications;
    
19. select c.name,c.phone,l.loan_type from customers c join Loan_Applications l on c.customer_id = l.customer_id where loan_type = 'Home loan'

20. SELECT c.name, SUM(p.amount_paid) AS total_paid
FROM Customers c
JOIN Loan_Applications l ON c.customer_id = l.customer_id
JOIN Payments p ON l.loan_id = p.loan_id
GROUP BY c.name
HAVING SUM(p.amount_paid) < 50000;

21. select c.name, l.loan_amount from customers c join Loan_Applications l on c.customer_id= l.customer_id order by loan_amount desc limit 3

22. select avg(loan_amount) as Average_Loan, loan_type from Loan_Applications group by loan_type;
    select * from Loan_Applications;

23. SELECT c.name, l.start_date
FROM Customers c
JOIN Loan_Applications l ON c.customer_id = l.customer_id
WHERE YEAR(l.start_date) = 2023;

24. SELECT DISTINCT p.loan_id
FROM Payments p
WHERE p.payment_date < p.due_date;

25. Total Payments by Loan

SELECT l.loan_id, SUM(p.amount_paid) AS total_paid
FROM Loan_Applications l
JOIN Payments p ON l.loan_id = p.loan_id
GROUP BY l.loan_id;

26.Overdue Loans

 SELECT p.loan_id, c.name, p.due_date, p.status
FROM Payments p
JOIN Loan_Applications l ON p.loan_id = l.loan_id
JOIN Customers c ON l.customer_id = c.customer_id
WHERE p.status = 'Delayed';

27. EMI Status Report

SELECT c.name, l.loan_id, p.payment_date, p.due_date, p.amount_paid, p.status
FROM Customers c
JOIN Loan_Applications l ON c.customer_id = l.customer_id
JOIN Payments p ON l.loan_id = p.loan_id
ORDER BY c.name, p.due_date;

28. Loan Types by City

SELECT c.city, l.loan_type, COUNT(*) AS total_loans
FROM Customers c
JOIN Loan_Applications l ON c.customer_id = l.customer_id
GROUP BY c.city, l.loan_type;





