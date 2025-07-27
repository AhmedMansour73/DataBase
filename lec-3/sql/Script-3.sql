-- 1. Find all employee where the emp_id is within a certain range  100  and  105.
 SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID BETWEEN 100 AND 105; 

-- 2. Find all employee that belong to a specific set of emp_id  151 , 152, 153, 154 , 155.
 SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN (151 , 152, 153, 154 , 155);

-- 3. Retrieve all employee where the employee first_name starts with the letter 'P' OR 'p'
-- % -> any niber of chars 	or no    	_ -> one char  
SELECT FIRST_NAME  FROM EMPLOYEES WHERE FIRST_NAME LIKE 'P%' OR  FIRST_NAME LIKE 'p%';
SELECT FIRST_NAME  FROM EMPLOYEES WHERE LOWER( FIRST_NAME ) LIKE 'p%';

-- 4. Retrieve all employee where the employee first_name end with the letter 'A' OR 'a'
SELECT FIRST_NAME  FROM EMPLOYEES WHERE LOWER( FIRST_NAME ) LIKE '%a';

-- 5. Retrieve all employee where the employee first_name with the letter 'A' OR 'a'
SELECT FIRST_NAME  FROM EMPLOYEES WHERE LOWER( FIRST_NAME ) LIKE '%a%';

-- 6. Retrieve all employee where the employee first_name  third char with the letter 'e' OR 'E'
SELECT FIRST_NAME FROM employees WHERE SUBSTR(first_name, 3, 1) = 'e' OR SUBSTR(first_name, 3, 1) = 'E';
SELECT FIRST_NAME  FROM EMPLOYEES WHERE LOWER( FIRST_NAME ) LIKE '__e%';

-- 7. Retrieve all employees who don't have a manager assigned (i.e., manager_id is NULL).
SELECT *  FROM EMPLOYEES WHERE MANAGER_ID = NULL; --- XXX null not value  and not compare it by =
SELECT *  FROM EMPLOYEES WHERE MANAGER_ID IS NULL; 

-- 8. Find all employees who have a manager assigned.
SELECT *  FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;

-- 9. Insert a new employee without assigning a manager (NULL value for manager_id).

-- 10. Find all employees who work either in the 'AD_VP' JOB_ID or the 'IT_PROG' JOB_ID.
SELECT *  FROM EMPLOYEES WHERE JOB_ID ='AD_VP' OR JOB_ID ='IT_PROG';

--11. Retrieve all employees sorted by their last_name in ascending order.
SELECT FIRST_NAME  FROM EMPLOYEES ORDER BY FIRST_NAME ;

-- 12. Retrieve all employees sorted by their hire_date in descending order.
SELECT HIRE_DATE   FROM EMPLOYEES ORDER BY HIRE_DATE DESC  ;

-- 13. Sort employees first by department in ascending order and then by salary in descending order within each department_id.
SELECT DEPARTMENT_ID  ,SALARY   FROM EMPLOYEES ORDER BY DEPARTMENT_ID , salary DESC;


-- 14. Retrieve all employees with their last_name in lowercase
SELECT LAST_NAME  FROM EMPLOYEES WHERE LAST_NAME >= 'a';
SELECT LOWER( last_name )FROM employees;
-- 15. Retrieve all employees with their first_name in uppercase.
SELECT LAST_NAME  FROM EMPLOYEES WHERE LAST_NAME < 'a';
SELECT upper( last_name )FROM employees;

-- 16. Retrieve all employees with their first_name and last_name in title case (first letter capitalized).
SELECT INITCAP( FIRST_NAME  ) || ' '|| INITCAP( last_name ) AS full_name FROM employees;

-- 17. Find employees whose last_name is 'smith', regardless of the case.
SELECT last_name  FROM employees WHERE lower(LAST_NAME) ='smith' ;



SELECT * FROM employees WHERE ROWNUM = 10;



SELECT *
FROM ( SELECT e.*, ROWNUM AS ru FROM employees e )
WHERE ru = 5;

SELECT * FROM employees
OFFSET 4 ROWS FETCH NEXT 1 ROW ONLY;


