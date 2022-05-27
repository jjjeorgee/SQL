-- BASIC JOINS --
SELECT E.*, WW.*
FROM employee AS E
INNER JOIN works_with AS WW
ON E.emp_id = WW.emp_id;

SELECT E.*, WW.*
FROM employee AS E
LEFT JOIN works_with AS WW
ON E.emp_id = WW.emp_id;

SELECT E.*, WW.*
FROM employee AS E
RIGHT JOIN works_with AS WW
ON E.emp_id = WW.emp_id;

SELECT E.*, WW.*
FROM employee AS E
JOIN works_with AS WW
ON E.emp_id = WW.emp_id
UNION
SELECT E.*, WW.*
FROM employee AS E
LEFT JOIN works_with AS WW
ON E.emp_id = WW.emp_id;

-- CROSS JOIN --
SELECT E.emp_id, B.branch_id
FROM employee AS E
CROSS JOIN branch AS B;

SELECT E.first_name, B.branch_name, B.mgr_id
FROM  employee AS E
JOIN branch AS B
ON E.branch_id = B.branch_id;

-- NATURAL JOIN --
SELECT E.first_name, B.branch_name
FROM  employee AS E
NATURAL JOIN branch AS B;

-- SELF JOIN --
SELECT E1.first_name AS employee, E2.first_name AS supervisor
FROM employee AS E1
JOIN employee AS E2
ON E1.super_id = E2.emp_id;


	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    