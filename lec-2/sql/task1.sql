-- create table Doctor contain
-- id, name , salary , address
CREATE TABLE Doctor (
id number(2) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER(8),
    address VARCHAR2(100)
);


----------------------------------
-- please insert 10 row with Data as you like 
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Ahmed Hassan', 12000.50, 'Cairo, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Mona Youssef', 13500.00, 'Alexandria, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Karim Nabil', 11000.75, 'Giza, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Sara Adel', 14200.00, 'Mansoura, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Omar Tarek', 12800.00, 'Tanta, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Laila Samir', 15000.25, 'Aswan, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Hany Fathy', 10500.00, 'Zagazig, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Rania Said', 16000.00, 'Fayoum, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Mohamed Reda', 11800.00, 'Ismailia, Egypt');
INSERT INTO Doctor (name, salary, address) VALUES ('Dr. Dina Magdy', 13000.00, 'Suez, Egypt');


SELECT * FROM Doctor WHERE id =2;
-----------------------------------------
-- update record number 4 with salary 20000
UPDATE DOCTOR 
SET salary= 20000
WHERE id = 4;
----------------------------------
-- delete record number 9
DELETE DOCTOR
WHERE id =9 ;
-----------------------------------------
 -- please Concatenation all name with salary  of all rows
SELECT name || ' ' || salary AS Doctor_salarys FROM DOCTOR ;
----------------------------------
-- display all record with salary * 2
SELECT salary*2 FROM DOCTOR ;
-----------------------------------------
 -- select all data with salary  1000 , 2000 , 3000
 SELECT * FROM DOCTOR WHERE salary IN (20000 , 11800 ,15000); 
----------------------------------
-- rename table Doctor to PRD_DOCTOR
RENAME Doctor TO PRD_DOCTOR;


