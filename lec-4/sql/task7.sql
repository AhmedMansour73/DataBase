-- 1. Character Functions – Part 3 (TRIM, LTRIM, RTRIM)
--  Create a table customers with a full_name column. Insert names with extra spaces at the beginning and/or end.

CREATE TABLE customers(
	full_name varchar2(50)
);

INSERT ALL
  INTO customers VALUES (  '   Mona   ')
  INTO customers VALUES (  '   Ahmed   ')
  INTO customers VALUES (  '   Youssef   ')
  INTO customers VALUES (  '   Karim   ')
  INTO customers VALUES (  '   Sara   ')
  INTO customers VALUES (  '   Heba   ')
  INTO customers VALUES (  '   Tamer   ')
  INTO customers VALUES (  '   Laila   ')
  INTO customers VALUES (  '   Islam   ')
  INTO customers VALUES (  '   Nour   ')
SELECT * FROM dual;


-- Write a query to remove both leading and trailing spaces from the names using TRIM.

SELECT TRIM(full_name) FROM customers;


-- Display only the names with leading spaces removed using LTRIM.
SELECT LTRIM(full_name) FROM customers;

-- Display only the names with trailing spaces removed using RTRIM.
SELECT RTRIM(full_name) FROM customers;

-- Trim specific characters (e.g., $, *, or #) from both sides of a given string.

SELECT TRIM(BOTH '*' FROM '*****my name is ahmed*****') FROM dual;
-----------------------
-----------------------
-----------------------

-- 2. Character Functions – Part 4 (REPLACE, LPAD, RPAD)
-- Replace all occurrences of the letter 'o' with '0' in the word “promotion”.
SELECT replace('promotion' , 'o'  ,'0') FROM dual;


--Replace the word “basic” with “advanced” in the sentence “This is a basic course”.
SELECT replace('This is a basic course' , 'basic'  ,'advanced') FROM dual

-- Create a PRODUCT table with product_name column. Insert at least 3 product names.
-- Format each product name to 15 characters by padding with ‘*’ on the left using LPAD.
SELECT LPAD(product_name , 15 , '*' ) FROM PRODUCT;

--Format each product name to 15 characters by padding with ‘-’ on the right using RPAD.
SELECT RPAD(product_name , 15 , '-' ) FROM PRODUCT;


--------------------------------
-- 3. TO_CHAR Function
-- Display the current date in the format DD-MON-YYYY.
SELECT TO_CHAR(sysdate , 'DD-MON-YYYY') FROM dual;


--Display the current date in the format Day, Month YYYY.
SELECT TO_CHAR(sysdate , 'Day, Month YYYY') FROM dual;


--Convert a number to a formatted string with commas and two decimal places using TO_CHAR.
SELECT TO_CHAR(11525 , '00,000') FROM dual;


Format an employee’s salary to include a currency symbol using TO_CHAR.
SELECT TO_CHAR(salary , '999,999.00') FROM employees;

-- Display system date in the format: YYYY/MM/DD HH24:MI:SS.
SELECT TO_CHAR(sysdate , 'YYYY/MM/DD HH24:MI:SS') FROM dual;


----------------------------------------


--- 4. Oracle Conditional Expressions – CASE Expressions
-- Create a students table with name and score columns. Insert at least 5 records.
-- created IN task 4

-- Write a query using CASE to assign grades based on the score:

--- 90 and above: A 80–89: B 70–79: C Below 70: F
SELECT  STUDENTS.* , CASE 
    				WHEN std_mark >= 90 THEN 'A'
    				WHEN std_mark >= 80 THEN 'B'
    				WHEN std_mark >= 70 THEN 'C'
    				ELSE 'F'
  					END AS GPA
FROM STUDENTS;

-- Modify the query to display “Pass” if score is 60 or more, otherwise “Fail”.
SELECT  STUDENTS.* , CASE 
    				WHEN std_mark >= 60 THEN 'Pass'
    				ELSE 'Fail'
  					END AS GPA
FROM STUDENTS;


--Use CASE to display a message for each student:

  -- "Excellent" for A, "Good" for B, "Average" for C, and "Needs Improvement" for F.

SELECT new_students.* , 
  					CASE 
    				WHEN GPA = 'A' THEN 'Excellent'
    				WHEN GPA = 'B' THEN 'Good'
    				WHEN GPA = 'C' THEN 'Average'
    				ELSE 'Needs Improvement'
  					END AS message
		FROM (SELECT  STUDENTS.* , CASE 
    				WHEN std_mark >= 90 THEN 'A'
    				WHEN std_mark >= 80 THEN 'B'
    				WHEN std_mark >= 70 THEN 'C'
    				ELSE 'F'
  					END AS GPA
		FROM STUDENTS
) new_students;

--Write a CASE expression using system date to return the name of the day (e.g., “Today is Monday”).

SELECT 
  CASE TO_CHAR(SYSDATE, 'DY')
    WHEN 'MON' THEN 'Today is Monday'
    WHEN 'TUE' THEN 'Today is Tuesday'
    WHEN 'WED' THEN 'Today is Wednesday'
    WHEN 'THU' THEN 'Today is Thursday'
    WHEN 'FRI' THEN 'Today is Friday'
    WHEN 'SAT' THEN 'Today is Saturday'
    WHEN 'SUN' THEN 'Today is Sunday'
    ELSE 'Unknown Day'
  END AS today_message
FROM dual;


------------------------------


-- 5. Oracle Conditional Expressions – DECODE Function

-- Use DECODE to return grade letters ('A', 'B', 'C', 'F') based on specific score values (e.g., 100 = A, 90 = B, etc.).

SELECT 
  STUDENTS.*,
  DECODE( TRUNC(std_mark/10) , 
   9,'A' ,
   8,'B' , 
   7,'C' , 
   'F'
   ) AS GPA
FROM STUDENTS;

-- Create a status_log table with a status_code column containing values like ‘N’, ‘I’, ‘C’.
INSERT ALL
	INTO ORDERS values('N')
	INTO ORDERS values('I')
	INTO ORDERS values('C')
SELECT * FROM dual;

-- Use DECODE to convert: ‘N’ → ‘New’ ‘I’ → ‘In Progress’ ‘C’ → ‘Completed’
SELECT 
  ORDERS.*,
  DECODE( status , 
   'P','Pending' ,
   'S','Shipped' , 
   'D','Delivered' , 
   'N','New' ,
   'I','In Progress' , 
   'C','Completed' , 
   'null'  -- write null if you wznt ciel is empty use null witout ''
   ) AS order_status
FROM ORDERS;


--- Use DECODE to check if a product’s quantity is 0, and display “Out of Stock”, otherwise “Available”.

SELECT 
  product_name,
  DECODE(0, 
         0, 'Out of Stock', 
         'Available') AS stock_status
FROM product;


--Write a query using DECODE to display a bonus:

-- If department is ‘HR’ → 500

-- If department is ‘IT’ → 1000

-- If department is ‘Sales’ → 1500

-- Else → 300

CREATE TABLE dept ( dept_name varchar2(50) );
INSERT ALL
	INTO DEPT values ( 'HR' )
	INTO dept values ('IT')
	INTO dept VALUES ('Sales')
SELECT * FROM dual;

SELECT 
  dept_name,
  DECODE(dept_name, 
         'HR', 500 ,
         'IT', 1000 , 
         'Sales', 1500 ,
          300) AS bonus
FROM dept;
