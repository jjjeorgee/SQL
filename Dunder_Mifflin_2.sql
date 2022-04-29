-- BASIC QUERIES --

-- Find all Employees --
SELECT salary AS stipend
FROM employee
ORDER BY first_name, last_name
LIMIT 5;

-- Find out info --
SELECT DISTINCT birth_day
FROM employee;

-- SQL FUNCTIONS --

-- Find out the number of --
SELECT COUNT(emp_id)
FROM employee
WHERE super_id <> 100;

SELECT emp_id
FROM employee
WHERE first_name = 'David';
SELECT COUNT(emp_id)
FROM employee
WHERE super_id = 100;
SELECT *
FROM employee
WHERE super_id = 100;

SELECT COUNT(emp_id)
FROM employee
WHERE birth_day > '1970-01-01' AND sex = 'F';

SELECT count(emp_id)
FROM employee
WHERE sex = 'M';

SELECT SUM(salary), branch_iD
FROM employee
GROUP BY branch_id;

SELECT *
FROM client
ORDER BY client_id;

SELECT first_name, super_id
FROM employee
ORDER BY super_id;

-- WILDCARDS --

SELECT *
FROM branch_supplier
WHERE supplier_name 
LIKE '%LABEL%';

SELECT *
FROM employee
WHERE birth_day
LIKE '____-10-__';

-- UNIONS --

SELECT salary
FROM jjjeorge_2.employee
UNION
SELECT total_sales
FROM jjjeorge_2.works_with;

-- JOINS --

SELECT employee.first_name, works_with.client_id, works_with.total_sales
FROM employee
RIGHT JOIN works_with
ON employee.emp_id = works_with.emp_id;

SELECT employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

--  NESTED QUERIES  --

SELECT employee.first_name, employee.last_name, works_with.total_sales
FROM employee
JOIN works_with
ON employee.emp_id = works_with.emp_id
WHERE total_sales > 30000;

SELECT client.client_name
FROM client
WHERE client.branch_id = (SELECT employee.branch_id
FROM employee
WHERE emp_id = 106
LIMIT 1
);

SELECT employee.emp_id, employee.first_name, employee.last_name, client.client_name
FROM employee
JOIN client
ON  employee.branch_id = client.branch_id
WHERE emp_id = 106;

-- ON DELETE --

DELETE FROM employee
WHERE emp_id = 102;

-- TRIGGERS --

   DELIMITER $$
CREATE TRIGGER my_trigger_4 
AFTER INSERT ON employee 
FOR EACH ROW BEGIN 
IF NEW.super_id = 100  
THEN INSERT INTO employee_type 
  VALUES('new employee under David added'); 
ELSEIF NEW.super_id = 106 
THEN INSERT INTO employee_type 
  VALUES('new employee under Josh added'); 
ELSE INSERT INTO employee_type 
  VALUES('new employee under Jan added'); 
  END IF;
END$$ 

CREATE TRIGGER my_trigger_3 
BEFORE INSERT ON employee 
FOR EACH ROW BEGIN 
IF NEW.sex = 'M' THEN 
INSERT INTO employee_type 
VALUES('new male employee added'); 
ELSEIF NEW.sex = 'F' THEN 
INSERT INTO employee_type 
VALUES('new female employee added'); 
ELSE INSERT employee_type 
VALUES('new other employee added'); 
END IF;
END$$
  
   -- MISC  --
CREATE VIEW Total_sales AS
SELECT E.first_name, E.last_name, SUM(W_W.total_sales) AS Total_sales
FROM employee AS E
JOIN works_with AS W_W
ON E.emp_id = W_W.emp_id
GROUP BY E.emp_id;

   
SELECT first_name, last_name
FROM employee
WHERE first_name LIKE 'j%' AND last_name LIKE 'h%';




