-- SCALAR SUB-QUERY WITH WHERE --
SELECT emp_id, first_name, salary
FROM employee
WHERE salary >=(SELECT AVG(salary)
FROM employee);

-- SCALAR SUB-QUERY WITH FROM --
SELECT E.emp_id, E.first_name, E.salary
FROM employee AS E
JOIN (SELECT AVG(salary) AS Sal FROM employee) AS avg_Sal
ON E.SALARY > avg_Sal.Sal;

-- MULTIPLE ROW SUB-QUERY (MULTI ROWS MULTI COLUMNS) --
SELECT *
FROM employee
WHERE (branch_id, salary) IN (SELECT branch_id, MAX(salary)
							  FROM employee
							  GROUP BY branch_id);
                              
 -- MULTIPLE ROW SUB-QUERY (MULTI ROWS SINGLE COLUMNS) --
SELECT * FROM  branch
WHERE branch_id NOT IN (SELECT DISTINCT branch_id
FROM employee);

-- CORRELATED SUB-QUERIES --
SELECT * FROM EMPLOYEE AS E1
	WHERE SALARY > (SELECT AVG(SALARY)
	FROM employee AS E2
	WHERE E2.branch_id = E1.branch_id)
    ORDER BY BRANCH_ID;
    
SELECT * 
FROM EMPLOYEE
WHERE SALARY > (SELECT avg(SALARY)
FROM EMPLOYEE
WHERE BRANCH_ID = 2) 
AND BRANCH_ID = 2;


-- NESTED SUB-QUERY QUERIES --
SELECT E1.first_name, E2.supervisor
FROM employee AS E1
JOIN (SELECT emp_id, first_name AS supervisor
FROM employee AS table_1
WHERE emp_id IN (SELECT DISTINCT SUPER_ID
FROM employee
WHERE SUPER_ID IS NOT NULL) ) AS E2
ON E1.super_id = E2.emp_id 
;

CREATE VIEW SALES AS
SELECT  E.branch_id, WW.*
FROM employee AS E
JOIN works_with AS WW
ON  E.emp_id = WW.emp_id;

SELECT sales.branch_id, SUM(sales.total_sales)
FROM sales
GROUP BY sales.branch_id
HAVING SUM(sales.total_sales) > (SELECT AVG(sales.total_sales)
FROM SALES);

SELECT *
FROM (SELECT sales.branch_id, SUM(sales.total_sales) AS t_sales
	FROM sales
	GROUP BY sales.branch_id)query_2
JOIN
(SELECT AVG(t_sales) AS avg_t_sales
FROM(
	SELECT sales.branch_id, SUM(sales.total_sales) AS t_sales
	FROM sales
	GROUP BY sales.branch_id
)query_1) as query_3
ON
query_2.t_sales > query_3.avg_t_sales;

SELECT *
FROM (
SELECT BRANCH_ID, SUM(SALARY) AS s_salary
FROM EMPLOYEE
GROUP BY BRANCH_ID
) AS table_2
JOIN 
(SELECT AVG(s_salary) AS avg_salary
FROM(
SELECT BRANCH_ID, SUM(SALARY) AS s_salary
FROM EMPLOYEE
GROUP BY BRANCH_ID
) AS table_1) AS table_3
ON
table_2.s_salary > table_3.avg_salary;

SELECT *
FROM (SELECT  BRANCH_NAME, SUM(SALARY) AS s_salary
		FROM
		(SELECT SALARY, BRANCH_NAME FROM employee AS E
		INNER JOIN branch AS B
		ON E.branch_id = B.branch_id) AS table_1
	GROUP BY branch_name) AS table_4
JOIN
(SELECT AVG(s_salary) AS a_salary
FROM
	(SELECT SUM(SALARY) AS s_salary
		FROM
		(SELECT SALARY, BRANCH_NAME FROM employee AS E
		INNER JOIN branch AS B
		ON E.branch_id = B.branch_id) AS table_1
	GROUP BY branch_name) AS table_2) AS table_3
ON table_4.s_salary > table_3.a_salary;

-- using subquery in SELECT --
select *,
(case when salary > (select avg(salary) as avg_sal from employee)
then 'Higer than average'
            else 'below average'
            end) as remark
from employee;

-- using subquery in HAVING --
SELECT branch_id, COUNT(EMP_ID)
FROM employee
GROUP BY branch_id 
HAVING COUNT(emp_id) >
(SELECT AVG(c_emp)
from (SELECT BRANCH_ID, COUNT(EMP_ID) AS c_emp
FROM EMPLOYEE
GROUP BY BRANCH_ID) AS table_1)
;

-- using subquery with INSERT --
INSERT INTO employee_history
SELECT E.emp_id, E.first_name, E.last_name, E.birth_day, E.sex, E.salary, E.super_id, E.branch_id, C.client_id, C.client_name
FROM employee AS E
JOIN client AS C
ON E.branch_id = C.branch_id
WHERE NOT EXISTS ( SELECT 1
				   FROM employee_history AS EH
                   WHERE EH.emp_id = E.emp_id);
                   
-- using subquery with UPDATE --
UPDATE employee AS E
SET salary = ( SELECT MAX(SALARY) + (MAX(SALARY)*0.1)
			   FROM employee_history AS EH
               WHERE EH.branch_id = E.branch_id)
WHERE E.branch_id = 2;

-- using subqueries with DELETE --
delete from employee





