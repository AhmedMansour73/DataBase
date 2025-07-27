-- Q1. Create a table called EMP_TEST with a column NAME having leading and trailing spaces.
CREATE TABLE EMP_TEST(
	emp_id number(3),
	emp_fname varchar2(50),
	emp_Lname varchar2(50),
	emp_age number(3),
	emp_adress varchar2(100),
	emp_salary number(6),
	emp_hire_date date
);

INSERT ALL
  INTO EMP_TEST VALUES (1,  '   Ahmed   ', 'Hassan', 30, 'Cairo', 12000, TO_DATE('2020-01-15','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (2,  '   Mona   ', 'Ali', 28, 'Giza', 11500, TO_DATE('2021-03-20','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (3,  '   Youssef   ', 'Said', 35, 'Alexandria', 14000, TO_DATE('2019-05-10','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (4,  '   Karim   ', 'Nabil', 32, 'Tanta', 13000, TO_DATE('2022-07-01','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (5,  '   Sara   ', 'Adel', 26, 'Aswan', 11000, TO_DATE('2023-02-11','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (6,  '   Heba   ', 'Mostafa', 29, 'Zagazig', 12500, TO_DATE('2021-09-05','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (7,  '   Tamer   ', 'Fathy', 38, 'Mansoura', 14500, TO_DATE('2018-11-18','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (8,  '   Laila   ', 'Mahmoud', 27, 'Sohag', 11200, TO_DATE('2020-06-23','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (9,  '   Islam   ', 'Farouk', 31, 'Qena', 11800, TO_DATE('2022-01-01','YYYY-MM-DD'))
  INTO EMP_TEST VALUES (10, '   Nour   ', 'Samir', 33, 'Minya', 13500, TO_DATE('2019-08-30','YYYY-MM-DD'))
SELECT * FROM dual;


-- Q2. Display all names using TRIM to remove both leading and trailing spaces.

SELECT TRIM(emp_fname) FROM EMP_TEST;
SELECT TRIM(BOTH ' ' emp_fname) FROM EMP_TEST;
-- Q3. Use LTRIM to remove only leading spaces.
SELECT lTRIM(emp_fname) FROM EMP_TEST;


-- Q4. Use RTRIM to remove only trailing spaces.
SELECT RTRIM(emp_fname) FROM EMP_TEST;

-- Q5. Use TRIM to remove a specific character (e.g., ‘*’ or ‘#’) from both sides of a string.

SELECT TRIM(BOTH '*' FROM '******* ahmed ##########') AS string FROM dual;
SELECT TRIM(BOTH '#' FROM '******* ahmed ##########') AS string FROM dual;
SELECT TRIM(LEADING '*' FROM '******* ahmed ##########') AS string FROM dual;
SELECT TRIM(TRAILING '#' FROM '******* ahmed ##########') AS string FROM dual;

--- 
-- rmove m or y not my until see char not  like m or y
---
-- LTRIM , RTRIM , REGEXP_REPLACE  get mor than on char

SELECT LTRIM ('ymmy Name is Ahmedmmy', 'my') name from dual;
SELECT RTRIM ('ymmy Name is Ahmedmmy', 'my') name from dual;
SELECT 
    REGEXP_REPLACE(
        REGEXP_REPLACE('ymmy Name is Ahmedmmy', '^my|^ym|^m|^y', ''),
        'my$|ym$|m$|y$', ''
    ) AS result
FROM dual;





-------------------------------------------------------------------------------------------------------
--											task 2													 --
-------------------------------------------------------------------------------------------------------

-- Q1. Use REPLACE to replace the letter 'a' with '@' in the word 'database'.
SELECT REPLACE('database', 'a', '@')  text FROM dual;

-- Q2. Use REPLACE to replace a full word in a string (e.g., "old" with "new").
SELECT REPLACE('This is an old car', 'old', 'new') AS text FROM dual;

-- Q3. Create a table PRODUCT with a product_name column, and insert 3 sample products.
CREATE TABLE PRODUCT( product_name varchar2(50));
INSERT ALL
	INTO PRODUCT values('one')
	INTO PRODUCT values('tow')
	INTO PRODUCT values('three')
SELECT * FROM dual;

-- Q4. Use LPAD to format product names to 15 characters by padding with '*' on the left.
SELECT LPAD( product_name , 15 , '*') text FROM PRODUCT;

-- Q5. Use RPAD to format product names to 15 characters by padding with '#' on the right.
SELECT RPAD( product_name , 15 , '#') text FROM PRODUCT;

-- if length you want to select small than lentgth of of string 
-- will cout String 
SELECT RPAD( 'my name is ahmed' , 10 , '#') text FROM dual;


-------------------------------------------------------------------------------------------------------
--											task 3													 --
-------------------------------------------------------------------------------------------------------

-- Q1. Display current date in the format 'DD-MON-YYYY'.
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') AS current_date FROM dual;

-- Q2. Display current date in the format 'Month YYYY'.
SELECT TO_CHAR(SYSDATE, 'Month YYYY') AS current_date FROM dual;

-- Q3. Convert a number to character using TO_CHAR with formatting (e.g., 12345.67 as '12,345.67').
SELECT TO_CHAR(12345.67, '00,000.00') AS current_date FROM dual;

-- Q4. Show salary formatted with a currency symbol.
SELECT TO_CHAR(emp_salary , '000,000.000L') text FROM EMP_TEST;


-------------------------------------------------------------------------------------------------------
--											task 4													 --
-------------------------------------------------------------------------------------------------------

-- Q1. Create a table STUDENTS with columns: name, marks.
CREATE TABLE STUDENTS( std_name varchar2(100), std_mark NUMBER(2));

-- Q2. Insert 5 sample students with marks.
INSERT ALL
	INTO STUDENTS values('Ahmed' , 95)
	INTO STUDENTS values('Omr' , 87)
	INTO STUDENTS values('Ali', 60)
	INTO STUDENTS values('Mohammed', 77)
	INTO STUDENTS values('Mustafa', 82)
SELECT * FROM dual;

-- Q3. Use CASE to assign grades: 
--     >=90 => 'A', 80–89 => 'B', 70–79 => 'C', else => 'F'

-- case like switch if condiation true execute code then exit from case
SELECT  STUDENTS.* , CASE 
    				WHEN std_mark >= 90 THEN 'A'
    				WHEN std_mark >= 80 THEN 'B'
    				WHEN std_mark >= 70 THEN 'C'
    				ELSE 'F'
  					END AS GPA
FROM STUDENTS;


-------------------------------------------------------------------------------------------------------
--											task 5													 --
-------------------------------------------------------------------------------------------------------

-- Q1. Use DECODE to achieve the same result as the CASE example above.

SELECT FLOOR(std_mark/10) FROM STUDENTS; -- Round down
SELECT TRUNC(std_mark/10) FROM STUDENTS; -- Cut fractions without rounding

SELECT 
  STUDENTS.*,
  DECODE( FLOOR(std_mark/10) , 
   9,'A' ,
   8,'B' , 
   7,'C' , 
   'F'
   ) AS GPA
FROM STUDENTS;



-- Q2. Create a table ORDERS with a column status ('P', 'S', 'D').

CREATE TABLE ORDERS( status varchar2(50) );
INSERT ALL
	INTO ORDERS values('P')
	INTO ORDERS values('S')
	INTO ORDERS values('D')
SELECT * FROM dual;

-- Q3. Use DECODE to display full form of status:
--     'P' => 'Pending', 'S' => 'Shipped', 'D' => 'Delivered'
SELECT 
  ORDERS.*,
  DECODE( status , 
   'P','Pending' ,
   'S','Shipped' , 
   'D','Delivered' , 
   'null'  -- write null if you wznt ciel is empty use null witout ''
   ) AS order_status
FROM ORDERS;


-------------------------------------------------------------------------------------------------------
--											task 6	same as task 5									 --
-------------------------------------------------------------------------------------------------------


