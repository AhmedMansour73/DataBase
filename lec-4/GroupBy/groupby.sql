-- 1. AVG Function
-- Question:
-- Write an SQL query to calculate the average salary of all employees from the EMPLOYEES table.
-- AVG ror Values = NOT null
SELECT  AVG(salary) FROM employees;						-- get average for 107 value
SELECT  AVG(COMMISSION_PCT) FROM employees; 			-- get average for 35 value
SELECT  AVG(NVL(COMMISSION_PCT , 0)) FROM employees;    -- get average for 107 value


-- 2. COUNT Function
-- Question:
-- Write an SQL query to count the total number of employees in the EMPLOYEES table.
-- count get values that = NOT NULL
SELECT  count(salary) FROM employees;  					-- 107
SELECT  count(*) FROM employees;       					-- 107
SELECT  count(employee_id) FROM employees;				-- 107
SELECT  count(COMMISSION_PCT) FROM employees;			-- 35
SELECT  count(NVL(COMMISSION_PCT,0)) FROM employees;    -- 107
SELECT  * FROM employees;								-- 107


-- 3. MAX Function
-- Question:
-- Write an SQL query to find the maximum salary offered in the EMPLOYEES table.
SELECT  max(salary) FROM employees;
SELECT  max(FIRST_NAME) FROM employees;    -- in String get max as ASCII Code

-- 4. MIN Function
-- Question:
-- Write an SQL query to find the minimum salary offered in the EMPLOYEES table.
SELECT  min(salary) FROM employees;
SELECT  Min(FIRST_NAME) FROM employees;    -- in String get min as ASCII Code

-- 5. SUM Function
-- Question:
-- Write an SQL query to calculate the total salary that the company pays to all employees.
-- Sumation for number
SELECT  sum(salary) FROM employees;       
SELECT  sum(FIRST_NAME) FROM employees;   -- error 


-- 6. GROUP BY Clause (Part 1)
-- Question:
-- Write an SQL query to display the department ID and the average salary of employees grouped by department from the EMPLOYEES table.
SELECT  DEPARTMENT_ID ,avg(salary) FROM employees
GROUP BY DEPARTMENT_ID;                    --- get null as value 

-- 7. GROUP BY Clause (Part 2)
-- Question:
-- Write an SQL query to show job ID and the total number of employees for each job title in the EMPLOYEES table.

SELECT  JOB_ID  ,count(*) FROM employees
GROUP BY JOB_ID;

-- 8. HAVING Clause
-- Question:
-- Write an SQL query to display the department ID and the total salary of employees only for departments where the total salary exceeds 50,000.
---    (Hint: Use GROUP BY and HAVING together.)

SELECT  DEPARTMENT_ID ,sum(salary) FROM employees
GROUP BY DEPARTMENT_ID
HAVING sum(SALARY) > 50000 ; 


-- 9. AVG Function (Advanced)
-- Question:
-- Write a query to find the average commission (COMMISSION_PCT) given to employees who have a non-null commission in the EMPLOYEES table.

SELECT  AVG(COMMISSION_PCT) FROM employees; 			-- get average for 35 value


-- 10. COUNT Function (Advanced)
-- Question:
-- Write a query to count how many employees have a salary greater than 10,000.
SELECT count(salary) FROM EMPLOYEES 
where salary > 10000;


-- 11. MAX and MIN Together
-- Question:
-- Write a query to find the maximum and minimum salary within each job ID using GROUP BY.
SELECT JOB_ID , min(salary) , max(salary) , count(*) FROM EMPLOYEES
GROUP BY JOB_ID ;

-- 12. SUM Function (Advanced)
-- Question:
-- Write a query to sum the salaries for each manager (MANAGER_ID) in the EMPLOYEES table.

SELECT  MANAGER_ID , sum(salary) , count(*) FROM EMPLOYEES
GROUP BY MANAGER_ID ;


-- 13. GROUP BY with Multiple Columns
-- Question:
-- Write a query to display department ID and job ID, and show the total salary for each group (department + job combination).

SELECT  JOB_ID, DEPARTMENT_ID  , sum(salary) FROM EMPLOYEES
GROUP BY JOB_ID, DEPARTMENT_ID   ;

-- 14. HAVING with COUNT
-- Question:
--- Write a query to display job ID and count of employees for each job, only show jobs that have more than 5 employees.

SELECT  JOB_ID , count(JOB_ID) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING count(JOB_ID) > 5;

-- 15. Using Aggregate Functions Together
-- Question:
-- Write a query to show each department ID with:

-- Total employees,

SELECT  DEPARTMENT_ID  , count(JOB_ID) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--Average salary,

SELECT  DEPARTMENT_ID  , avg(salary) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--Maximum salary,

SELECT  DEPARTMENT_ID  , max(salary) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Minimum salary,
-- and group them by department ID.
SELECT  DEPARTMENT_ID  , min(salary) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


SELECT  DEPARTMENT_ID  , count(JOB_ID) "employees in dept" , avg(salary) "Average salary for dept" , 
max(salary) "Maximum salary for dept" ,min(salary) "Minimum salary for dept" FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--16. Complex HAVING
-- Question:
-- Write a query to find all departments where:

-- The average salary is more than 8000,

SELECT  DEPARTMENT_ID  , avg(salary) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING avg(salary) > 8000;

-- And the number of employees is less than 10.

SELECT  DEPARTMENT_ID  , count(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING  count(*) < 10 ;

-- 17. Nested Aggregation
-- Question:
-- Write a query to find the department that has the highest total salary among all departments.

-- (Hint: You can use GROUP BY + ORDER BY DESC + FETCH FIRST 1 ROW ONLY.)

SELECT  DEPARTMENT_ID  , sum(salary) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
ORDER BY sum(salary) DESC 
FETCH FIRST 1 ROW ONLY ;

SELECT * FROM (
  SELECT DEPARTMENT_ID, SUM(salary) AS total_salary
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID
  ORDER BY total_salary DESC
)
WHERE ROWNUM = 1;



-- 18. Using Aliases with Aggregates
-- Question:
-- Write a query to show department ID, sum of salaries as Total_Salary, and average salary as Average_Salary, grouped by department ID.
SELECT  DEPARTMENT_ID  , sum(salary) Total_Salary , avg(salary) Average_Salary
 FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
