-- CTE --
WITH CTE_employee AS (
	SELECT first_name, last_name, sex, salary, branch_name,
	COUNT(sex) OVER  (PARTITION BY sex) AS TotalSex,
	AVG(salary) OVER (PARTITION BY sex) AS AvgSalary
FROM employee E
JOIN branch B
	ON E.branch_id = B.branch_id)
SELECT E.*, CTE.AvgSalary
	FROM employee E
    JOIN CTE_employee CTE
    ON E.salary = CTE.salary
    WHERE E.salary > CTE.AvgSalary;
    
-- TEMP TABLES --
CREATE TABLE EMP #TEMP_EMP
;

-- STRING FUNCTIONS --
-- TRIM FUNCTION --
SELECT employeeID, TRIM(EmployeeID) as IDDTRIM
FROM EmployeeErrors;

SELECT employeeID, LTRIM(EmployeeID) as IDDTRIM
FROM EmployeeErrors;

SELECT employeeID, RTRIM(EmployeeID) as IDDTRIM
FROM EmployeeErrors;

-- REPLACE FUNCTIONS --
SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM employeeerrors;

-- SUBSTRING FUNCTION --
Select Substring(err.first_name,1,3), Substring(dem.first_name,1,3)
FROM EmployeeErrors err
JOIN employee dem
	on Substring(err.first_name,1,3) = Substring(dem.first_name,1,3);
    
-- UPPER AND LOWER FUNCTIONS --
Select firstname, LOWER(firstname)
from EmployeeErrors;

Select Firstname, UPPER(FirstName)
from EmployeeErrors;

-- STORED PROCEURES --
DELIMITER //

CREATE PROCEDURE TEST_RUN()
	BEGIN
    SELECT  *
    FROM employee;
    END//
    DELIMITER ;

CALL TEST_RUN














