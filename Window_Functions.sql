-- PARTITION BY --
SELECT *, 
	MAX(salary) OVER (PARTITION BY branch_id) AS max_salary
	FROM employee;

-- ROW NUMBER, RANK, DENSE_RANK,LEAD AND LAG
-- row_number
SELECT * 
FROM(
	SELECT E.*, B.branch_name,
	ROW_NUMBER () OVER (PARTITION BY branch_id ORDER BY emp_id) AS RN
	FROM employee AS E
	JOIN branch AS B
	ON E.branch_id = B.branch_id) AS X
WHERE X.RN < 4;

-- rank
SELECT * 
FROM(
SELECT E.*, B.branch_name,
	RANK () OVER (PARTITION BY branch_id ORDER BY SALARY DESC) AS RNK
	FROM employee AS E
	JOIN branch AS B
	ON E.branch_id = B.branch_id) AS X
WHERE X.RNK < 4;

-- dense_rank
SELECT E.*, B.branch_name,
	RANK () OVER (PARTITION BY branch_id ORDER BY SALARY DESC) AS RNK,
    DENSE_RANK () OVER (PARTITION BY branch_id ORDER BY SALARY DESC) AS D_RNK
	FROM employee AS E
	JOIN branch AS B
	ON E.branch_id = B.branch_id;
    
-- lag and lag
SELECT *, 
CASE 
	WHEN ENK.PES = 0 THEN 'no previous salary'
	WHEN ENK.PES < salary THEN 'previous salary lower '
    ELSE 'previous salary higher '
END AS REMARK
FROM(
	SELECT E.*, B.branch_name,
		LAG (salary, 1, 0) OVER (PARTITION BY branch_id ORDER BY emp_id) AS PES,
		LEAD (salary, 1, 0) OVER (PARTITION BY branch_id ORDER BY emp_id) AS NES
		FROM employee AS E
		JOIN branch AS B
		ON E.branch_id = B.branch_id) AS ENK;
        
-- FIRST_VALUE --
SELECT *,
	FIRST_VALUE(first_name) 
	OVER (PARTITION BY branch_id 
    ORDER BY salary DESC) AS highest_salary
FROM employee;

-- LAST_VALUE --
SELECT *,
	LAST_VALUE(first_name) 
	OVER (PARTITION BY branch_id 
    ORDER BY salary DESC) AS lowest_salary
FROM employee;

-- NTH VALUE --
SELECT *,
	NTH_VALUE(first_name, 2) 
	OVER (PARTITION BY branch_id 
    ORDER BY salary DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) AS second_most_exp_product_salary
FROM employee;

-- NTILE --
SELECT *,
NTILE(3) OVER (order by salary DESC)
FROM employee
WHERE branch_id = 2;

-- CUME_DIST
SELECT *,
CUME_DIST() OVER (ORDER BY salary DESC) AS Cume_distribution,
ROUND(CUME_DIST() OVER (ORDER BY salary DESC) * 100, 2) AS Cume_distribution_percenage
FROM employee;

-- PERCENT RANK --
SELECT *,
PERCENT_RANK() OVER (ORDER BY salary ) AS Rank_distribution,
ROUND(PERCENT_RANK() OVER (ORDER BY salary ) * 100, 2) AS Rank_distribution_percenage
FROM employee;

-- FRAME FUNNCTIONS --
SELECT *,
	LAST_VALUE(first_name) 
	OVER (PARTITION BY branch_id 
    ORDER BY salary DESC
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_salary
FROM employee;

SELECT *,
	LAST_VALUE(first_name) 
	OVER  (PARTITION BY branch_id 
    ORDER BY salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_salary
FROM employee;

-- ALTERNATE WAY OF WRITING QUERY WITH WINDOW --
SELECT E.*, B.branch_name,
	RANK () OVER W AS RNK,
    DENSE_RANK () OVER W AS D_RNK
	FROM employee AS E
	JOIN branch AS B
	ON E.branch_id = B.branch_id
    WINDOW W AS
    (PARTITION BY branch_id ORDER BY SALARY DESC);


