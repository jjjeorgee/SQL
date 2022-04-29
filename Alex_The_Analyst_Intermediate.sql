-- JOINS --
SELECT  MAX(E.salary), E.emp_id,  B.Branch_name
FROM employee AS E
JOIN branch AS B
ON E.branch_id = B.branch_id
WHERE E.branch_id = 2
ORDER BY E.emp_id,  B.Branch_name;

SELECT * FROM employee 
WHERE branch_id = 2 AND emp_id <> 123
ORDER BY SALARY DESC
;
UPDATE EMPLOYEE
SET super_id = NULL WHERE emp_id = 123
;
SELECT DISTINCT AVG(E.salary)
FROM employee AS E
JOIN works_with AS WW
ON E.emp_id = WW.emp_id;

-- UNION --
SELECT emp_id, first_name, branch_id FROM employee
UNION
SELECT client_id, client_name, branch_id FROM client;

-- CASE STATEMENTS --
SELECT first_name, salary, 
 CASE
	WHEN super_id IS NULL THEN salary + (salary * 0.3) 
    WHEN super_id = 100 THEN salary + (salary * 0.2)
	ELSE salary + (salary * 0.05)
 END AS EOY_BONUSES
FROM employee;

-- HAVING --
SELECT emp_id, COUNT(emp_id)
FROM works_with
GROUP BY emp_id
HAVING COUNT(emp_id) >= 2;

-- UPDATE/DELETE --
UPDATE employee
SET super_id = 100, salary = 120000
WHERE first_name = 'Dave';

DELETE FROM employee
WHERE emp_id = 115;

-- ALIASING --
SELECT first_name +' '+ last_name AS Full_name
FROM employee
;
-- PARTITION BY --
SELECT emp_id, first_name, last_name, sex, 
COUNT(sex) OVER (PARTITION BY sex) AS NS
FROM employee;
