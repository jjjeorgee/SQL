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