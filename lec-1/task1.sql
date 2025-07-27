CREATE TABLE Manger(
	id NUMBER NOT NULL
	 , name VARCHAR2(50)    DEFAULT 'No Name'
	 , age number(3) 
	 , birth_date DATE  
	 , address VARCHAR2(100)
);

ALTER TABLE Manger DROP COLUMN address;

ALTER TABLE Manger ADD (city_address VARCHAR2(50) , street  VARCHAR2(50));

ALTER TABLE Manger RENAME COLUMN name TO full_name;

ALTER TABLE Manger READ ONLY;

ALTER TABLE Manger READ WRITE;

CREATE TABLE Owner AS
SELECT id, full_name, birth_date
FROM Manger
WHERE 1=-1;

ALTER TABLE Manger RENAME TO Master;

DROP TABLE Owner;
DROP TABLE Master;
/*
 * DROP TABLE Owner , Master;
 * in Oracle 21c
 */



