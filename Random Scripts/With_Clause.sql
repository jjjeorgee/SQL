SELECT E1.*, E2.avg_sal
FROM employee AS E1
JOIN
(SELECT AVG(salary) AS avg_sal
FROM employee) AS E2
ON E1.salary > E2.avg_sal;

-- USING WITH --
WITH average_salary AS
	(SELECT AVG(salary) AS avg_sal 
    FROM employee AS E1)
SELECT *
    FROM employee E, average_salary AV
    WHERE E.salary > AV.avg_sal;
    
    WITH super_table AS
	(SELECT emp_id, first_name
    FROM  employee
    WHERE emp_id IN (SELECT DISTINCT super_id
    FROM employee))
SELECT E.first_name, ST.first_name
	FROM employee AS E, super_table AS  ST
    WHERE E.super_id = ST.emp_id;
    
    WITH avg_total_sales AS
	(SELECT AVG(TotalSales) avgts
	FROM Total_sales)
SELECT TS.branch_id, TS.TotalSales, ATS.avgts
FROM Total_sales AS TS, avg_total_sales AS ATS
WHERE TS.TotalSales > ATS.avgts;
