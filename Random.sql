SELECT emp_id, first_name, last_name, 
	TIMESTAMPDIFF(YEAR, birth_day ,  CURDATE()) AS age
FROM employee;

SELECT COUNT(E.emp_id), E.branch_id, B.branch_name
FROM employee AS E
JOIN branch AS B
ON E.branch_id = B.branch_id
GROUP BY branch_id
ORDER BY branch_id;

select avg(SALARY)
from employee;

CREATE VIEW Total_sales AS
SELECT E.first_name, E.last_name, SUM(W_W.total_sales) AS Total_sales
FROM employee AS E
JOIN works_with AS W_W
ON E.emp_id = W_W.emp_id
GROUP BY E.emp_id;

SHOW databases;
USE mysql;
SHOW TABLES;

SELECT * FROM  columns
WHERE TABLE_SCHEMA = 'jjjeorge_2';

SELECT  emp_id
FROM employee
WHERE salary BETWEEN 50000 AND 100000
LIMIT 5;

SELECT total_sales
FROM works_with
WHERE emp_id = ANY
(SELECT emp_id 
FROM employee
WHERE super_id = 100);

SELECT emp_id, salary/5 AS new_salary, (salary/5)+1000 AS bonus_balance
FROM employee;

SELECT COUNT(emp_id), super_id
FROM employee
GROUP BY super_id
HAVING COUNT(emp_id) > 2;

SELECT * 
FROM entrants
WHERE first_name LIKE 'a%';

SELECT emp_id, first_name, MAX(salary)
FROM employee
GROUP BY salary
ORDER BY MAX(salary) DESC
LIMIT 6;

SELECT * 
FROM employee
ORDER BY SALARY DESC;

START TRANSACTION