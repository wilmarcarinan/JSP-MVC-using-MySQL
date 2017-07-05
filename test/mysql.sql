-- ------------------------------------------------------
--  File created - Saturday-June-04-2016   
-- ------------------------------------------------------
-- ------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
-- ------------------------------------------------------

   CALL  CreateSequence('`GAS`.`DEPARTMENTS_SEQ`', 280, 10)    ;
-- ------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
-- ------------------------------------------------------

   CALL  CreateSequence('`GAS`.`EMPLOYEES_SEQ`', 1153, 1)    ;
-- ------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
-- ------------------------------------------------------

   CALL  CreateSequence('`GAS`.`LOCATIONS_SEQ`', 3300, 100)    ;
-- ------------------------------------------------------
--  DDL for Table COUNTRIES
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`COUNTRIES` 
   (	`COUNTRY_ID` CHAR(2) COMMENT 'Primary key of countries table.', 
	`COUNTRY_NAME` VARCHAR(40) COMMENT 'Country name', 
	`REGION_ID` DOUBLE COMMENT 'Region ID for the country. Foreign key to region_id column in the departments table.', 
	 CONSTRAINT `COUNTRY_C_ID_PK` PRIMARY KEY (`COUNTRY_ID`) 
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS` 
 PCTTHRESHOLD 50;

   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`COUNTRIES`.`COUNTRY_ID` IS 'Primary key of countries table.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`COUNTRIES`.`COUNTRY_NAME` IS 'Country name'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`COUNTRIES`.`REGION_ID` IS 'Region ID for the country. Foreign key to region_id column in the departments table.'; */
   ALTER TABLE `GAS`.`COUNTRIES`  COMMENT 'country table. Contains 25 rows. References with locations table.';
-- ------------------------------------------------------
--  DDL for Table DEPARTMENTS
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`DEPARTMENTS` 
   (	`DEPARTMENT_ID` SMALLINT COMMENT 'Primary key column of departments table.', 
	`DEPARTMENT_NAME` VARCHAR(30) COMMENT 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ', 
	`MANAGER_ID` INT COMMENT 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.', 
	`LOCATION_ID` SMALLINT COMMENT 'Location id where a department is located. Foreign key to location_id column of locations table.'
   ) 
  ;

   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`DEPARTMENTS`.`DEPARTMENT_ID` IS 'Primary key column of departments table.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`DEPARTMENTS`.`DEPARTMENT_NAME` IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. '; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`DEPARTMENTS`.`MANAGER_ID` IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`DEPARTMENTS`.`LOCATION_ID` IS 'Location id where a department is located. Foreign key to location_id column of locations table.'; */
   ALTER TABLE `GAS`.`DEPARTMENTS`  COMMENT 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
-- ------------------------------------------------------
--  DDL for Table EMPLOYEES
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`EMPLOYEES` 
   (	`EMPLOYEE_ID` INT COMMENT 'Primary key of employees table.', 
	`FIRST_NAME` VARCHAR(20) COMMENT 'First name of the employee. A not null column.', 
	`LAST_NAME` VARCHAR(25) COMMENT 'Last name of the employee. A not null column.', 
	`EMAIL` VARCHAR(25) COMMENT 'Email id of the employee', 
	`PHONE_NUMBER` VARCHAR(20) COMMENT 'Phone number of the employee; includes country code and area code', 
	`HIRE_DATE` DATETIME COMMENT 'Date when the employee started on this job. A not null column.', 
	`JOB_ID` VARCHAR(10) COMMENT 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.', 
	`SALARY` DECIMAL(8,2) COMMENT 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)', 
	`COMMISSION_PCT` DECIMAL(2,2) COMMENT 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage', 
	`MANAGER_ID` INT COMMENT 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)', 
	`DEPARTMENT_ID` SMALLINT COMMENT 'Department id where employee works; foreign key to department_id
column of the departments table'
   ) 
  ;

   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`EMPLOYEE_ID` IS 'Primary key of employees table.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`FIRST_NAME` IS 'First name of the employee. A not null column.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`LAST_NAME` IS 'Last name of the employee. A not null column.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`EMAIL` IS 'Email id of the employee'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`PHONE_NUMBER` IS 'Phone number of the employee; includes country code and area code'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`HIRE_DATE` IS 'Date when the employee started on this job. A not null column.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`JOB_ID` IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`SALARY` IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`COMMISSION_PCT` IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`MANAGER_ID` IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`EMPLOYEES`.`DEPARTMENT_ID` IS 'Department id where employee works; foreign key to department_id
column of the departments table'; */
   ALTER TABLE `GAS`.`EMPLOYEES`  COMMENT 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
-- ------------------------------------------------------
--  DDL for Table JOBS
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`JOBS` 
   (	`JOB_ID` VARCHAR(10) COMMENT 'Primary key of jobs table.', 
	`JOB_TITLE` VARCHAR(35) COMMENT 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT', 
	`MIN_SALARY` INT COMMENT 'Minimum salary for a job title.', 
	`MAX_SALARY` INT COMMENT 'Maximum salary for a job title'
   ) 
  ;

   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOBS`.`JOB_ID` IS 'Primary key of jobs table.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOBS`.`JOB_TITLE` IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOBS`.`MIN_SALARY` IS 'Minimum salary for a job title.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOBS`.`MAX_SALARY` IS 'Maximum salary for a job title'; */
   ALTER TABLE `GAS`.`JOBS`  COMMENT 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
-- ------------------------------------------------------
--  DDL for Table JOB_HISTORY
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`JOB_HISTORY` 
   (	`EMPLOYEE_ID` INT COMMENT 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table', 
	`START_DATE` DATETIME COMMENT 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)', 
	`END_DATE` DATETIME COMMENT 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)', 
	`JOB_ID` VARCHAR(10) COMMENT 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.', 
	`DEPARTMENT_ID` SMALLINT COMMENT 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table'
   ) 
  ;

   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOB_HISTORY`.`EMPLOYEE_ID` IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOB_HISTORY`.`START_DATE` IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOB_HISTORY`.`END_DATE` IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOB_HISTORY`.`JOB_ID` IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`JOB_HISTORY`.`DEPARTMENT_ID` IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table'; */
   ALTER TABLE `GAS`.`JOB_HISTORY`  COMMENT 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
-- ------------------------------------------------------
--  DDL for Table LOCATIONS
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`LOCATIONS` 
   (	`LOCATION_ID` SMALLINT COMMENT 'Primary key of locations table', 
	`STREET_ADDRESS` VARCHAR(40) COMMENT 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name', 
	`POSTAL_CODE` VARCHAR(12) COMMENT 'Postal code of the location of an office, warehouse, or production site
of a company. ', 
	`CITY` VARCHAR(30) COMMENT 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ', 
	`STATE_PROVINCE` VARCHAR(25) COMMENT 'State or Province where an office, warehouse, or production site of a
company is located.', 
	`COUNTRY_ID` CHAR(2) COMMENT 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.'
   ) 
  ;

   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`LOCATIONS`.`LOCATION_ID` IS 'Primary key of locations table'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`LOCATIONS`.`STREET_ADDRESS` IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`LOCATIONS`.`POSTAL_CODE` IS 'Postal code of the location of an office, warehouse, or production site
of a company. '; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`LOCATIONS`.`CITY` IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. '; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`LOCATIONS`.`STATE_PROVINCE` IS 'State or Province where an office, warehouse, or production site of a
company is located.'; */
   /* Moved to CREATE TABLE
COMMENT ON COLUMN `GAS`.`LOCATIONS`.`COUNTRY_ID` IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.'; */
   ALTER TABLE `GAS`.`LOCATIONS`  COMMENT 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
-- ------------------------------------------------------
--  DDL for Table REGIONS
-- ------------------------------------------------------

  CREATE TABLE `GAS`.`REGIONS` 
   (	`REGION_ID` DOUBLE, 
	`REGION_NAME` VARCHAR(25)
   ) 
  ;
-- ------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
-- ------------------------------------------------------

  CREATE OR REPLACE VIEW `GAS`.`EMP_DETAILS_VIEW` (`EMPLOYEE_ID`, `JOB_ID`, `MANAGER_ID`, `DEPARTMENT_ID`, `LOCATION_ID`, `COUNTRY_ID`, `FIRST_NAME`, `LAST_NAME`, `SALARY`, `COMMISSION_PCT`, `DEPARTMENT_NAME`, `JOB_TITLE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_NAME`, `REGION_NAME`) AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
;
-- INSERTING into GAS.COUNTRIES
/* SET DEFINE OFF; */
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AA','Attaa',2);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AB','Abba',2);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AC','Edit Later',4);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AD','Adidas',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil',2);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada',2);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt',4);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel',4);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Puwait',4);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ML','Malaysia',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico',2);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria',4);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NN','Ninaland',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore',3);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom',1);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America',2);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia',4);
Insert into GAS.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe',4);
-- INSERTING into GAS.DEPARTMENTS
/* SET DEFINE OFF; */
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (10,'Administration',200,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (20,'Marketing',201,1800);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (30,'Purchasing',114,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (40,'Human Resources',203,2400);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (50,'Shipping',121,1500);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (60,'IT',103,1400);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (70,'Public Relations',204,2700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (80,'Sales',145,2500);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (90,'Executive',100,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (100,'Finance',108,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (110,'Accounting',205,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (120,'Treasury',120,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (130,'Corporate Tax',132,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (140,'Control And Credit',141,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (150,'Shareholder Services',152,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (160,'Benefits',168,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (170,'Manufacturing',156,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (180,'Construction',111,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (190,'Contracting',112,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (200,'Operations',113,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (210,'IT Support',115,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (220,'NOC',169,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (230,'IT Helpdesk',170,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (240,'Government Sales',171,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (250,'Retail Sales',172,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (260,'Recruiting',173,1700);
Insert into GAS.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (270,'Payroll',174,1700);
-- INSERTING into GAS.EMPLOYEES
/* SET DEFINE OFF; */
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (100,'Deedeeg','James','jamesDean33@grs.com','111.111.112',str_to_date('05/25/2016','%m/%d/%Y'),'MK_MAN',12000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (101,'Krissy','Aquino','NKOCHHAR@yahoo.com','515.123.4567',str_to_date('09/21/2005','%m/%d/%Y'),'AD_VP',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (102,'Lexi','DeHaan','lexz@dehaan.com','111.222.335',str_to_date('11/10/2015','%m/%d/%Y'),'SA_REP',null,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (103,'Bill','Gates','bill@gates.com','123-456-787',str_to_date('11/11/2015','%m/%d/%Y'),'IT_PROG',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (104,'Bruce','Lee','BERNST@aaa.cc','590.423.458',str_to_date('09/07/2007','%m/%d/%Y'),'IT_PROG',null,null,60,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (105,'David','Austin','DAUSTIN@email.com','590-423-498',str_to_date('06/25/2015','%m/%d/%Y'),'IT_PROG',null,null,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (106,'Valli','Pataballa','VPATABAL@gmail.com','590.423.456',str_to_date('02/05/2006','%m/%d/%Y'),'SH_CLERK',null,null,50,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (107,'Pokoro','Lester','dlorentz@yahoo.com.ph','590.423.5567',str_to_date('07/25/2008','%m/%d/%Y'),'PR_REP',null,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (108,'Cynthia','Luster','NGREENBE@gg.ss','515.124.45695',str_to_date('09/17/2002','%m/%d/%Y'),'FI_MGR',null,null,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (109,'Matsu','Naga','mncity@city.com','785.45.61',str_to_date('08/05/2002','%m/%d/%Y'),'FI_ACCOUNT',null,null,108,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (110,'John','Cena','JCHEN@Ching.cOM.PH','515.124.4269',str_to_date('09/30/2005','%m/%d/%Y'),'FI_ACCOUNT',8200,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (111,'Ismaela','Sciarre','ISCIARRA@yaho.com','515.124.4369',str_to_date('09/30/2005','%m/%d/%Y'),'PU_MAN',8000,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (112,'Jose','Urman','JMURMAN@gmoy.com','515.124.4469',str_to_date('04/29/2015','%m/%d/%Y'),'HR_REP',7800,null,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (113,'Louis','CK','LPOPP@gmoy.com','515-124-4567',str_to_date('05/21/2015','%m/%d/%Y'),'FI_ACCOUNT',6900,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (114,'Denz','Raphaely','DRAPHEAL@gmail.com','546789',str_to_date('12/19/2002','%m/%d/%Y'),'PU_CLERK',2500,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (115,'Alexander','Khoo','AKHOO@.com','515.127.4562',str_to_date('05/18/2003','%m/%d/%Y'),'PU_CLERK',3100,null,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (116,'Shelli','Baida','SBAIDA@yahoo.com','45241045',str_to_date('12/20/2005','%m/%d/%Y'),'AD_VP',18000,null,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (117,'Sigal','Tobias','STOBIAS@yahoo.com','515.127.4564',str_to_date('07/07/2014','%m/%d/%Y'),'AD_ASST',4500,null,112,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (118,'Guy','Himuro','GHIMURO@.com','515.127.4565',str_to_date('12/05/2006','%m/%d/%Y'),'PU_MAN',8000,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (119,'Karenz','Colmenarez','KCOLMENAZ@.com','5151274566',str_to_date('05/01/2015','%m/%d/%Y'),'MK_MAN',9000,null,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (120,'Matthew','Weiss','MWEISS@weiss.com','650.123.1234',str_to_date('06/01/2015','%m/%d/%Y'),'IT_PROG',8000,0,100,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (121,'Adama','Fripp','AFRIPP@company.com','650.123.2234',str_to_date('04/18/2005','%m/%d/%Y'),'AD_PRES',20800,0.2,112,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (122,'Payama','Kaufling','PKAUFLIN@company.com','650.123.3234',str_to_date('05/01/2003','%m/%d/%Y'),'FI_ACCOUNT',4200,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (123,'Shantaz','Vollmanz','SVOLLMANz@yg.com','468.115.320',str_to_date('10/10/2005','%m/%d/%Y'),'ST_MAN',6500,0,100,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (124,'Kevin','Mourgos','KMOURGOS@yg.com','650.123.5234',str_to_date('11/16/2007','%m/%d/%Y'),'ST_MAN',5800,0,100,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (125,'Julia','Nayer','JNAYER@yg.com','650.124.1214',str_to_date('08/02/2005','%m/%d/%Y'),'AC_MGR',8200,0,120,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (126,'Irene','yun','irene@yun.com','650.124.1224',str_to_date('04/27/2015','%m/%d/%Y'),'SA_MAN',10000,0,120,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (127,'James','Landry','JLANDRY@comp.com','650.124.1334',str_to_date('05/07/2015','%m/%d/%Y'),'PU_CLERK',15500,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (128,'Steven','Markle','SMARKLE@yg.com','650.124.1434',str_to_date('03/08/2008','%m/%d/%Y'),'ST_CLERK',2200,0,120,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (129,'Laurael','BissotT','LBISSOT@ymail.com','650.124.5234',str_to_date('09/12/2005','%m/%d/%Y'),'ST_MAN',8000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (130,'Rowans','AtkinsonS','MATKINSO@gmail.com','650.124.6234',str_to_date('10/30/2005','%m/%d/%Y'),'SH_CLERK',2800,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (131,'James','Marlow','JAMRLOW@gg.com','650.124.7234',str_to_date('03/17/2005','%m/%d/%Y'),'FI_ACCOUNT',9000,0.25,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (132,'TJ','Olson','TJOLSON','650.124.8234',str_to_date('04/10/2007','%m/%d/%Y'),'ST_CLERK',2100,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (133,'Jason','Mallin','jmallin@company.com','650.127.1934',str_to_date('06/14/2004','%m/%d/%Y'),'ST_CLERK',3300,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (134,'Michael','Rogers','MROGERS','650.127.1834',str_to_date('08/29/2006','%m/%d/%Y'),'ST_MAN',2900,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (135,'Ariana','Venti','Aventi','951-743-0286',str_to_date('12/12/2007','%m/%d/%Y'),'ST_CLERK',2400,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (136,'Hazel','Philtanker','hphiltanker@company.com','650-127-1634',str_to_date('02/06/2008','%m/%d/%Y'),'ST_CLERK',2200,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (137,'Renskez','Ladwigz','RLADWIG','33234234',str_to_date('07/15/2003','%m/%d/%Y'),'ST_MAN',3600,0,123,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (138,'Stephen','Stiles','sstiles@gmail.com','650.121.2034',str_to_date('05/19/2015','%m/%d/%Y'),'PR_REP',3200,0,123,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (139,'Johnny','Eksdi','jseo@yahoo.com','650-121-2019',str_to_date('06/21/2006','%m/%d/%Y'),'AC_MGR',8500,0,174,270);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (140,'Joshua','Patel','JPATEL@lkjsad.com','650.121.1834',str_to_date('09/19/2015','%m/%d/%Y'),'FI_ACCOUNT',7500,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (141,'Trenna Segsual','Rajs','trenny@sesguals.com','650.121.8009',str_to_date('10/17/2003','%m/%d/%Y'),'ST_CLERK',3500,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (142,'Curtis','Davies','CDAVIES@gg.com','650.121.2994',str_to_date('02/14/2005','%m/%d/%Y'),'SA_MAN',10000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (143,'Wendell','Matos','wmatos@gmol.com','650.121.2874',str_to_date('04/06/2010','%m/%d/%Y'),'ST_CLERK',2600,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (145,'John','Russell','JRUSSEL','011.44.1344.429268',str_to_date('10/07/2004','%m/%d/%Y'),'MK_REP',14000,0.4,100,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (146,'Karen','Partners','KPARTNER@ya.ho','011.404.1344',str_to_date('02/02/2005','%m/%d/%Y'),'SA_REP',7000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',str_to_date('03/10/2005','%m/%d/%Y'),'SA_MAN',12000,0.3,100,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',str_to_date('10/22/2007','%m/%d/%Y'),'SA_REP',11000,0.3,100,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',str_to_date('01/29/2008','%m/%d/%Y'),'SA_MAN',10500,0.2,100,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (150,'Mark','Tucker','PTUCKER@gmail.com','011.444.1344',str_to_date('01/30/2005','%m/%d/%Y'),'SA_REP',10000,0.3,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (151,'David','Bernstein','DBERNSTE','011.44.1344.345268',str_to_date('03/24/2005','%m/%d/%Y'),'SA_MAN',9500,0.25,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (152,'Peter','James','peter_hall@gmail.com','011.441.1344',str_to_date('08/20/2004','%m/%d/%Y'),'SA_REP',9000,0,201,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (153,'Christopher','Olsen','COLSEN','011.44.1344.498718',str_to_date('03/30/2006','%m/%d/%Y'),'SA_REP',8000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (154,'Nanettei','Cambrault','NCAMBRAU','011.44.1344.987668',str_to_date('12/09/2006','%m/%d/%Y'),'SA_REP',7500,0.2,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',str_to_date('11/23/2007','%m/%d/%Y'),'SA_REP',7000,0.15,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (156,'Janette','King','JKING','011.44.1345.429268',str_to_date('01/30/2004','%m/%d/%Y'),'PU_MAN',10000,0.35,146,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (157,'James','Sullivan','james_sullivan@yahoo.com','111.222.333',str_to_date('03/04/2004','%m/%d/%Y'),'AD_ASST',6000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (158,'Allan','McEwen','amcewen@yahoo.com','011.44.1345.829268',str_to_date('08/01/2004','%m/%d/%Y'),'SA_REP',9000,0.35,146,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (159,'Lindsey','Smith','LSMITH@kkk.com','011.644.4444',str_to_date('03/12/2005','%m/%d/%Y'),'AD_PRES',8000,0,146,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (160,'Louise','Doa','LDORAN@ddd.cc','011.44.1345.629268',str_to_date('04/24/2015','%m/%d/%Y'),'MK_MAN',7500,0.3,146,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (161,'Sarah','Wiliamsn','wilson@gmail.com','559599-56-89',str_to_date('11/03/2006','%m/%d/%Y'),'SA_REP',7001,0.27,146,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (162,'Claraty','Vishney','CVISHNEY@yahoo.com','334.998.1231',str_to_date('11/11/2005','%m/%d/%Y'),'SA_REP',10500,0,147,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (163,'Danielle','Greene','dgreene@gmail.com','011.44.1346.229268',str_to_date('03/19/2007','%m/%d/%Y'),'SA_REP',9500,0.15,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (164,'Mattea','Marvins','MMARVINS@otw.com','011.44.1346.329268',str_to_date('01/24/2008','%m/%d/%Y'),'SA_REP',7200,0.1,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (165,'David','Lee','DLEE','011.44.1346.529268',str_to_date('02/23/2008','%m/%d/%Y'),'SA_REP',6800,0.1,147,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (166,'Sundar','Ande','SANDE','011.44.1346.629268',str_to_date('03/24/2008','%m/%d/%Y'),'SA_REP',6400,0.1,147,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (167,'Amit','Banda','ABANDA','011.44.1346.729268',str_to_date('04/21/2008','%m/%d/%Y'),'SA_REP',6200,0.1,147,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (168,'Lisa','Ozer','lozer@gmail.com','011.440.1010',str_to_date('04/11/2005','%m/%d/%Y'),'SA_MAN',11500,0.25,148,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (169,'Harrison','Bloom','HBLOOM','011.44.1343.829268',str_to_date('03/23/2006','%m/%d/%Y'),'SA_REP',10000,0.2,148,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (170,'Taylors','Foxers','tfoxzs@yahoo.com','123.456.5220',str_to_date('02/28/2010','%m/%d/%Y'),'PR_REP',9600,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (171,'William','Smith','WSMITH','011.44.1343.629268',str_to_date('02/23/2007','%m/%d/%Y'),'SA_REP',7400,0.15,148,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (172,'Elizabeth','Bates','EBATES','011.44.1343.529268',str_to_date('03/24/2007','%m/%d/%Y'),'SA_REP',7300,0.15,148,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (173,'Ajib','Kumar','SKUMAR','011441343329268',str_to_date('04/21/2008','%m/%d/%Y'),'SA_REP',6100,0,148,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (174,'Ellen','Adarna','ellen_ibongadarna@y8.com','011.44.1644.429267',str_to_date('05/11/2004','%m/%d/%Y'),'SA_REP',11000,0.3,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (175,'Alyssa','Hutton','AHUTTON@gg.com','011.44.1644.429266',str_to_date('03/19/2005','%m/%d/%Y'),'SA_REP',11000,0.55,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (176,'Jonathonsdfsafsa','Taylor','a@bgh.com','011.44.1644.429265',str_to_date('03/24/2006','%m/%d/%Y'),'SA_REP',8600,0,149,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',str_to_date('04/23/2006','%m/%d/%Y'),'SA_REP',8400,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (178,'Kimberely','Grant','KGRANT','011.44.1644.429263',str_to_date('05/24/2007','%m/%d/%Y'),'SA_REP',7000,0.15,149,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',str_to_date('01/04/2008','%m/%d/%Y'),'SA_REP',6200,0.1,149,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (180,'Winston','Taylor','WTAYLOR','650.507.9876',str_to_date('01/24/2006','%m/%d/%Y'),'SH_CLERK',3200,0,120,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (181,'Jean','Fleaur','JFLEAUR','650.507.9877',str_to_date('02/23/2006','%m/%d/%Y'),'SH_CLERK',3100,0,120,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (182,'Martha','Sullivan','MSULLIVA','650.507.9878',str_to_date('06/21/2007','%m/%d/%Y'),'SH_CLERK',2500,0,120,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (183,'Girard','Geoni','GGEONI','650.507.9879',str_to_date('02/03/2008','%m/%d/%Y'),'SH_CLERK',2800,0,120,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (184,'Nandita','Sarchand','NSARCHAN','650.509.1876',str_to_date('01/27/2004','%m/%d/%Y'),'SH_CLERK',4200,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (185,'WootWoot','Bull','ABULL@kasd.com','6505092876',str_to_date('04/20/2005','%m/%d/%Y'),'ST_MAN',5500,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (186,'Julia','Dellinger','JDELLING','650.509.3876',str_to_date('06/24/2006','%m/%d/%Y'),'SH_CLERK',3400,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (187,'Anthony','Cabrio','ACABRIO','650.509.4876',str_to_date('02/07/2007','%m/%d/%Y'),'SH_CLERK',3000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (188,'Kelly','Chung','KCHUNG','650.505.1876',str_to_date('06/14/2005','%m/%d/%Y'),'SH_CLERK',3800,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (189,'Jennifer','Dilly','JDILLY','650.505.2876',str_to_date('08/13/2005','%m/%d/%Y'),'SH_CLERK',3600,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (190,'Timothy','Gates','TGATES','650.505.3876',str_to_date('07/11/2006','%m/%d/%Y'),'SH_CLERK',2900,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (191,'Randall','Perkins','RPERKINS','650.505.4876',str_to_date('12/19/2007','%m/%d/%Y'),'SH_CLERK',2500,0,122,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (192,'Sarah','Bells','SBELL@something.com','650.501.1876',str_to_date('02/04/2004','%m/%d/%Y'),'SH_CLERK',4000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (193,'Britney','Spears','BEVERETT','678657',str_to_date('03/03/2005','%m/%d/%Y'),'SH_CLERK',3900,0,123,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (194,'Samuel','McCain','SMCCAIN','650.501.3876',str_to_date('07/01/2006','%m/%d/%Y'),'SH_CLERK',3200,0,123,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (195,'Vance','Jones','VJONES@basd.com','650.501.4876',str_to_date('05/07/2007','%m/%d/%Y'),'FI_MGR',2800,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (196,'Alana','Walsh','AWALSH@aida.com','650.507.9811',str_to_date('04/24/2008','%m/%d/%Y'),'ST_MAN',3100,0,124,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (197,'Kevin','Feeney','KFEENEY','650.507.9822',str_to_date('06/01/2006','%m/%d/%Y'),'PU_MAN',3000,0,124,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (198,'Donald','OConnell','DOCONNEL','650.507.9833',str_to_date('06/21/2007','%m/%d/%Y'),'SH_CLERK',2600,0,124,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (199,'Douglas','Grant','DGRANT','650.507.9844',str_to_date('01/13/2008','%m/%d/%Y'),'SH_CLERK',2600,0,124,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (200,'Saitama','Caped Baldy','saitama@onepunchman.com','515.123.432',str_to_date('09/17/2003','%m/%d/%Y'),'SA_REP',7000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (201,'Michael','Hartstein','MHARTSTE','515.123.5555',str_to_date('02/17/2004','%m/%d/%Y'),'MK_MAN',13000,0,100,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (202,'Christina','Aguillera','PFAY','5235',str_to_date('08/17/2005','%m/%d/%Y'),'MK_REP',6000,0.3,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (203,'Susan','Mavris','SMAVRIS','3',str_to_date('06/07/2002','%m/%d/%Y'),'HR_REP',6500,0,101,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (204,'Hermann','Baer','HBAER','515.123.8888',str_to_date('06/07/2002','%m/%d/%Y'),'PR_REP',10000,0,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (205,'Shella','Higgins','SHIGGINS','5151238080',str_to_date('06/07/2002','%m/%d/%Y'),'AD_PRES',12008,0,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (206,'William','Gietz','WGIET@ad.com','515123818',str_to_date('06/24/2002','%m/%d/%Y'),'AD_PRES',20300,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (898,'Gero','Nimo','Sarah','0914578',str_to_date('02/14/2014','%m/%d/%Y'),'AD_ASST',12000,0,101,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (632,'Winnie','Dapu','tinin@yahoo.com','09125557',str_to_date('02/14/2015','%m/%d/%Y'),'AD_PRES',10000,0,101,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1021,'aq','aq','aq@qw.j','11212',str_to_date('06/21/2016','%m/%d/%Y'),'FI_ACCOUNT',7000,0.2,null,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (302,'Taylor','Swift','tswiftvskaty','09175832070',str_to_date('07/07/2014','%m/%d/%Y'),'SH_CLERK',85000,0.2,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (890,'Samantha','Smithy','ssmith ','98900001',str_to_date('12/03/2014','%m/%d/%Y'),'AC_MGR',11122,0,101,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (930,'Nyetaa','Punn','weewaw','079962',str_to_date('04/04/2015','%m/%d/%Y'),'SH_CLERK',1005,0,110,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (621,'Mickey','Maus','abschj@mickey.com','05987454',str_to_date('10/12/2015','%m/%d/%Y'),'SA_MAN',15000,null,null,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (303,'Ulfric','Stormcloak','dragonborn@stormcloak.co','292.994.4321',str_to_date('07/13/2005','%m/%d/%Y'),'AD_PRES',40000,0,102,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (35,'Stefanie','Germonetta','germ.staff@kk.kom','555.888.8887',str_to_date('04/08/2015','%m/%d/%Y'),'FI_ACCOUNT',5000,0,169,220);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (423,'Iggy','Azalea','iazalea','789090',str_to_date('07/08/2014','%m/%d/%Y'),'AD_PRES',5300,0.2,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (666,'Beyonce','Knowles','queenbe@ya.ho','999.999.9999',str_to_date('02/16/2015','%m/%d/%Y'),'SA_MAN',6300,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (910,'Kristina','Begornia','tintin','012457889',str_to_date('01/08/2015','%m/%d/%Y'),'AD_PRES',10222,0,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (306,'Anne','Boleyn','queen@eng.com','273.286.2234',str_to_date('07/18/2012','%m/%d/%Y'),'AD_VP',40000,0,103,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (310,'Levi','Ackerman','scouting@legion.co','733.555.3222',str_to_date('04/27/2015','%m/%d/%Y'),'AD_VP',50000,0,12,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (312,'Jason','Statham','transporter@routes.com','344.223.4453',str_to_date('04/27/2015','%m/%d/%Y'),'HR_REP',5000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (314,'Atsushi','Murasakibara','c@ndylove.com','453.676.6755',str_to_date('04/06/2007','%m/%d/%Y'),'HR_REP',5000,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (316,'Regine','Cooper','alicecooper@gmail.com','858442222',str_to_date('03/26/2004','%m/%d/%Y'),'FI_ACCOUNT',4200,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (305,'Anna','Kendric','pits.perfect@gmol.com','844.332.5432',str_to_date('02/15/2012','%m/%d/%Y'),'SA_MAN',10000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (318,'Basuke','Kurokoa','basuke@gmail.com','9939183265',str_to_date('08/10/2014','%m/%d/%Y'),'AC_MGR',16000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (765,'victoria','beckham','victoria@y.c','456343',str_to_date('01/03/2014','%m/%d/%Y'),'AD_PRES',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (319,'Dora','Chika','boots@gmail.com','000.000.0000',str_to_date('08/12/2014','%m/%d/%Y'),'SH_CLERK',5500,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (650,'junsi','agas','junsi@y.c','544545',str_to_date('05/05/2015','%m/%d/%Y'),'AD_PRES',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (320,'Albus','Dumble','hp@op.com','097.979.9655',str_to_date('10/10/1800','%m/%d/%Y'),'AD_PRES',35000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (408,'Cloud','Strife','bustersword@puppet.com','03-0207-0811',str_to_date('02/07/2015','%m/%d/%Y'),'AD_VP',20000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (900,'Kira','Yamato','flitasuno@gmail','5311950',str_to_date('10/22/2016','%m/%d/%Y'),'AD_PRES',50000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (769,'sawsaw','suka','sawsawsuka@yahoo.com','323232',str_to_date('01/01/2015','%m/%d/%Y'),'AD_PRES',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (323,'Daenerys','Targaeryen','khaleesi@got.com','997.556.5567',str_to_date('10/10/1999','%m/%d/%Y'),'AD_PRES',40000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (333,'Benedict','Cumberbatch','fangirl1@gmail.com','011.033.0445',str_to_date('04/30/2015','%m/%d/%Y'),'MK_REP',5000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (445,'Natalie','Dormer','queen@9gag.com','001.201.0192',str_to_date('01/13/2015','%m/%d/%Y'),'FI_ACCOUNT',6000,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (354,'Suzuya','Juzou','fangirl@tg.com','002.019.0019',str_to_date('05/20/2009','%m/%d/%Y'),'IT_PROG',5000,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (444,'Nanami','of Highlands','awesome@nanami.com','951-784-6320',str_to_date('08/10/2000','%m/%d/%Y'),'AD_PRES',40000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (245,'Joy','Bulaong','joy@me.com','987-654-3210',str_to_date('05/22/2010','%m/%d/%Y'),'AD_PRES',25000,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (30,'Twerk','Breezy','twerk@miley.com','343423',str_to_date('11/09/1996','%m/%d/%Y'),'AD_PRES',40000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (593,'Red','Ranger','red@blue','222.111.222',str_to_date('11/01/2015','%m/%d/%Y'),'AD_PRES',25500,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (365,'lady','gaga','lady@yahoo.com','765-758-8657',str_to_date('06/01/2015','%m/%d/%Y'),'AD_PRES',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (591,'Smiley','Face','flname@names','8964125',str_to_date('01/18/2012','%m/%d/%Y'),'HR_REP',50000,0,102,220);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (34,'randomed','skywalker','2232@gmail.com','11111',str_to_date('07/12/2103','%m/%d/%Y'),'AD_ASST',6000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (18,'Soft','Howard','Duterts@g.com','5424',str_to_date('03/17/2015','%m/%d/%Y'),'AD_PRES',34000,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1012,'aw','aw','aw@aw.aw','121212',str_to_date('06/11/2016','%m/%d/%Y'),'FI_ACCOUNT',8000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (21,'Ray','Allen','e22d12@g.com','5454',str_to_date('12/27/2014','%m/%d/%Y'),'AC_MGR',11000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (207,'haha','alcohol','rhea@yahoo.com','87659',str_to_date('06/01/2015','%m/%d/%Y'),'AD_PRES',40000,0,119,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (22,'John','Wall','e2sd2d12@g.com','798367',str_to_date('02/23/2015','%m/%d/%Y'),'FI_MGR',8500,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (26,'Sarah','WALABATI','princess@sarah.com','687867',str_to_date('03/12/2016','%m/%d/%Y'),'MK_REP',4500,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (27,'Hash FIVE','Tag','fd2@yahoo.com','089898',str_to_date('07/11/2003','%m/%d/%Y'),'PU_CLERK',3223,0,141,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (99,'hohoho','jenner','caitlyn@yahoo.com','545-434-3232',str_to_date('07/15/2015','%m/%d/%Y'),'FI_ACCOUNT',6000,0,111,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (458,'lily','depp','lily@yahoo.com','465-434-3234',str_to_date('06/08/2015','%m/%d/%Y'),'FI_ACCOUNT',15000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (361,'hY','HAY','asda@GMAIL.COM','123',str_to_date('04/06/2015','%m/%d/%Y'),'AD_ASST',5000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (37,'Cindymary','Wana','douchbag@fudge.com','454356',str_to_date('09/16/2015','%m/%d/%Y'),'FI_MGR',8520,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (38,'Alimango','AlimasagZz','asd@gmail.com.ph','32323',str_to_date('01/01/1111','%m/%d/%Y'),'IT_PROG',4000,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (40,'Jay','Hays','fl@gg.com','12344',str_to_date('07/12/2011','%m/%d/%Y'),'AD_PRES',40000,0,141,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (50,'qwerty','qwerty','e212@g.com','123123',str_to_date('02/01/2016','%m/%d/%Y'),'AD_PRES',22222,0,112,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (45,'Rose','Roses','e221SD@g.com','1234',str_to_date('02/20/2014','%m/%d/%Y'),'AD_ASST',6000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1001,'Dean','James','jamesDean021@grs.com','111.111.112',str_to_date('11/09/2014','%m/%d/%Y'),'MK_MAN',9000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1003,'ASDASD','ASDASDASD','ASDASDas@ya.ccs','123-456',str_to_date('10/07/2015','%m/%d/%Y'),'IT_PROG',8000,null,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (59,'qwerty','qwerty','ee2212@g.com','1233',str_to_date('10/09/2015','%m/%d/%Y'),'AD_PRES',23333,0,100,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (61,'James','qwerty','qwerty@qw.com','12344',str_to_date('10/22/2015','%m/%d/%Y'),'AD_VP',15025,0,111,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (65,'James','Tabaa','esqweeeee@go.com','991-222-331',str_to_date('12/28/2014','%m/%d/%Y'),'IT_PROG',4000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (66,'JamesssSsSS','TabaAaAaA','es1qweeee@g.com','778-221-341',str_to_date('12/02/2015','%m/%d/%Y'),'AD_ASST',6000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (67,'James','Tabaa','Ester@gmail.com','43212',str_to_date('12/28/2014','%m/%d/%Y'),'IT_PROG',4325,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (69,'JamesS','Taba','ess12qwe@g.com','43212',str_to_date('10/04/2015','%m/%d/%Y'),'AD_PRES',43254,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (68,'JamesS','Taga','esPe@g.com','43212',str_to_date('10/04/2015','%m/%d/%Y'),'AD_PRES',43254,0,100,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (64,'Hi HELOOOOO','Helo there','helo@hi.com','2543746',str_to_date('10/04/2015','%m/%d/%Y'),'AD_PRES',345454,0,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (62,'James','Tababoi','qwq2y@q.com','123321',str_to_date('10/04/2015','%m/%d/%Y'),'AD_PRES',23232,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (920,'Maruya','Keri','email','09368991148',str_to_date('04/01/2015','%m/%d/%Y'),'FI_MGR',1000,0,101,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (925,'Ara','Muna','mrwq','788551231',str_to_date('04/02/2015','%m/%d/%Y'),'AD_PRES',1000,0,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (926,'Jona','Sensei','ergfd','09879867856',str_to_date('04/02/2015','%m/%d/%Y'),'AD_PRES',40000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (927,'Boobita','Jones','qweq','09807867',str_to_date('04/02/2015','%m/%d/%Y'),'AD_PRES',1000,0,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (701,'Michelle','Angelo','michaeljackson','9873265374',str_to_date('07/07/2014','%m/%d/%Y'),'FI_ACCOUNT',5392,0,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (888,'Kiray','Celis','kiray@yahoo.com','523.241.2200',str_to_date('02/22/2011','%m/%d/%Y'),'AD_PRES',12000,0,111,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (41,'Jack','Coleheros','jack_cole@gmail.com','932.332.3432',str_to_date('04/22/2015','%m/%d/%Y'),'SA_REP',6500,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (331,'Marian','Rivera','dsfasd@ty.com','25852',str_to_date('02/02/2004','%m/%d/%Y'),'SH_CLERK',1,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (213,'Bebe','Gandanghari','kgk@email.com','6576',str_to_date('03/05/2001','%m/%d/%Y'),'AD_ASST',3333,0,0,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (311,'Maka','Albarn','maka_evans@se.com','949.393.4949',str_to_date('05/14/2015','%m/%d/%Y'),'ST_MAN',5555,0,156,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (7,'Kris','Yap','DARLUHH@yahoo.com','7757777',str_to_date('11/02/2015','%m/%d/%Y'),'AD_PRES',40000,null,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (300,'Phoenix','Wright','objection@mitsurugi.com','031-992-0101',str_to_date('05/11/2015','%m/%d/%Y'),'AD_VP',25000,0,0,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (313,'Hermione','Weasley','her@eng.co','985.545.3333',str_to_date('06/30/3002','%m/%d/%Y'),'PR_REP',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (317,'Ranchodas','Chanchad','Rs.chanchad@yaho.com','993.918.3265',str_to_date('04/28/2015','%m/%d/%Y'),'AD_PRES',40000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (56,'Mogar','Mogarito','mmogaritas@drunk.com','963-852-7410',str_to_date('04/02/2015','%m/%d/%Y'),'AC_MGR',9000,0,null,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (567,'David','Beckham','david@yahoo.com','222.555.5555',str_to_date('01/01/2015','%m/%d/%Y'),'AD_PRES',40000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (315,'Jeanz','ValJeanz','lez@misery.com','3224438661',str_to_date('04/11/2015','%m/%d/%Y'),'PR_REP',9000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (560,'orang','gutan','gutan@yahoo.com','45678',str_to_date('02/02/2014','%m/%d/%Y'),'FI_MGR',16000,0,0,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (340,'lala','lala','lala','876565',str_to_date('01/02/2014','%m/%d/%Y'),'AD_PRES',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (401,'Juner','Kurosu','hanakotoba@joker.com','033-214-0727',str_to_date('05/05/2015','%m/%d/%Y'),'AD_ASST',5000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (988,'Emilia','Percival','emiliapercival@littlewing','5652315',str_to_date('08/26/2014','%m/%d/%Y'),'ST_MAN',20500,0,201,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (321,'Historia','Reiss','Historia@queens.com','273-286-2234',str_to_date('08/12/2014','%m/%d/%Y'),'PU_CLERK',20000,0,103,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (322,'Marimar','Perez','aw@yahoo.com','322.443.8661',str_to_date('10/10/1990','%m/%d/%Y'),'PU_CLERK',10500,0,124,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (327,'Natalie','Portman','black_swan@gmail.com','101.112.0987',str_to_date('07/20/2000','%m/%d/%Y'),'FI_MGR',16000,0,170,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (341,'Aceyyyyyyy','Portgas','firefist@whitebeard.co','001.211.0090',str_to_date('10/29/2015','%m/%d/%Y'),'FI_ACCOUNT',7500,0,111,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (342,'Dracule','Mihawk','shichi@kai.co','001.901.0191',str_to_date('08/05/2013','%m/%d/%Y'),'MK_REP',10000,0,124,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (345,'Mafuyu','Kurosaki','banchou@kami.hi','004.040.4000',str_to_date('04/15/2015','%m/%d/%Y'),'IT_PROG',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (346,'Kaneki','Ken','ken@anteiku.co','001.990.0190',str_to_date('07/02/2014','%m/%d/%Y'),'PU_CLERK',5500,0,172,250);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (347,'Uta','Desu','iMakeMask@tg.com','002.010.1001',str_to_date('05/05/2015','%m/%d/%Y'),'SH_CLERK',5000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (349,'Tatsuma','Sakamoto','loudperson@yrzy.com','002.091.0010',str_to_date('10/24/2014','%m/%d/%Y'),'MK_MAN',10000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (353,'Ethan','Hunterx','mi@mi6.gov','002.191.0028',str_to_date('05/15/2015','%m/%d/%Y'),'AC_MGR',10000,0.25,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (800,'Miley','Siraus','miley@siraus.com','000.000.1029',str_to_date('10/31/2014','%m/%d/%Y'),'HR_REP',4000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (357,'Atsushi','Otani','hanshin@love.com','001.019.0109',str_to_date('12/27/2014','%m/%d/%Y'),'SA_MAN',12000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (530,'Cornelio','Aprille','aprille13@yahoo.com','555.5555',str_to_date('11/13/2015','%m/%d/%Y'),'MK_REP',6500,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (997,'Baron','Geisler','isa@lang.com','373658',str_to_date('05/04/2015','%m/%d/%Y'),'IT_PROG',5555,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (598,'Kenny','Roosters','krr@yahoo','789456',str_to_date('04/12/2013','%m/%d/%Y'),'MK_MAN',55000,0,100,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (654,'quick','silver','quick@yahoo.com','888-876-7654',str_to_date('05/04/2015','%m/%d/%Y'),'AD_VP',1000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (478,'sango','goku','san_goku@yahoo.com','765-789-8765',str_to_date('05/04/2015','%m/%d/%Y'),'FI_MGR',10000,0,119,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (543,'aprille','cornelio','aprille19@yahoo.com','545-767-4343',str_to_date('11/12/2015','%m/%d/%Y'),'MK_MAN',9000,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (864,'taguro','jeremiah','jericho@yahoo.com','765-456-9786',str_to_date('05/06/2015','%m/%d/%Y'),'AD_PRES',15000,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (584,'insert','delete','forever@yahoo.com','689-434-2323',str_to_date('05/04/2015','%m/%d/%Y'),'AD_PRES',1500,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (76,'baby','clang','beiberlove@yahoo.com','746-746-3822',str_to_date('05/25/2015','%m/%d/%Y'),'FI_ACCOUNT',2008,0,119,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (10,'Tim','Duncan','barbie.qu1eeeee@yahoo.com','132-457-888888',str_to_date('04/26/2010','%m/%d/%Y'),'PU_MAN',14999,0,112,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (11,'Tony','Parker','tony1@ong.com','123-456-7890',str_to_date('02/01/2015','%m/%d/%Y'),'SH_CLERK',2555,null,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (639,'tom','rodriguez','forever28@kuno.com','756-874-8474',str_to_date('05/18/2015','%m/%d/%Y'),'FI_ACCOUNT',15000,0,200,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (261,'Ariana','Sugar','arianasugar@gmail.com','131-009-5342',str_to_date('03/02/2014','%m/%d/%Y'),'FI_ACCOUNT',25000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (566,'magic','flakes','magic@yahoo.com','657483',str_to_date('06/15/2015','%m/%d/%Y'),'AD_PRES',15000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (255,'Jamila','garcia','jamgarcia@gmail.com','998-232-5441',str_to_date('03/10/2014','%m/%d/%Y'),'FI_ACCOUNT',14530,0,205,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (253,'Jamel','Salva','jamelsalva@yahoo.com','321-423-4421',str_to_date('12/01/2014','%m/%d/%Y'),'FI_ACCOUNT',26000,0,null,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (254,'Karin','Deva','karindev@gmail.com','212-317-8863',str_to_date('10/01/2014','%m/%d/%Y'),'MK_MAN',14000,0,156,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (256,'Charice','Zard','charice123@yahoo.com','908-765-4123',str_to_date('02/14/2014','%m/%d/%Y'),'MK_REP',25000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (257,'Jessie','Jayaa','jessiejay@gmail.com','335.777.2201',str_to_date('06/08/2014','%m/%d/%Y'),'AD_VP',20000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (258,'Kristina','Baller','krisballer@gmail.com','124-403-9980',str_to_date('04/06/2014','%m/%d/%Y'),'MK_REP',9000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (757,'gas','wifi','gas@wifi.com','1223334444',str_to_date('08/08/2010','%m/%d/%Y'),'AD_PRES',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (794,'samsung','sony','samsung@yahoo.com','768-987-3647',str_to_date('07/20/2015','%m/%d/%Y'),'AD_VP',20000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (98,'amber','heard','amber@yahoo.com','346-434-3245',str_to_date('06/08/2015','%m/%d/%Y'),'FI_ACCOUNT',5555,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (363,'y','hgjhgj','jhgj','123',str_to_date('03/02/2015','%m/%d/%Y'),'SA_MAN',20000,0,200,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (921,'Iza','Kalsada','dafa@gmol.com','000.000.0090',str_to_date('04/24/2015','%m/%d/%Y'),'SA_REP',10000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (702,'Nicki','Manas','nminaj','980900',str_to_date('07/15/2014','%m/%d/%Y'),'AD_PRES',6301,0.3,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (911,'Taylor','Sweepstakes','test','1111111',str_to_date('06/30/3002','%m/%d/%Y'),'FI_MGR',12000,0.3,200,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (652,'Dolingna','Magdangal','jmagdangal@gc.cc','054545',str_to_date('01/02/2015','%m/%d/%Y'),'PU_MAN',101111,0,101,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (336,'Ariana','Grande','arigrande','5236',str_to_date('07/12/2014','%m/%d/%Y'),'AD_PRES',7852,0.2,101,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1,'Boa','Hancocks','email@something.com','98765432',str_to_date('03/01/2016','%m/%d/%Y'),'FI_ACCOUNT',4300,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (307,'Sougo','Okita','Shinsengumi@justice.com','847.684.2233',str_to_date('04/01/2015','%m/%d/%Y'),'AD_PRES',11000,0,100,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (2,'DonFlamingo','Donaire','slashass@gg.com','12345678922',str_to_date('02/11/2016','%m/%d/%Y'),'ST_MAN',8200,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (304,'Sam','Gamgee','lotr@ring.co','983.993.2222',str_to_date('04/24/2015','%m/%d/%Y'),'AD_ASST',20000,0,103,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1044,'ww','ww','ww@w.f','12121',str_to_date('06/06/2016','%m/%d/%Y'),'IT_PROG',4444,0.7,null,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (334,'Ping Pong','Dantes','dfgsdfg@dfg.net','3453',str_to_date('02/02/1997','%m/%d/%Y'),'ST_MAN',5500,null,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (3,'Bartolome','Kuma','Paw.Paw@mail.com','555882',str_to_date('02/02/2017','%m/%d/%Y'),'FI_ACCOUNT',4444,null,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1045,'yu','yu','yu@e.j','121',str_to_date('06/18/2016','%m/%d/%Y'),'ST_CLERK',7890,0.2,null,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (750,'raki','agas','raki@y.c','4506758',str_to_date('02/02/2015','%m/%d/%Y'),'AD_ASST',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (450,'barbie','doll','barbie@y.c','65789',str_to_date('04/04/2015','%m/%d/%Y'),'FI_ACCOUNT',100,0,100,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (987,'hgfhg','hgfh','fhff','764',str_to_date('05/01/2015','%m/%d/%Y'),'AD_VP',23,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (88,'Henry','Sy','henrysy@sy.com','888.111.2232',str_to_date('01/26/2015','%m/%d/%Y'),'ST_CLERK',2800,0,111,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (740,'qwerty','qwert','qwer','4545',str_to_date('01/02/2015','%m/%d/%Y'),'AD_PRES',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (432,'qx','qz','qz','54534',str_to_date('01/01/2014','%m/%d/%Y'),'AD_PRES',100,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (427,'Aerith','Gainsborough','flowergirl@ffvii.com','03-0811-0207',str_to_date('08/11/2014','%m/%d/%Y'),'AD_PRES',25000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (901,'Ethan','Waber','shizurushu@littlewing','5459693',str_to_date('01/01/1970','%m/%d/%Y'),'IT_PROG',100000,0,202,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (325,'Tyrion','Lannister','the@imp.com','011.201.2121',str_to_date('02/19/2016','%m/%d/%Y'),'FI_MGR',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (326,'robx','starkx','rob.stark@got.com','546578',str_to_date('04/05/2000','%m/%d/%Y'),'AD_PRES',50000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (332,'Hodor','Hodor','hodor@got.com','002.410.0320',str_to_date('01/02/1999','%m/%d/%Y'),'HR_REP',10000,0,103,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (335,'Light','Kagami','kira@dn.com','101.220.3201',str_to_date('11/12/2014','%m/%d/%Y'),'SH_CLERK',3000,0,101,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (348,'Roy','Mustang','rmustang@fmab.com','004.403.2010',str_to_date('01/14/2015','%m/%d/%Y'),'FI_ACCOUNT',6000,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (411,'Miles','Edgeworth','objection@naruhodo.com','031-992-0101',str_to_date('05/14/2015','%m/%d/%Y'),'AD_VP',35000,0,200,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (351,'Kotaro','Katsura','kk@yrzy.com','002.019.0192',str_to_date('12/22/2014','%m/%d/%Y'),'HR_REP',5000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (25,'Bell','Hestia','danmachi@anime.com','435435',str_to_date('11/24/2015','%m/%d/%Y'),'FI_ACCOUNT',4400,0.25,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (355,'Ginji','Amano','lightning@lord.gb','002.201.2001',str_to_date('08/16/2000','%m/%d/%Y'),'IT_PROG',5000,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (880,'polpotz','cambodia','lala@yahoo.com','1234',str_to_date('01/29/2015','%m/%d/%Y'),'AD_PRES',1000,0,109,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (599,'Someone','Help','uhelp@gmail','911',str_to_date('03/20/2014','%m/%d/%Y'),'PR_REP',15000,0,160,270);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (594,'Data','User','anon@gmail','258',str_to_date('05/16/2013','%m/%d/%Y'),'AD_VP',35000,0,102,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (296,'Aprille','cornelio','enrique_gil@yahoo.com','125-456-9876',str_to_date('05/04/2015','%m/%d/%Y'),'AD_PRES',15000,0,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (467,'selena','gomez','beiber21@yahoo.com','434-235-6554',str_to_date('06/22/2015','%m/%d/%Y'),'AD_PRES',25000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (97,'krissy','jenner','krisjenner@yahoo.com','543-556-4345',str_to_date('06/15/2015','%m/%d/%Y'),'AD_PRES',25000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (288,'sdfsdf','sdfd','sdfsd@yahoo','aasdfsfsdf',str_to_date('01/08/2015','%m/%d/%Y'),'AD_PRES',231,null,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (93,'simply','pretty','avon@yahoo.com','576-576-4890',str_to_date('06/23/2015','%m/%d/%Y'),'AD_ASST',6000,0,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (847,'aprille','cornelio','aprille1212@yahoo.com','23232',str_to_date('06/08/2015','%m/%d/%Y'),'AD_PRES',15000,0,119,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (999,'JOLI','BEE','BIDA@SAYA.com','8-7000',str_to_date('04/11/2000','%m/%d/%Y'),'AD_VP',25000,0.5,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (457,'nakaka','banas','banas@yahoo.com','2132121212',str_to_date('06/15/2015','%m/%d/%Y'),'AD_PRES',15000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (259,'Clairey','Rosy','maryrose@yahoo.com','312-440-0912',str_to_date('06/01/2014','%m/%d/%Y'),'PR_REP',6000,0,152,150);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (360,'JLJLK','JKJL','JLK','123',str_to_date('06/01/2015','%m/%d/%Y'),'AD_PRES',20000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (16,'Klaysus','Thompson','justin@yahoo.com','123.456.7890',str_to_date('07/07/2015','%m/%d/%Y'),'AD_ASST',6000,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (24,'Asunaaaaa','Yamite','berserkhealer@sao.com','789-4562',str_to_date('11/30/2015','%m/%d/%Y'),'SA_MAN',10000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (287,'rob','dsf','sdf','234234',str_to_date('06/17/2015','%m/%d/%Y'),'AD_PRES',123123,null,100,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (9,'dwayne','Johnson','San@yahoo.com','98678896',str_to_date('04/28/2017','%m/%d/%Y'),'ST_MAN',5500,null,156,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (13,'Stephen','Curry','Tery13@yahoo.com','90008',str_to_date('11/12/2017','%m/%d/%Y'),'AC_ACCOUNT',6000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (14,'Sampless','Texts','xXgetrektXx@blazeit.com','6969420',str_to_date('10/04/2015','%m/%d/%Y'),'IT_PROG',10000,null,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (15,'Evet','Roshan','api1@yehey.com','908-9999',str_to_date('12/30/2014','%m/%d/%Y'),'AD_PRES',26000,0,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (19,'Lily','Calling','soma@familia.com','6767',str_to_date('02/26/2004','%m/%d/%Y'),'AD_PRES',20080,0.25,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (20,'Breezy','Allen','e2212@g.com','54654',str_to_date('11/03/2015','%m/%d/%Y'),'AD_VP',30000,0,170,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (29,'Tired','Loose','12@yahoo.com','122',str_to_date('07/11/2003','%m/%d/%Y'),'FI_MGR',8200,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (31,'wawa1','Sadsa1','e21d2@g1.com','7867861111',str_to_date('11/26/2024','%m/%d/%Y'),'AC_MGR',8200,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (32,'Sad','Lifeisreal','s@s.com','12323',str_to_date('02/06/2013','%m/%d/%Y'),'IT_PROG',4000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (43,'Rose','Roses','ro3se@gg.com','1234',str_to_date('07/12/2013','%m/%d/%Y'),'AD_ASST',6000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (44,'Doctordolittle','Armstrongwesak','Putiktalagato@yahoo.com','45612232',str_to_date('10/13/2015','%m/%d/%Y'),'PR_REP',5000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (46,'Qwee','qwewwws','1ss@yahoo.com','12344',str_to_date('01/05/2001','%m/%d/%Y'),'IT_PROG',9999.99,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (48,'HUNGRY','Sads','kawawa@naman.com','123123',str_to_date('07/11/2013','%m/%d/%Y'),'AD_PRES',30000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (709,'Adaman','Levine','adnlevine@gmol.com','091.019.1023',str_to_date('01/07/2014','%m/%d/%Y'),'AD_PRES',5631,0.2,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (922,'Nancy','Binat','mwin@yahoo.com','123-456-7890',str_to_date('04/01/2015','%m/%d/%Y'),'AD_PRES',1000,0.1,111,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (689,'Marvin','Agustin','magustin','0987654',str_to_date('10/10/2013','%m/%d/%Y'),'FI_MGR',99999,0,100,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (923,'Anne','Kutis','mtin@yahoo.com','768679',str_to_date('04/17/2015','%m/%d/%Y'),'IT_PROG',10,0,101,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (12,'Ever','Green','qwert@gmail.com','098.854.5555',str_to_date('04/08/2015','%m/%d/%Y'),'ST_MAN',5900,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (914,'Arwana','Grande','Agrande','090687543',str_to_date('01/26/2015','%m/%d/%Y'),'SH_CLERK',20000,0,160,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (858,'Frenchy','Fries','tomato','09877',str_to_date('01/16/2015','%m/%d/%Y'),'FI_ACCOUNT',10111,0,180,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (39,'Nadia','Cole','eqwewqe@yahoo.com','9789879',str_to_date('04/08/2015','%m/%d/%Y'),'ST_MAN',5555,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (36,'Gina','Coleniaco','qwewq@yahoo.com','3123215467',str_to_date('04/14/2015','%m/%d/%Y'),'MK_MAN',10000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (4,'Atlanta','Mohawk','slash@gg.com','234113',str_to_date('12/09/2014','%m/%d/%Y'),'IT_PROG',4444,null,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (5,'Khan','Antuthan','melmel23@me.com','09785634',str_to_date('05/07/2013','%m/%d/%Y'),'AC_ACCOUNT',5859,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (6,'James','Garden','ernel@PANGET.CO','123-456-7890',str_to_date('02/27/2014','%m/%d/%Y'),'IT_PROG',8888.01,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (0,'Ernests','The Greats','ernel.mething@OPn.com','63352488',str_to_date('06/02/2016','%m/%d/%Y'),'AD_PRES',20088,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (435,'Iggy','Azaleasalongga','kkk@kkk.dot','878.878.8787',str_to_date('04/27/2015','%m/%d/%Y'),'IT_PROG',4000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (301,'Leonidas','Awoo','king@300.co','532.557.1232',str_to_date('07/14/2004','%m/%d/%Y'),'AD_PRES',40000,0,103,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (308,'King','Bradley','fuhrer@homunculi.com','332.434.1121',str_to_date('04/29/2015','%m/%d/%Y'),'HR_REP',50000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (309,'Alphonse','Elric','al@gate.com','832.424.3342',str_to_date('04/27/2015','%m/%d/%Y'),'PR_REP',10000,0,100,150);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (600,'brooklynn','beckham','brookly@y.c','545454',str_to_date('04/05/2015','%m/%d/%Y'),'SA_REP',1000,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (350,'kitty','hello','hello@y.tv','765544',str_to_date('05/02/2015','%m/%d/%Y'),'FI_ACCOUNT',6000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (570,'happy sadp','sad','sad@sdad.com','343543',str_to_date('01/01/2015','%m/%d/%Y'),'AC_ACCOUNT',3000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (500,'aaa','Bowser III','dino@mario.com','002.002.0002',str_to_date('01/31/2014','%m/%d/%Y'),'SH_CLERK',5000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (400,'Tatsuya','Suou','vroom@lovemotorcycles.com','03-8199-0214',str_to_date('05/04/2015','%m/%d/%Y'),'AD_VP',18000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (324,'Arya','Stark','arya@badass.com','443.445.0113',str_to_date('01/29/2005','%m/%d/%Y'),'IT_PROG',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (328,'Margaery','Tyrell','queenof@roses.com','011.201.2200',str_to_date('09/03/1999','%m/%d/%Y'),'MK_MAN',30000,0,101,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (329,'Joffrey','Lannister','tsugi@char.com','102.001.0911',str_to_date('01/01/2005','%m/%d/%Y'),'ST_CLERK',4000,0,103,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (330,'Jon','Snow','malaykoba@got.com','002.410.0321',str_to_date('09/29/2001','%m/%d/%Y'),'IT_PROG',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (343,'John','Cramer','john_cramer@gmail.com','003.029.0100',str_to_date('04/20/2015','%m/%d/%Y'),'SA_REP',20000,0,170,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (344,'Ender','wiggins','Ender@wiggings.com','014.601.1022',str_to_date('05/03/2000','%m/%d/%Y'),'PU_MAN',20000,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (352,'Gin','Sakata','kintoki@yrzy.com','001.101.1110',str_to_date('11/17/2014','%m/%d/%Y'),'IT_PROG',5000,0,201,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (8,'dwayne','wade','champss@www.com','913-728-4605',str_to_date('11/02/2015','%m/%d/%Y'),'AD_PRES',30000,null,174,270);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (597,'Oldly','Created','new@create','1235467',str_to_date('05/12/2014','%m/%d/%Y'),'MK_REP',12500,0,102,250);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (596,'Jollibee','McDonalds','chowking@kfc','4567981',str_to_date('08/14/2013','%m/%d/%Y'),'SA_REP',45500,0,102,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (595,'Bopis','Caldereta','nilaga@sinigang','5551234',str_to_date('08/15/2013','%m/%d/%Y'),'PU_CLERK',25000,0,102,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (592,'Dwezil','Pogi','hindinaman@yahoo.com','531-195-0242',str_to_date('04/06/2015','%m/%d/%Y'),'SH_CLERK',5500,0,0,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (419,'tomokithegreat','tanaka','tomoki@yahoo.com','32323',str_to_date('06/09/2015','%m/%d/%Y'),'AD_PRES',15000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (223,'BLANK TEXT','gsdgsdg','dsgsdg','4531354',str_to_date('02/28/2015','%m/%d/%Y'),'AD_PRES',130000,0,202,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (289,'Robert','Roy','rrbitancor@yahoo.com','09156510044',str_to_date('01/08/2015','%m/%d/%Y'),'PU_MAN',2500,null,100,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (260,'Snowy','White','snowwhite@gmail.com','221-332-0091',str_to_date('06/03/2013','%m/%d/%Y'),'IT_PROG',4300,0,115,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (23,'Tin','Dizon','tin.dizon@yahoo.com','888-888-888',str_to_date('07/26/2015','%m/%d/%Y'),'AD_PRES',40000,0,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (17,'Russelsxs','Beansprout','Erwan@g.com','5566885',str_to_date('02/11/2004','%m/%d/%Y'),'FI_MGR',8200,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (96,'clang','clang','clang@yahoo.com','345-434-3232',str_to_date('06/22/2015','%m/%d/%Y'),'AD_PRES',21000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (95,'Annabelle','baboy','baboy@yahoo.com','465-434-4344',str_to_date('06/29/2015','%m/%d/%Y'),'AD_PRES',25000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (28,'Aiz','Walenstein','loki@familia.com','7567567',str_to_date('10/27/2014','%m/%d/%Y'),'AD_ASST',3400,0.25,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (33,'sadasd','asdasd','qwe@google.com','23123123',str_to_date('11/02/2015','%m/%d/%Y'),'FI_ACCOUNT',5000,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (42,'WORK','WORKs','WORKWORKWORK@gg.com','1234',str_to_date('07/12/2013','%m/%d/%Y'),'AD_PRES',40000,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (77,'jc','jc','jc@jc.com','123123',str_to_date('07/11/0103','%m/%d/%Y'),'AC_MGR',123123,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (47,'atom','mikbam','molecules12@gmail.com','232323232',str_to_date('07/11/2013','%m/%d/%Y'),'AD_PRES',40000,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (49,'Fun','Houses','What@s.com','123123',str_to_date('07/11/2013','%m/%d/%Y'),'AD_PRES',40000,0,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (51,'Nobody','Getsit','e21a2@g.com','12344',str_to_date('10/17/2015','%m/%d/%Y'),'AD_PRES',23455,0,121,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (52,'Gear','Mate','Tut@tututu.com','456132',str_to_date('10/30/2015','%m/%d/%Y'),'SA_MAN',12000,0.3,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1002,'ASDASD','ASDASDASD','ASDASD@Yahh.Cc','1234567',str_to_date('10/07/2015','%m/%d/%Y'),'IT_PROG',8000,null,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (55,'Jay','Payatz','abc@yy.ca','116-9987',str_to_date('10/21/2015','%m/%d/%Y'),'AD_VP',30000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (53,'Dash','Board','confession@board.com','23444',str_to_date('10/22/2015','%m/%d/%Y'),'AD_PRES',20080,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (58,'James','Qwerty','esa2212@g.com','12344',str_to_date('10/31/2014','%m/%d/%Y'),'AD_PRES',22222,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (60,'qwe','qwerty','asa2232@gmail.com','3453',str_to_date('10/25/2015','%m/%d/%Y'),'AD_PRES',46532,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (70,'Hapy Shalalala','Life','1aaaaSS@yahoo.com','23232',str_to_date('10/11/2015','%m/%d/%Y'),'AD_PRES',20080,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1009,'TRY','LANG','asdfdsg1@y.co','13241',str_to_date('11/05/2016','%m/%d/%Y'),'FI_ACCOUNT',8888,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (492,'miggy','chavez','miggy@rock.com','123-7896',str_to_date('02/27/2016','%m/%d/%Y'),'PU_CLERK',2500,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (965,'Dandyy','cunag','dandy@cunag.com','789123',str_to_date('05/11/2015','%m/%d/%Y'),'AD_VP',5000,0,null,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1010,'TRY','LANG','asdfdsdfvg@y.co','1324',str_to_date('11/05/2016','%m/%d/%Y'),'FI_ACCOUNT',4444,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (54,'Moe','Lester','pedro@loli.com','222-9999',str_to_date('11/09/2015','%m/%d/%Y'),'SA_MAN',15000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (216,'tiya','tiyo','tiya@tiyo.com','12332',str_to_date('10/04/2015','%m/%d/%Y'),'AD_VP',30000,0,169,220);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (455,'Alisa','Bosconovitch','robogirl@gmail.com','198327',str_to_date('10/20/2015','%m/%d/%Y'),'IT_PROG',5000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (221,'Twenty','One','Twenty@one.com','76543',str_to_date('09/22/2015','%m/%d/%Y'),'AD_PRES',40000,0,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (262,'Mah','Nigga','hom1e@yahoo.com','921873',str_to_date('10/22/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (230,'Thirty','Two','two@teary.com','12332',str_to_date('07/22/2014','%m/%d/%Y'),'AD_PRES',20080,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (232,'Carol','Ricker','Carol@ric.com','123212',str_to_date('09/17/2015','%m/%d/%Y'),'FI_ACCOUNT',5500,0,172,250);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (826,'Mang','Kanor','Mang@Kanor.yahoo.com','928.836.0098',str_to_date('10/19/2015','%m/%d/%Y'),'ST_MAN',5500,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (459,'yhytfgbj','Spring','ns@ns.com','45655',str_to_date('12/07/2015','%m/%d/%Y'),'AD_PRES',21000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (705,'first','last','email@opo','1456',str_to_date('11/10/2015','%m/%d/%Y'),'SA_REP',2200,0.1,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (658,'fifth','entry','fifth@entry.com','123-4567',str_to_date('11/13/2015','%m/%d/%Y'),'SA_REP',7000,0.5,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (788,'Kirigaya','Kazuto','blackswordsman@sao.com','892-2931',str_to_date('11/01/2015','%m/%d/%Y'),'IT_PROG',5600,0.99,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (394,'sev','snape','ssnape@hogwarts.com','1234-567',str_to_date('02/01/2016','%m/%d/%Y'),'AD_PRES',30000,0,null,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (74,'qwerty','Taba','1qwer@yahoo.com','32145',str_to_date('09/09/2015','%m/%d/%Y'),'IT_PROG',123432,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (217,'kit','kit','kitten@kit.com','12332',str_to_date('09/22/2015','%m/%d/%Y'),'AD_PRES',20080,0,170,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (399,'yabang1','hiya1','y1@h.com','12321',str_to_date('10/22/2015','%m/%d/%Y'),'AD_PRES',300001,0,200,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (234,'Enders','Starters','starter@one.com','523452',str_to_date('06/16/2015','%m/%d/%Y'),'AD_VP',12008,0.9,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (541,'Lason','Antidote','last@one.com','342322',str_to_date('09/26/2015','%m/%d/%Y'),'AD_PRES',40000,0,168,250);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (239,'Felix','Kjellberg','pewdiepieee@yahoo.com','213908',str_to_date('10/27/2015','%m/%d/%Y'),'IT_PROG',6000,0,0,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (711,'seven','eleven','seven@eleven.com','777-1111',str_to_date('12/07/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (244,'Sakura','Haruno','sakuraharuno@naruto.com','628.1234',str_to_date('11/11/2015','%m/%d/%Y'),'SA_MAN',15000,0.36,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (714,'seven','onefour','seven@onefour.com','714-7147',str_to_date('12/07/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (892,'Fifth','Chorva','fifth@chorva.com','123-4567',str_to_date('08/25/2016','%m/%d/%Y'),'ST_CLERK',4500,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (604,'Eren','Jaeger','erenjaeger@snk.com','156-7894',str_to_date('11/11/2015','%m/%d/%Y'),'AC_ACCOUNT',4500,0.33,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (523,'fifth','name','fifth@namename.com','123-456-789',str_to_date('11/07/2015','%m/%d/%Y'),'AD_VP',15000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (776,'earu','bryanu','perezu@gu.com','090656904343',str_to_date('11/25/2015','%m/%d/%Y'),'IT_PROG',9000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (79,'qwerty','qwerty','1@yaho.comq','123321',str_to_date('10/25/2015','%m/%d/%Y'),'FI_ACCOUNT',5000,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1023,'rodrigo','duterte','away@away.com','546879',str_to_date('06/08/2016','%m/%d/%Y'),'FI_ACCOUNT',8888,null,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (78,'Bawal','Panget','dito@makati.com','1234',str_to_date('10/09/2015','%m/%d/%Y'),'AD_PRES',40000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (91,'Rose','Rise','rose1@kk.com','123322',str_to_date('10/12/2015','%m/%d/%Y'),'FI_MGR',8200,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1004,'zxc','zxczxc','zxc@ga.ca','09123456789',str_to_date('10/08/2015','%m/%d/%Y'),'IT_PROG',8000,null,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (57,'Christina','Moran','asdjh@yahoo.com','129837',str_to_date('10/09/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (625,'Carole Ann','Ford','susan@bluebox.com','999-888-777',str_to_date('10/01/2015','%m/%d/%Y'),'FI_ACCOUNT',2000,0,null,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (623,'David','Tennant','theTenth@bluebox.com','10-10-10',str_to_date('10/22/2015','%m/%d/%Y'),'IT_PROG',20080,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (94,'Ling','Xiaoyu','JIIIINNN@yahoo.com','10983217',str_to_date('10/15/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (229,'Were','Are','Arewere.com','12332',str_to_date('09/22/2015','%m/%d/%Y'),'HR_REP',4000,0,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (218,'One','Two','OneTwo@Three.com','635.2225',str_to_date('11/12/2015','%m/%d/%Y'),'PU_CLERK',5000,0.5,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (224,'WestSouth','EastNorth','North@east.com','1233222',str_to_date('06/07/2015','%m/%d/%Y'),'AD_PRES',30000,0,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (544,'aya','brea','wefwe@gmail.com','232323',str_to_date('02/09/1990','%m/%d/%Y'),'ST_CLERK',5000,0,0,270);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (780,'karl','PEREZ','EBX@YEHEY.COM','----',str_to_date('02/09/1990','%m/%d/%Y'),'IT_PROG',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (269,'chris','chup','chupachup@gmil.com','09202352353',str_to_date('10/22/2015','%m/%d/%Y'),'AC_ACCOUNT',4200,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (231,'Paul','Phoenix','BOWAA@yahoo.com','219083',str_to_date('10/21/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (836,'Tomoki','Tanaka','sirTome@yahoo.com','998.000.0921',str_to_date('10/08/2015','%m/%d/%Y'),'FI_ACCOUNT',8200,0,141,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (695,'neilasd','neilasd','njmelecio232@gmail.com','2123',str_to_date('12/02/2015','%m/%d/%Y'),'HR_REP',4000,0,115,220);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (437,'a','b','aa@ac.com','06',str_to_date('11/13/2015','%m/%d/%Y'),'MK_REP',4234,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (715,'onefive','seven','one@five.com','7157157',str_to_date('12/07/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (243,'Asuna','Yuuki','asunayuuki18@yahoo.com','789-4561',str_to_date('11/12/2015','%m/%d/%Y'),'FI_MGR',8300,0.33,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (526,'john','jose','jj@gmail.com','666-6666',str_to_date('11/13/2015','%m/%d/%Y'),'SH_CLERK',5000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (707,'fblarb','lblarb','eblarb','11514',str_to_date('11/10/2015','%m/%d/%Y'),'SH_CLERK',2500,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (953,'fifth','entry','fifth@kiyeme.com','123-4567',str_to_date('11/16/2015','%m/%d/%Y'),'SA_REP',10000,0.5,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (787,'Sasuke','Uchiha','thelastuchiha@naruto.com','123-4567',str_to_date('11/01/2015','%m/%d/%Y'),'PU_CLERK',5000,0.54,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (656,'Jetson','George','cn@network.com','544654',str_to_date('02/24/2016','%m/%d/%Y'),'FI_MGR',15000,0,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (80,'poip','poip','po@po.com','756443',str_to_date('02/23/2016','%m/%d/%Y'),'PU_CLERK',4500,0,115,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (748,'san','miguel','beer@octoberfest.com','890123',str_to_date('10/09/2015','%m/%d/%Y'),'AD_PRES',50000,null,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (81,'kitty','jason','jaspon@kit.com','12342',str_to_date('10/11/2015','%m/%d/%Y'),'IT_PROG',3500,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (85,'Luna','Inverse','getrekt@yahoo.com','012321345',str_to_date('10/12/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (86,'Vladimir','Putin','nofegsallowed@yahoo.com','12345631',str_to_date('10/13/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (669,'Edil','Berto','edi@wow.com','789-234.2',str_to_date('10/14/2015','%m/%d/%Y'),'AD_ASST',6000,0,null,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (853,'second','edit','second@edit.com','987-6543',str_to_date('11/02/2015','%m/%d/%Y'),'SH_CLERK',2500,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (225,'western','newsern','newsern@n.com','12323',str_to_date('09/14/2015','%m/%d/%Y'),'AD_PRES',40000,0,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (263,'Sarah','Himurinmo','eekowteekowt@yahoo.com','123098389',str_to_date('10/22/2015','%m/%d/%Y'),'SA_REP',7000,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (233,'Earl','Perezaminum','ebx@gmail.com','09065099913',str_to_date('10/28/2015','%m/%d/%Y'),'AD_PRES',40000,0,108,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (797,'fifth','edit','fifth@edit.com','123-4567',str_to_date('11/25/2015','%m/%d/%Y'),'SA_REP',12000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (237,'General','Luna','luna@general.com','213-4223-213',str_to_date('10/11/2015','%m/%d/%Y'),'HR_REP',6000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (697,'Saab','Magalona','spellsaab@yc.com','461.02.37',str_to_date('10/02/2015','%m/%d/%Y'),'AD_PRES',25500,0.23,115,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (280,'BENJAMIN','FRANKER','BJF@YAHOO.COM','000000',str_to_date('11/03/2015','%m/%d/%Y'),'PU_MAN',9000,0,100,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (240,'kirigaya','kazuto','kirigayakazuto22@sao.com','789-1236',str_to_date('11/14/2015','%m/%d/%Y'),'IT_PROG',4000,0.56,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (700,'firstblarb','lastblarb','blarb@blarb','451',str_to_date('11/10/2015','%m/%d/%Y'),'ST_CLERK',3000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (562,'Fourth','Eman','fourth@eman.com','987-654-321',str_to_date('11/11/2015','%m/%d/%Y'),'FI_ACCOUNT',4800,0.5,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (641,'JS','P','jsp@yahoo.com.ph','15749.32.12',str_to_date('02/27/2016','%m/%d/%Y'),'FI_ACCOUNT',7000,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (279,'Korina','Sanchez','korina@tsinelas.com','55-954-0',str_to_date('06/06/2010','%m/%d/%Y'),'SH_CLERK',4200,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1000,'Erica','Jimenez','erica@yahoo.com','005',str_to_date('03/12/2016','%m/%d/%Y'),'AD_ASST',4250,0,169,220);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (87,'Raymart','Barretto','sasa112@yahoo.com','123543',str_to_date('10/10/2015','%m/%d/%Y'),'AD_PRES',12334,0,100,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (92,'Simply','Me','me@me.com','763656',str_to_date('09/09/2015','%m/%d/%Y'),'AD_VP',30000,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (626,'Rose','Tyler','tardis@bluebox.com','424-424-423',str_to_date('10/01/2015','%m/%d/%Y'),'AD_VP',20000,0,626,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (556,'berto','dimakulang','yahoo@gmail.com','91234',str_to_date('10/07/2015','%m/%d/%Y'),'AD_VP',15000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (208,'opo','po','po@opo.com','123333',str_to_date('10/13/2015','%m/%d/%Y'),'IT_PROG',123332,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (210,'Opo','Po','PoPo@opo.com','7834910',str_to_date('10/11/2015','%m/%d/%Y'),'IT_PROG',8888,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (222,'asds','asdsd','yuiyuy','12323',str_to_date('10/20/2015','%m/%d/%Y'),'SA_MAN',10000,0,156,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (227,'Seven','Two','seven@two.com','123322',str_to_date('07/13/2015','%m/%d/%Y'),'IT_PROG',4000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (267,'earuu','perezu','lkefwef@yahoo.com','23423432',str_to_date('10/22/2015','%m/%d/%Y'),'AD_VP',20000,0.2,115,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (271,'Richardo','Mendolong','h8@yahoo.com','0902393542',str_to_date('10/22/2015','%m/%d/%Y'),'AD_VP',20000,0.27,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (270,'Aenaese','Paragason','ascii@yahoo.com','097423426',str_to_date('10/19/2015','%m/%d/%Y'),'MK_REP',7000,0,115,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (236,'Jayson','Florendo','jayson@florendo.com','123354',str_to_date('07/31/2015','%m/%d/%Y'),'SA_MAN',10000,0,173,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (238,'Randy','Orton','RKOURSELF@gmail.com','21380',str_to_date('10/28/2014','%m/%d/%Y'),'MK_REP',6000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (954,'sammmm','salsjlaj','saag@sss.com','457-9870',str_to_date('10/29/2015','%m/%d/%Y'),'SA_REP',10000,0.1,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (278,'Billy','Holiday','earl@yahoo.com','999999',str_to_date('11/11/2015','%m/%d/%Y'),'ST_CLERK',3000,0,132,180);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (359,'Sky','Flakes','skyflakes@mysan.com','79867',str_to_date('04/09/2016','%m/%d/%Y'),'AD_PRES',25000,0,132,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (502,'Juan','Dela Cruz','jdc@yahoo.com','902-2356',str_to_date('11/12/2015','%m/%d/%Y'),'FI_ACCOUNT',4200,0.1,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (362,'Rinoa','Heartilly','angelwings8@ff.com','789.6321',str_to_date('11/13/2015','%m/%d/%Y'),'SH_CLERK',5000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (989,'Gandalf','TheGrey','gandalf@middleearth.com','002-031',str_to_date('03/01/2015','%m/%d/%Y'),'SA_REP',6000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (71,'qwerty1','qwerty1','223a2@gmail.com','123123/',str_to_date('10/04/2015','%m/%d/%Y'),'AD_PRES',260001,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (89,'qwerty','ytrewq','qwuer@kk.com','543653',str_to_date('10/04/2015','%m/%d/%Y'),'FI_MGR',12342,0,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (90,'Risen','Watari','rose@rose.com','123321',str_to_date('09/09/2015','%m/%d/%Y'),'AD_PRES',40000,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (624,'Martha','Jones','companion@bluebox.com','444-333-222',str_to_date('05/07/2015','%m/%d/%Y'),'AD_ASST',2314,0,624,260);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (84,'Dena','Ligo','2dirty4u@yahoo.com','132521',str_to_date('10/12/2015','%m/%d/%Y'),'IT_PROG',4000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (627,'Doctor','Who','galifrey@bluebox.com','122-122-122',str_to_date('10/06/2015','%m/%d/%Y'),'AD_PRES',200001,0,627,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (629,'Peter','Capaldi','theTwelfth@bluebox.com','1212-1212-1212',str_to_date('10/13/2015','%m/%d/%Y'),'FI_MGR',15000,0.9,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (784,'seconderino','edit','seconderino@entry.com','123-45678',str_to_date('11/28/2015','%m/%d/%Y'),'AD_ASST',6000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (228,'Eight','Two','two@eight.com','321332',str_to_date('08/09/2015','%m/%d/%Y'),'IT_PROG',4000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (242,'Anne','Curtis','annecurtiss@yahoo.com','21938',str_to_date('10/28/2015','%m/%d/%Y'),'IT_PROG',4000,0,0,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (710,'seven','ten','seven@ten.com','7771010',str_to_date('12/07/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (241,'Naruto','Uzumaki','narutouzumaki@yahoo.com','659-7894',str_to_date('11/16/2015','%m/%d/%Y'),'PU_CLERK',4200,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (704,'qwe','rty','qwerty@asd','12345',str_to_date('11/10/2015','%m/%d/%Y'),'SA_REP',6000,0.1,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (770,'Banday1','Salakay1','bnday@salakay.com','09023412312',str_to_date('07/31/2017','%m/%d/%Y'),'SH_CLERK',55001,0,200,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (998,'Editor','Tester','EditorTester@gmail.com','000-0001',str_to_date('11/07/2015','%m/%d/%Y'),'PR_REP',5000,0,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (897,'Bran','Stark','warg@summer.com','123.098',str_to_date('02/19/2016','%m/%d/%Y'),'PR_REP',4500,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (698,'Junjun','Binay','junjunbnay@makati.gov.ph','9831.12312',str_to_date('01/06/2015','%m/%d/%Y'),'IT_PROG',4200,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (73,'qwert','reqw','qwe@kk.com','12344',str_to_date('10/04/2015','%m/%d/%Y'),'IT_PROG',9876,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (75,'pogi','tayo','pogi@tayo.com','12344',str_to_date('10/08/2015','%m/%d/%Y'),'AD_PRES',213321,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (789,'ghe','cunag','ghe@gmail.com','1231231',str_to_date('10/11/2015','%m/%d/%Y'),'HR_REP',5000,0,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1014,'ht','ht','ht@ht.t','121212',str_to_date('06/21/2016','%m/%d/%Y'),'FI_ACCOUNT',8900,0.3,null,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (82,'Jason','Borne','Jason@kit.com','123422',str_to_date('10/04/2015','%m/%d/%Y'),'IT_PROG',123432,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (622,'Richard1','Eccleston1','theNinth1@bluebox.com','444-444-44411',str_to_date('07/20/2022','%m/%d/%Y'),'AD_PRES',20090,0,null,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (83,'Rey','Pinyoco','awwyiss@nuhumu.com','231542',str_to_date('10/12/2015','%m/%d/%Y'),'FI_MGR',8200,0,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1025,'ahahhaha','hahahaha','wish@paramore.com','479797',str_to_date('06/02/2016','%m/%d/%Y'),'SH_CLERK',5500,null,152,150);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1148,'ii ','ii','ii@e.jh','43434',str_to_date('06/01/2016','%m/%d/%Y'),'FI_ACCOUNT',3455,0.7,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (209,'Masipag','Magalang','ma@ma.com','123442',str_to_date('10/12/2015','%m/%d/%Y'),'IT_PROG',123444,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (555,'Miguelito','Panobino','dnako@aayaw.com','456-89',str_to_date('02/23/2016','%m/%d/%Y'),'SA_REP',9000,0.25,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (777,'GEBONE','PEREZ','myNigger@yaher-.com','---',str_to_date('01/01/2001','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1008,'Kalik','Asan','natureboy@yourservice.co','123456789',str_to_date('05/26/2016','%m/%d/%Y'),'HR_REP',5555,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (512,'Darsh','Win','maisip@gmial.com','89-8598-5',str_to_date('10/14/2015','%m/%d/%Y'),'SH_CLERK',5000,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (211,'Qwerty','Qwerty','q@werty.com','12342',str_to_date('09/15/2015','%m/%d/%Y'),'IT_PROG',10000,0,115,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (214,'Gwapo','Pogi','pogi@gwapo.com','1234232',str_to_date('09/22/2015','%m/%d/%Y'),'SA_MAN',10000,0.29,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (219,'yei','yao','yao@yei.com','2222',str_to_date('09/22/2015','%m/%d/%Y'),'SA_MAN',12666,0.03,172,250);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (144,'Where','When','where@when.com','123232',str_to_date('09/16/2015','%m/%d/%Y'),'AD_PRES',40000,0,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (226,'Six','Two','two@six.com','123322',str_to_date('07/12/2015','%m/%d/%Y'),'IT_PROG',4000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (212,'Raigor','Stonehoof','6mSlam@yahoo.com','210983',str_to_date('10/22/2015','%m/%d/%Y'),'FI_ACCOUNT',6000,0,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (235,'Just','Akid','just@kid.com','342-231-432',str_to_date('10/21/2015','%m/%d/%Y'),'FI_ACCOUNT',5000,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (696,'Heneral','Luna','heneral@bayani.com','410.22.30',str_to_date('11/02/2015','%m/%d/%Y'),'HR_REP',10500,0.32,156,260);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (938,'dsfsfs','dfdf','fweef@dfd','1233431',str_to_date('01/04/2015','%m/%d/%Y'),'IT_PROG',9000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (891,'dsfsfs','dfdf','fweef@dfder','1233431',str_to_date('01/04/2015','%m/%d/%Y'),'IT_PROG',9000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (281,'Arqueid','Brunestude','arqueid@mail.ru','888-88-88',str_to_date('02/05/2015','%m/%d/%Y'),'AD_VP',30000,0,141,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (857,'hp','hp','hp@hp.com','N/A',str_to_date('01/02/2015','%m/%d/%Y'),'MK_MAN',5000,0,110,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (72,'asd','kijtt','123@asd.com','123321',str_to_date('10/05/2015','%m/%d/%Y'),'FI_ACCOUNT',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (63,'Fukikoo','Mekutoo','ewew@ewew.com','123980',str_to_date('12/31/2014','%m/%d/%Y'),'FI_ACCOUNT',8200,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (628,'Matt','Smith','theEleventh@bluebox.com','11-111-11',str_to_date('11/12/2015','%m/%d/%Y'),'AD_PRES',20081,0.5,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (220,'qwerty','qwert','2232a@gmail.com','12344',str_to_date('10/04/2015','%m/%d/%Y'),'SA_REP',10000,0.2,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (215,'sim','jay','sim@jay.com','12332',str_to_date('09/22/2015','%m/%d/%Y'),'ST_CLERK',2008,0,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (264,'Raven','Titan','dark@angel.com','4567788',str_to_date('10/26/2015','%m/%d/%Y'),'IT_PROG',8000,0.5,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (712,'firstblah','lastblah','email@blah.com','111-1111',str_to_date('12/04/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (713,'fnameblah','lnameblah','em@blab.com','333-3333',str_to_date('12/03/2015','%m/%d/%Y'),'IT_PROG',5000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (759,'nihon','go','ngo@ngo.com','56756',str_to_date('11/02/2015','%m/%d/%Y'),'FI_MGR',22598,0,203,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (559,'Death','Note','deathnote','567.89.09',str_to_date('11/16/2015','%m/%d/%Y'),'AD_ASST',15000,0,152,150);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (703,'first','last','ema','123',str_to_date('11/10/2015','%m/%d/%Y'),'SA_REP',6000,0.2,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (706,'rah','har','rahhar@email','1565',str_to_date('11/10/2015','%m/%d/%Y'),'SA_REP',1234,0.1,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (863,'Fifth','Name','fifth@name.com','123-456-789',str_to_date('11/03/2015','%m/%d/%Y'),'AD_PRES',21000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (798,'six','name','six@namename.com','123-4567',str_to_date('11/07/2015','%m/%d/%Y'),'AD_PRES',20080,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (643,'sadgf','sdg','sagf@af.com','123-4567',str_to_date('11/01/2015','%m/%d/%Y'),'SH_CLERK',2500,0,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (912,'sdfhg','dsfga','adsgf@sg.com','987-6543',str_to_date('11/01/2015','%m/%d/%Y'),'SH_CLERK',2500,0,null,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (865,'fourth','kiyemes','third@kiyeme.com','123-4567',str_to_date('12/03/2013','%m/%d/%Y'),'SA_REP',6000,0.15,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (775,'karu','perezu','k@p.com','0923423',str_to_date('11/02/2015','%m/%d/%Y'),'AC_ACCOUNT',5000,0,204,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (774,'Earl','Bryan','at@bt.com','000-222-111',str_to_date('11/02/2015','%m/%d/%Y'),'FI_MGR',9000,0,70,70);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1043,'aa','aa','aa@we.d','12121',str_to_date('06/15/2016','%m/%d/%Y'),'FI_ACCOUNT',2344,null,null,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1150,'eew','ee','ee@h.h','1212',str_to_date('06/08/2016','%m/%d/%Y'),'FI_ACCOUNT',4350,0.6,168,160);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1151,'DRE','dre','er@rtr.h','1212',str_to_date('06/07/2016','%m/%d/%Y'),'FI_ACCOUNT',8900,0.7,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (292,'Erica','AGAIN','yeeee@asd.lkj','002',str_to_date('02/01/2016','%m/%d/%Y'),'AD_ASST',4500.5,0,112,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (274,'Two','Sevenfour','two.seven@four.com','1212.1',str_to_date('02/02/2012','%m/%d/%Y'),'AD_ASST',4200,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (275,'two','sevenfive','two.sevenfive@gmail.com','12154',str_to_date('01/02/2016','%m/%d/%Y'),'AD_ASST',4200,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (994,'Carmina','Baga','cbaga@dnd.tech','4033939',str_to_date('08/11/2015','%m/%d/%Y'),'IT_PROG',10000,null,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1020,'fg','fg','we@er.f','21213',str_to_date('06/20/2016','%m/%d/%Y'),'FI_MGR',8000,0.3,null,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1024,'mar','roxas','tuwid@daan.com','45649',str_to_date('06/21/2016','%m/%d/%Y'),'FI_ACCOUNT',7000,null,141,140);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1026,'Jing','Palma','jing_palma_17@yahoo.com','63352488',str_to_date('05/05/2016','%m/%d/%Y'),'IT_PROG',20088,0,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1028,'Jing','Palma','1jing_palma_17@yahoo.com','63352488',str_to_date('05/05/2016','%m/%d/%Y'),'IT_PROG',20088,0,205,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1029,'Jing','Palma','2jing_palma_17@yahoo.com','63352488',str_to_date('05/05/2016','%m/%d/%Y'),'IT_PROG',20088,0,200,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1034,'Jing','Palma','3jing_palma_17@yahoo.com','63352488',str_to_date('05/05/2016','%m/%d/%Y'),'IT_PROG',20088,0,200,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (251,'two','fiftyone','two.fiftyone@fs.com','2.51',str_to_date('02/26/2015','%m/%d/%Y'),'FI_ACCOUNT',8000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1041,'may','play','framework@pang.gagawin','3213123',str_to_date('06/15/2016','%m/%d/%Y'),'PU_MAN',8788,null,132,130);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (294,'two','nine four','9.two_four@woah.com',null,str_to_date('02/01/2016','%m/%d/%Y'),'SH_CLERK',null,null,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (295,'Two','nine five','two_nine5@abc.com','125.212',str_to_date('02/01/2016','%m/%d/%Y'),'SH_CLERK',null,null,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (282,'Two','Eightytwo','email2_1213@yahoo.com','0.2313',str_to_date('02/01/2016','%m/%d/%Y'),'AC_MGR',null,null,171,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (283,'Too','EightThree','Swagger@asdsa.com.ph','2315-1210',str_to_date('02/02/2016','%m/%d/%Y'),'HR_REP',null,null,156,170);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (284,'Chu','Aytfor','thuglife23132@asd.casd','0.23.23',str_to_date('02/03/2016','%m/%d/%Y'),'PR_REP',null,null,120,120);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (285,'ERICA','J','email.EMAIL@esl.sdas','001',str_to_date('01/15/2016','%m/%d/%Y'),'AD_ASST',3999.99,0.03,108,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (286,null,'six','invalidemeil@asdsa.saa','5-456',str_to_date('02/05/2016','%m/%d/%Y'),'PR_REP',null,null,169,220);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (339,'Jessa','Bellssss','littlemermed@mermed.com','142.2134',str_to_date('02/16/2016','%m/%d/%Y'),'FI_MGR',16000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1016,'q','q','q@q.f','12121',str_to_date('06/14/2016','%m/%d/%Y'),'AD_ASST',3212,0.4,null,150);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1036,'Jing','Palma','jing_palma_172@yahoo.com','63352488',str_to_date('05/11/2016','%m/%d/%Y'),'IT_PROG',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (272,'Jollee','Bae','jolly@yahoo.com','1-7000',str_to_date('08/01/2011','%m/%d/%Y'),'IT_PROG',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1037,'Changer Is','Comming','xD_173@yahoo.com','63352488',str_to_date('05/11/2016','%m/%d/%Y'),'SA_MAN',10000,0,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1038,'Rodrigo','Duterte xD','jinx_p_175@yahoo.com','63352488',str_to_date('05/11/2016','%m/%d/%Y'),'AD_PRES',10000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1144,'Rodrigo','Duterte xD','jinx_31p_175@yahoo.com','63352488',str_to_date('06/06/2016','%m/%d/%Y'),'AD_PRES',20000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1145,'Changer Is','Commibg','haha5@yahoo.com','63352488',str_to_date('06/06/2016','%m/%d/%Y'),'AD_PRES',20000,0,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1146,'Testing','Adding','XD_jinxhaha5@yahoo.com','63352488',str_to_date('06/06/2016','%m/%d/%Y'),'AD_PRES',20000,0,203,40);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (246,'JeJemong','Binayzzz','binay_aran@gmail.com','666-6666',str_to_date('03/01/2006','%m/%d/%Y'),'AD_PRES',null,null,null,null);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (297,'Erica','Belles','ericabelles@aaaa.com','003',str_to_date('01/31/2016','%m/%d/%Y'),'MK_REP',null,null,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1149,'gfgfee','erer','fdg@y.y','23232',str_to_date('06/07/2016','%m/%d/%Y'),'FI_ACCOUNT',3433,0.7,108,100);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (990,'Juan','Dela Cruz','jdc@website.me','4033139',str_to_date('10/12/2016','%m/%d/%Y'),'AD_PRES',40000,null,103,60);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1013,'er','er','er@er.e','121212',str_to_date('06/08/2016','%m/%d/%Y'),'FI_ACCOUNT',7897,0.5,114,30);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1017,'dfs','sd','s@sd.g','1212',str_to_date('06/13/2016','%m/%d/%Y'),'AD_PRES',121,0.7,null,240);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (252,'two','fifty_two','tufiftytu@oo.com','2.52',str_to_date('02/15/2015','%m/%d/%Y'),'AD_ASST',5000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1015,'Asd','Aasd','asdasdas@asd.com','0000000',str_to_date('06/01/2016','%m/%d/%Y'),'AC_ACCOUNT',null,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1018,'s','s','s@ws.g','1212',str_to_date('06/13/2016','%m/%d/%Y'),'ST_CLERK',456,0.3,null,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1147,'qqg','qq','qq@dr4.h','32232',str_to_date('06/09/2016','%m/%d/%Y'),'AD_ASST',3420,0.88,115,210);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (995,'Bimbi','Yap','whutyoulookin@tested.net','8242137',str_to_date('05/10/2016','%m/%d/%Y'),'AC_MGR',8888,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1042,'tapos','attendace','management@system.pa','3123213',str_to_date('06/07/2016','%m/%d/%Y'),'SH_CLERK',2555,0,152,260);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (250,'seventeen','twerkyeight','two.fifty@yahoo.com.au','2.50',str_to_date('03/01/2015','%m/%d/%Y'),'AD_ASST',4200,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (273,'ewan23','for56','eqwq@azaz.com','23124',str_to_date('11/04/2015','%m/%d/%Y'),'AD_ASST',4200,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1046,'bba','bbaa','bb@hh.jaa','121211',str_to_date('06/14/2016','%m/%d/%Y'),'FI_ACCOUNT',56789,0.8,170,230);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1152,'Juan','Pedro','j.pedro@website.com','1234567',str_to_date('06/04/2016','%m/%d/%Y'),'AD_PRES',40000,0.99,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (248,'Mang','Kanor','jillrose@gmail.com','405243',str_to_date('07/20/0301','%m/%d/%Y'),'AD_PRES',30000,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (299,'erica','four','e4@yasss.com','004',str_to_date('01/04/2016','%m/%d/%Y'),'PU_CLERK',5500,0,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (276,'Two','Sevensix','two.sevensix@yahoo.com',null,str_to_date('10/14/2014','%m/%d/%Y'),'ST_CLERK',5000,0.23,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (277,'Two','Sevenseven','277@two.com','27.27',str_to_date('01/31/2015','%m/%d/%Y'),'HR_REP',null,null,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (293,'Two','Ninethree','two.nine3@outlook.com.ph','29-3-29',str_to_date('11/12/2015','%m/%d/%Y'),'AC_ACCOUNT',5000,null,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (337,null,'Ohno','email.me2@email.com',null,str_to_date('02/01/2016','%m/%d/%Y'),'AD_PRES',null,0,100,90);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (338,'Merry','HadALittleLamb','littleLamb2x@email.com',null,str_to_date('03/14/2013','%m/%d/%Y'),'AC_ACCOUNT',5000,0,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1006,'Hala Mahulog','Hala Mahulog','loglog@log.io','4201738',str_to_date('03/08/2017','%m/%d/%Y'),'AD_VP',17380,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1039,'wala','na ','akong@magawa.com','58798719',str_to_date('06/22/2016','%m/%d/%Y'),'MK_MAN',9000,null,112,190);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1011,'sadasd','sadsa','hp.hp@hp.com','3123',str_to_date('06/01/2016','%m/%d/%Y'),'AC_ACCOUNT',5555,null,145,80);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1022,'ase','dfd','a@a.com','13213',str_to_date('06/21/2016','%m/%d/%Y'),'FI_ACCOUNT',7000,0.5,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (291,'see','saw','ssss@asd.com','091-301',str_to_date('03/01/2015','%m/%d/%Y'),'AD_PRES',16000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1005,'Jejomar','Binay','onlybinay@gmail.com','666-6666',str_to_date('03/01/2006','%m/%d/%Y'),'AD_PRES',22222,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (249,'Fetty','Wap','1738ayy@gmail.com','1738',str_to_date('03/01/2006','%m/%d/%Y'),'AD_PRES',30000,null,null,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1019,'ww','ww','ww@w.b','21212',str_to_date('06/13/2016','%m/%d/%Y'),'HR_REP',1212,0.5,null,110);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1040,'after','lesson','eight@mvc.com','478979',str_to_date('06/01/2016','%m/%d/%Y'),'FI_ACCOUNT',8888,null,121,50);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (265,'DHAPPY','JHJHJ','HJHKH','15456',str_to_date('01/01/2016','%m/%d/%Y'),'AD_PRES',15000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (266,'ghjgh','hjjhj','hjhjhj','6564564',str_to_date('03/01/2015','%m/%d/%Y'),'AD_ASST',4200,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (290,'OK','ko','okok@yyy.com','N/A',str_to_date('01/01/2016','%m/%d/%Y'),'SA_REP',7000,0,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (247,'Mar','Roxas','mar_roxas@wharton.edu','137',str_to_date('08/27/2007','%m/%d/%Y'),'AD_PRES',40000,null,201,20);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (268,'Remy','Boys','ahahah@gmail.com','1738',str_to_date('10/30/2015','%m/%d/%Y'),'AD_PRES',30000,null,200,10);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (996,'Michael','Dan','dandalan@dan.ms','400-4000',str_to_date('05/11/2016','%m/%d/%Y'),'PR_REP',4512.23,null,113,200);
Insert into GAS.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (1007,'Mah','Bilis','MrQuickie@Silv.er','10100',str_to_date('05/26/2016','%m/%d/%Y'),'AD_PRES',22222,0,200,10);
-- INSERTING into GAS.JOBS
/* SET DEFINE OFF; */
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President',20080,40000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President',15000,30000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant',3000,6000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager',8200,16000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant',4200,9000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager',8200,16000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant',4200,9000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager',10000,20080);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative',6000,12008);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager',8000,15000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk',2500,5500);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager',5500,8500);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk',2008,5000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk',2500,5500);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer',4000,10000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager',9000,15000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative',4000,9000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative',4000,9000);
Insert into GAS.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative',4500,10500);
-- INSERTING into GAS.JOB_HISTORY
/* SET DEFINE OFF; */
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (50,str_to_date('02/01/0216','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'AD_PRES',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (24,str_to_date('11/28/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'FI_ACCOUNT',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (106,str_to_date('02/05/2006','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'SH_CLERK',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (271,str_to_date('10/22/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_VP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (641,str_to_date('01/05/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',160);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (290,str_to_date('01/01/2016','%m/%d/%Y'),str_to_date('03/15/2016','%m/%d/%Y'),'SA_REP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (41,str_to_date('04/22/2015','%m/%d/%Y'),str_to_date('03/16/2016','%m/%d/%Y'),'SA_REP',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (62,str_to_date('10/04/2015','%m/%d/%Y'),str_to_date('03/16/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (87,str_to_date('10/10/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (51,str_to_date('10/17/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (59,str_to_date('10/09/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (273,str_to_date('11/04/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (291,str_to_date('03/01/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (96,str_to_date('06/22/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (248,str_to_date('07/20/0301','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/04/2016','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'IT_PROG',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (784,str_to_date('11/25/2015','%m/%d/%Y'),str_to_date('11/27/2015','%m/%d/%Y'),'SH_CLERK',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (65,str_to_date('12/28/2014','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'IT_PROG',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (24,str_to_date('11/29/2015','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (710,str_to_date('12/07/2015','%m/%d/%Y'),str_to_date('12/09/2015','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('02/03/2013','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'FI_ACCOUNT',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('05/10/2011','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'PU_MAN',30);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('11/27/2015','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/14/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'SA_REP',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/15/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/16/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/17/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/18/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'PU_MAN',30);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/21/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/25/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'IT_PROG',230);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/26/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'ST_CLERK',170);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/27/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/28/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_VP',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/30/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'MK_REP',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/01/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'ST_MAN',150);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/03/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'PR_REP',70);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/04/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (37,str_to_date('07/10/0103','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',180);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (34,str_to_date('07/12/0103','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_ASST',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (35,str_to_date('04/08/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'FI_ACCOUNT',140);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (49,str_to_date('07/11/0103','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (54,str_to_date('11/09/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/26/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/21/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',260);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/25/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',220);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('01/06/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('01/07/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',250);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('01/10/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'PR_REP',210);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('01/03/2014','%m/%d/%Y'),str_to_date('03/07/2016','%m/%d/%Y'),'AD_VP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('01/06/2014','%m/%d/%Y'),str_to_date('03/09/2016','%m/%d/%Y'),'AD_VP',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('02/29/2016','%m/%d/%Y'),str_to_date('03/09/2016','%m/%d/%Y'),'FI_ACCOUNT',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('01/04/2014','%m/%d/%Y'),str_to_date('03/09/2016','%m/%d/%Y'),'AD_VP',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/07/2014','%m/%d/%Y'),str_to_date('03/10/2016','%m/%d/%Y'),'FI_MGR',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (7,str_to_date('11/26/2015','%m/%d/%Y'),str_to_date('03/10/2016','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (15,str_to_date('12/28/2014','%m/%d/%Y'),str_to_date('03/10/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (15,str_to_date('12/29/2014','%m/%d/%Y'),str_to_date('03/10/2016','%m/%d/%Y'),'AD_PRES',220);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/06/2016','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'IT_PROG',140);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/12/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'SH_CLERK',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('01/31/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (292,str_to_date('02/01/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (797,str_to_date('11/01/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (797,str_to_date('11/20/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SA_REP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('11/30/2014','%m/%d/%Y'),str_to_date('02/12/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('05/05/2014','%m/%d/%Y'),str_to_date('02/12/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('02/02/2014','%m/%d/%Y'),str_to_date('02/12/2016','%m/%d/%Y'),'AC_MGR',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('06/06/2014','%m/%d/%Y'),str_to_date('02/12/2016','%m/%d/%Y'),'MK_MAN',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('01/01/2014','%m/%d/%Y'),str_to_date('02/12/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (11,str_to_date('02/25/2015','%m/%d/%Y'),str_to_date('02/16/2016','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (11,str_to_date('02/26/2015','%m/%d/%Y'),str_to_date('02/16/2016','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (157,str_to_date('03/04/2004','%m/%d/%Y'),str_to_date('02/17/2016','%m/%d/%Y'),'SA_REP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (784,str_to_date('11/28/2015','%m/%d/%Y'),str_to_date('02/18/2016','%m/%d/%Y'),'FI_ACCOUNT',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (93,str_to_date('06/23/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (77,str_to_date('07/11/0103','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (80,str_to_date('02/23/2016','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'PR_REP',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (17,str_to_date('02/08/2004','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_MGR',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (17,str_to_date('02/11/2004','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'FI_MGR',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (19,str_to_date('02/26/2004','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (313,str_to_date('10/19/2011','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'PR_REP',230);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (911,str_to_date('01/08/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'FI_MGR',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (16,str_to_date('07/07/2015','%m/%d/%Y'),str_to_date('04/22/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (105,str_to_date('06/25/2005','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'IT_PROG',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (66,str_to_date('12/28/2014','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'IT_PROG',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (8,str_to_date('11/04/2015','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (22,str_to_date('02/23/2015','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/06/2010','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (11,str_to_date('02/10/2015','%m/%d/%Y'),str_to_date('02/16/2016','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (11,str_to_date('02/01/2015','%m/%d/%Y'),str_to_date('02/16/2016','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (79,str_to_date('10/18/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (81,str_to_date('10/11/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (83,str_to_date('10/12/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (269,str_to_date('10/22/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_VP',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (2,str_to_date('02/11/2016','%m/%d/%Y'),str_to_date('03/14/2016','%m/%d/%Y'),'AC_MGR',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (555,str_to_date('02/23/2016','%m/%d/%Y'),str_to_date('03/16/2016','%m/%d/%Y'),'SA_REP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/08/2014','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'MK_MAN',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (32,str_to_date('02/06/0013','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (64,str_to_date('10/04/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',120);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (82,str_to_date('10/04/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/26/2010','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'PU_MAN',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (7,str_to_date('11/01/2015','%m/%d/%Y'),str_to_date('04/22/2016','%m/%d/%Y'),'AD_PRES',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (797,str_to_date('11/02/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (40,str_to_date('07/12/0103','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'AD_PRES',140);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (103,str_to_date('11/27/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (797,str_to_date('11/21/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SA_REP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (100,str_to_date('11/09/2014','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'MK_MAN',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('01/07/2011','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'MK_MAN',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (11,str_to_date('02/12/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (24,str_to_date('11/30/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (3,str_to_date('06/23/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'FI_ACCOUNT',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (102,str_to_date('11/10/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'SA_REP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (110,str_to_date('09/30/2005','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1001,str_to_date('10/07/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'IT_PROG',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (130,str_to_date('10/30/2005','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (129,str_to_date('09/12/2005','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'ST_MAN',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (560,str_to_date('02/02/2014','%m/%d/%Y'),str_to_date('01/13/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (592,str_to_date('04/06/2015','%m/%d/%Y'),str_to_date('01/13/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/05/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/06/2014','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'SH_CLERK',120);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (30,str_to_date('11/09/0196','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/07/2010','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AC_MGR',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/09/2010','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'FI_MGR',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('01/05/2014','%m/%d/%Y'),str_to_date('03/09/2016','%m/%d/%Y'),'AD_VP',130);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (141,str_to_date('10/17/2003','%m/%d/%Y'),str_to_date('03/16/2016','%m/%d/%Y'),'ST_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('06/30/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (268,str_to_date('03/01/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('08/05/2007','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('08/20/2007','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (250,str_to_date('02/15/2015','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (250,str_to_date('02/28/2015','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (419,str_to_date('06/08/2015','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (223,str_to_date('02/27/2015','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/05/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/06/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',250);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/08/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/10/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/15/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'FI_MGR',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/16/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_VP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('03/31/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_VP',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,str_to_date('09/21/2005','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'AD_VP',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (104,str_to_date('09/07/2007','%m/%d/%Y'),str_to_date('12/02/2015','%m/%d/%Y'),'IT_PROG',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('11/21/2015','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'AC_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/10/2010','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'SA_MAN',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (103,str_to_date('11/11/2015','%m/%d/%Y'),str_to_date('02/17/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('12/29/2015','%m/%d/%Y'),str_to_date('02/23/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (80,str_to_date('10/23/2015','%m/%d/%Y'),str_to_date('02/23/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (28,str_to_date('12/12/0112','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/11/2010','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'PU_MAN',30);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (19,str_to_date('02/07/0004','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('01/15/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'PR_REP',260);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('01/16/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'PR_REP',270);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/16/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'PR_REP',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/06/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'MK_REP',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/09/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'MK_REP',230);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/10/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'MK_REP',250);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('01/02/2014','%m/%d/%Y'),str_to_date('03/07/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (68,str_to_date('10/04/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (248,str_to_date('02/22/2013','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (770,str_to_date('11/02/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'SH_CLERK',210);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (292,str_to_date('01/31/2016','%m/%d/%Y'),str_to_date('03/28/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (14,str_to_date('10/04/2015','%m/%d/%Y'),str_to_date('03/30/2016','%m/%d/%Y'),'AC_MGR',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (40,str_to_date('07/12/2011','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'AD_PRES',140);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (853,str_to_date('11/03/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (459,str_to_date('12/07/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'AD_PRES',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (300,str_to_date('05/11/2015','%m/%d/%Y'),str_to_date('01/13/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('08/14/2014','%m/%d/%Y'),str_to_date('02/11/2016','%m/%d/%Y'),'SA_REP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (8,str_to_date('08/04/2015','%m/%d/%Y'),str_to_date('02/11/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('02/23/2016','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'FI_ACCOUNT',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/15/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'IT_PROG',250);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/12/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'IT_PROG',230);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('03/01/2016','%m/%d/%Y'),str_to_date('03/15/2016','%m/%d/%Y'),'FI_ACCOUNT',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (251,str_to_date('02/16/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'FI_ACCOUNT',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (892,str_to_date('11/13/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'ST_CLERK',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/22/2016','%m/%d/%Y'),str_to_date('03/28/2016','%m/%d/%Y'),'AD_ASST',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('03/01/2016','%m/%d/%Y'),str_to_date('03/28/2016','%m/%d/%Y'),'AD_ASST',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (292,str_to_date('01/29/2016','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'AD_ASST',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/05/2016','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'IT_PROG',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (338,str_to_date('03/01/2013','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'AC_MGR',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (338,str_to_date('03/02/2013','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'AC_MGR',150);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (338,str_to_date('03/12/2013','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'AC_MGR',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (338,str_to_date('03/13/2013','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'AC_MGR',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (338,str_to_date('03/14/2013','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'AC_MGR',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/08/2016','%m/%d/%Y'),str_to_date('03/30/2016','%m/%d/%Y'),'SH_CLERK',140);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/14/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'SH_CLERK',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/15/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_VP',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/01/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'MK_REP',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/02/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AC_MGR',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (339,str_to_date('02/03/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_PRES',240);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (0,str_to_date('04/02/2014','%m/%d/%Y'),str_to_date('04/01/2016','%m/%d/%Y'),'AD_VP',130);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('12/01/2014','%m/%d/%Y'),str_to_date('12/08/2015','%m/%d/%Y'),'ST_CLERK',130);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (103,str_to_date('11/28/2015','%m/%d/%Y'),str_to_date('12/21/2015','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (103,str_to_date('11/30/2015','%m/%d/%Y'),str_to_date('12/21/2015','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (103,str_to_date('11/29/2015','%m/%d/%Y'),str_to_date('12/21/2015','%m/%d/%Y'),'ST_MAN',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (103,str_to_date('11/03/2015','%m/%d/%Y'),str_to_date('12/21/2015','%m/%d/%Y'),'SA_REP',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('10/13/2015','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'ST_MAN',180);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (8,str_to_date('06/06/2005','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'AD_PRES',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (66,str_to_date('12/02/2015','%m/%d/%Y'),str_to_date('02/18/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (53,str_to_date('10/22/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (70,str_to_date('10/11/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (274,str_to_date('01/02/2016','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (312,str_to_date('04/27/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'HR_REP',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (250,str_to_date('03/01/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/18/2016','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'IT_PROG',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (6,str_to_date('02/27/2014','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'FI_MGR',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (12,str_to_date('04/08/2015','%m/%d/%Y'),str_to_date('04/22/2016','%m/%d/%Y'),'PU_CLERK',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (784,str_to_date('11/27/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SH_CLERK',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (853,str_to_date('11/01/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (784,str_to_date('11/26/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'FI_MGR',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (23,str_to_date('06/26/2015','%m/%d/%Y'),str_to_date('12/03/2015','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('01/07/2012','%m/%d/%Y'),str_to_date('02/02/2016','%m/%d/%Y'),'MK_MAN',40);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (5,str_to_date('02/23/2015','%m/%d/%Y'),str_to_date('02/02/2016','%m/%d/%Y'),'ST_MAN',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (7,str_to_date('03/28/2013','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (20,str_to_date('11/03/2015','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'IT_PROG',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('10/21/2015','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'AD_PRES',70);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (139,str_to_date('06/21/2006','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AC_MGR',270);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (206,str_to_date('06/07/2002','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (116,str_to_date('12/24/2005','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'PU_CLERK',30);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (989,str_to_date('03/01/2015','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'SA_REP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1000,str_to_date('02/20/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (47,str_to_date('07/11/0103','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',210);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (36,str_to_date('04/14/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'MK_MAN',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (44,str_to_date('10/13/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'PR_REP',230);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (85,str_to_date('10/12/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (38,str_to_date('01/01/1111','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (39,str_to_date('04/08/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (42,str_to_date('07/12/0103','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_ASST',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (48,str_to_date('07/11/0103','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'AD_PRES',190);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (329,str_to_date('01/01/2005','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'ST_CLERK',120);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (265,str_to_date('01/01/2016','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (268,str_to_date('08/01/2006','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (268,str_to_date('03/04/2016','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (268,str_to_date('10/30/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (266,str_to_date('03/01/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (622,str_to_date('10/13/2015','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (8,str_to_date('11/26/0011','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/04/2010','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'ST_MAN',180);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (7,str_to_date('11/24/2015','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'AC_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('12/27/2015','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_VP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (897,str_to_date('10/23/2014','%m/%d/%Y'),str_to_date('02/19/2016','%m/%d/%Y'),'PR_REP',70);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (325,str_to_date('04/20/2014','%m/%d/%Y'),str_to_date('02/19/2016','%m/%d/%Y'),'PR_REP',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (33,str_to_date('11/02/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (117,str_to_date('07/07/2014','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_VP',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (131,str_to_date('03/17/2005','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'SH_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (492,str_to_date('02/10/2016','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'PU_CLERK',130);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (51,str_to_date('10/16/2015','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'AD_PRES',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (29,str_to_date('07/11/0103','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'FI_MGR',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (145,str_to_date('10/07/2004','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'MK_REP',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (27,str_to_date('07/11/0103','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'PU_CLERK',140);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (275,str_to_date('01/12/2016','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('12/09/2014','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'MK_MAN',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (164,str_to_date('01/24/2008','%m/%d/%Y'),str_to_date('04/06/2016','%m/%d/%Y'),'SA_REP',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (544,str_to_date('02/09/1990','%m/%d/%Y'),str_to_date('01/13/2016','%m/%d/%Y'),'MK_MAN',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (10,str_to_date('04/05/2010','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'AD_ASST',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (121,str_to_date('04/18/2005','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'ST_CLERK',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (122,str_to_date('05/01/2003','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'FI_ACCOUNT',50);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (353,str_to_date('05/15/2015','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'AC_MGR',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (267,str_to_date('10/22/2015','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'AD_VP',210);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (857,str_to_date('01/02/2015','%m/%d/%Y'),str_to_date('03/15/2016','%m/%d/%Y'),'MK_MAN',null);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('03/01/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('03/20/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('03/30/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (15,str_to_date('12/30/2014','%m/%d/%Y'),str_to_date('03/28/2016','%m/%d/%Y'),'AD_PRES',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('04/30/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (247,str_to_date('05/31/2006','%m/%d/%Y'),str_to_date('03/18/2016','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (71,str_to_date('10/04/2015','%m/%d/%Y'),str_to_date('12/01/2015','%m/%d/%Y'),'AD_PRES',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (2,str_to_date('08/19/2015','%m/%d/%Y'),str_to_date('12/22/2015','%m/%d/%Y'),'SA_REP',150);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (18,str_to_date('03/17/2015','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'AD_PRES',30);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (6,str_to_date('02/18/2013','%m/%d/%Y'),str_to_date('02/03/2016','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (1,str_to_date('12/26/2015','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'MK_MAN',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (2,str_to_date('06/11/2014','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'SA_REP',150);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (3,str_to_date('02/02/2014','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'FI_ACCOUNT',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (4,str_to_date('04/04/2013','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'AC_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (5,str_to_date('05/07/2013','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'ST_MAN',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (6,str_to_date('02/26/2014','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'FI_ACCOUNT',110);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (7,str_to_date('11/24/2014','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'PU_CLERK',30);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (13,str_to_date('11/12/2011','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (23,str_to_date('07/26/2015','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AD_PRES',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (264,str_to_date('10/26/2015','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (37,str_to_date('09/15/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'FI_MGR',200);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (900,str_to_date('01/01/1970','%m/%d/%Y'),str_to_date('03/21/2016','%m/%d/%Y'),'AD_PRES',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (152,str_to_date('08/20/2005','%m/%d/%Y'),str_to_date('03/29/2016','%m/%d/%Y'),'SA_REP',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('02/10/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'SH_CLERK',100);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (285,str_to_date('01/13/2016','%m/%d/%Y'),str_to_date('03/31/2016','%m/%d/%Y'),'AD_ASST',90);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (21,str_to_date('12/27/2014','%m/%d/%Y'),str_to_date('02/04/2016','%m/%d/%Y'),'IT_PROG',20);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (14,str_to_date('10/03/2015','%m/%d/%Y'),str_to_date('02/15/2016','%m/%d/%Y'),'FI_ACCOUNT',80);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (555,str_to_date('10/22/2015','%m/%d/%Y'),str_to_date('02/22/2016','%m/%d/%Y'),'SA_REP',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (31,str_to_date('11/11/0024','%m/%d/%Y'),str_to_date('02/24/2016','%m/%d/%Y'),'AC_MGR',10);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (260,str_to_date('05/30/2013','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (260,str_to_date('05/31/2013','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (260,str_to_date('06/01/2013','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'IT_PROG',60);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (260,str_to_date('06/02/2013','%m/%d/%Y'),str_to_date('02/26/2016','%m/%d/%Y'),'AC_ACCOUNT',120);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (278,str_to_date('11/11/2015','%m/%d/%Y'),str_to_date('03/17/2016','%m/%d/%Y'),'ST_CLERK',180);
Insert into GAS.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (118,str_to_date('12/05/2006','%m/%d/%Y'),str_to_date('03/22/2016','%m/%d/%Y'),'PU_MAN',30);
-- INSERTING into GAS.LOCATIONS
/* SET DEFINE OFF; */
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1000,'1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1100,'93091 Calle della Testa','10934','Venice',null,'IT');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1300,'9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2000,'40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2300,'198 Clementi North','540198','Singapore',null,'SG');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2400,'8204 Arthur St',null,'London',null,'UK');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into GAS.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
-- INSERTING into GAS.REGIONS
/* SET DEFINE OFF; */
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (1,'Europe');
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (2,'Americas');
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (3,'Asia');
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (4,'Middle East and Africa');
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (1234,'qwerty');
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (143,'ILY');
Insert into GAS.REGIONS (REGION_ID,REGION_NAME) values (5,'asdf');
-- ------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`DEPT_LOCATION_IX` ON `GAS`.`DEPARTMENTS` (`LOCATION_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`LOC_COUNTRY_IX` ON `GAS`.`LOCATIONS` (`COUNTRY_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index EMP_NAME_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`EMP_NAME_IX` ON `GAS`.`EMPLOYEES` (`LAST_NAME`, `FIRST_NAME`) 
  ;
-- ------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`LOC_STATE_PROVINCE_IX` ON `GAS`.`LOCATIONS` (`STATE_PROVINCE`) 
  ;
-- ------------------------------------------------------
--  DDL for Index LOC_CITY_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`LOC_CITY_IX` ON `GAS`.`LOCATIONS` (`CITY`) 
  ;
-- ------------------------------------------------------
--  DDL for Index LOC_ID_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`LOC_ID_PK` ON `GAS`.`LOCATIONS` (`LOCATION_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`EMP_DEPARTMENT_IX` ON `GAS`.`EMPLOYEES` (`DEPARTMENT_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`COUNTRY_C_ID_PK` ON `GAS`.`COUNTRIES` (`COUNTRY_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`JHIST_DEPARTMENT_IX` ON `GAS`.`JOB_HISTORY` (`DEPARTMENT_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index JOB_ID_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`JOB_ID_PK` ON `GAS`.`JOBS` (`JOB_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index DEPT_ID_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`DEPT_ID_PK` ON `GAS`.`DEPARTMENTS` (`DEPARTMENT_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index EMP_JOB_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`EMP_JOB_IX` ON `GAS`.`EMPLOYEES` (`JOB_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`JHIST_EMPLOYEE_IX` ON `GAS`.`JOB_HISTORY` (`EMPLOYEE_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`EMP_MANAGER_IX` ON `GAS`.`EMPLOYEES` (`MANAGER_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`EMP_EMAIL_UK` ON `GAS`.`EMPLOYEES` (`EMAIL`) 
  ;
-- ------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
-- ------------------------------------------------------

  CREATE INDEX `GAS`.`JHIST_JOB_IX` ON `GAS`.`JOB_HISTORY` (`JOB_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index REG_ID_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`REG_ID_PK` ON `GAS`.`REGIONS` (`REGION_ID`) 
  ;
-- ------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`JHIST_EMP_ID_ST_DATE_PK` ON `GAS`.`JOB_HISTORY` (`EMPLOYEE_ID`, `START_DATE`) 
  ;
-- ------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
-- ------------------------------------------------------

  CREATE UNIQUE INDEX `GAS`.`EMP_EMP_ID_PK` ON `GAS`.`EMPLOYEES` (`EMPLOYEE_ID`) 
  ;
-- ------------------------------------------------------
--  Constraints for Table JOB_HISTORY
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`JOB_HISTORY` ADD CONSTRAINT `JHIST_DATE_INTERVAL` CHECK (end_date > start_date);
  ALTER TABLE `GAS`.`JOB_HISTORY` MODIFY (`JOB_ID` CONSTRAINT `JHIST_JOB_NN` NOT NULL ENABLE);
  ALTER TABLE `GAS`.`JOB_HISTORY` MODIFY (`END_DATE` CONSTRAINT `JHIST_END_DATE_NN` NOT NULL ENABLE);
  ALTER TABLE `GAS`.`JOB_HISTORY` MODIFY (`START_DATE` CONSTRAINT `JHIST_START_DATE_NN` NOT NULL ENABLE);
  ALTER TABLE `GAS`.`JOB_HISTORY` MODIFY (`EMPLOYEE_ID` CONSTRAINT `JHIST_EMPLOYEE_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Constraints for Table DEPARTMENTS
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`DEPARTMENTS` ADD CONSTRAINT `DEPT_ID_PK` PRIMARY KEY (`DEPARTMENT_ID`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`DEPARTMENTS` MODIFY (`DEPARTMENT_NAME` CONSTRAINT `DEPT_NAME_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Constraints for Table EMPLOYEES
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`EMPLOYEES` ADD CONSTRAINT `EMP_EMP_ID_PK` PRIMARY KEY (`EMPLOYEE_ID`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`EMPLOYEES` ADD CONSTRAINT `EMP_EMAIL_UK` UNIQUE (`EMAIL`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`EMPLOYEES` ADD CONSTRAINT `EMP_SALARY_MIN` CHECK (salary > 0);
  ALTER TABLE `GAS`.`EMPLOYEES` MODIFY (`JOB_ID` CONSTRAINT `EMP_JOB_NN` NOT NULL ENABLE);
  ALTER TABLE `GAS`.`EMPLOYEES` MODIFY (`HIRE_DATE` CONSTRAINT `EMP_HIRE_DATE_NN` NOT NULL ENABLE);
  ALTER TABLE `GAS`.`EMPLOYEES` MODIFY (`EMAIL` CONSTRAINT `EMP_EMAIL_NN` NOT NULL ENABLE);
  ALTER TABLE `GAS`.`EMPLOYEES` MODIFY (`LAST_NAME` CONSTRAINT `EMP_LAST_NAME_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Constraints for Table COUNTRIES
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`COUNTRIES` ADD CONSTRAINT `COUNTRY_C_ID_PK` PRIMARY KEY (`COUNTRY_ID`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`COUNTRIES` MODIFY (`COUNTRY_ID` CONSTRAINT `COUNTRY_ID_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Constraints for Table JOBS
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`JOBS` ADD CONSTRAINT `JOB_ID_PK` PRIMARY KEY (`JOB_ID`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`JOBS` MODIFY (`JOB_TITLE` CONSTRAINT `JOB_TITLE_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Constraints for Table LOCATIONS
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`LOCATIONS` ADD CONSTRAINT `LOC_ID_PK` PRIMARY KEY (`LOCATION_ID`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`LOCATIONS` MODIFY (`CITY` CONSTRAINT `LOC_CITY_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Constraints for Table REGIONS
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`REGIONS` ADD CONSTRAINT `REG_ID_PK` PRIMARY KEY (`REGION_ID`)
  10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE `USERS`  ENABLE;
  ALTER TABLE `GAS`.`REGIONS` MODIFY (`REGION_ID` CONSTRAINT `REGION_ID_NN` NOT NULL ENABLE);
-- ------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`COUNTRIES` ADD CONSTRAINT `COUNTR_REG_FK` FOREIGN KEY (`REGION_ID`)
	  REFERENCES `GAS`.`REGIONS` (`REGION_ID`);
-- ------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`DEPARTMENTS` ADD CONSTRAINT `DEPT_LOC_FK` FOREIGN KEY (`LOCATION_ID`)
	  REFERENCES `GAS`.`LOCATIONS` (`LOCATION_ID`);
  ALTER TABLE `GAS`.`DEPARTMENTS` ADD CONSTRAINT `DEPT_MGR_FK` FOREIGN KEY (`MANAGER_ID`)
	  REFERENCES `GAS`.`EMPLOYEES` (`EMPLOYEE_ID`);
-- ------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`EMPLOYEES` ADD CONSTRAINT `EMP_DEPT_FK` FOREIGN KEY (`DEPARTMENT_ID`)
	  REFERENCES `GAS`.`DEPARTMENTS` (`DEPARTMENT_ID`);
  ALTER TABLE `GAS`.`EMPLOYEES` ADD CONSTRAINT `EMP_JOB_FK` FOREIGN KEY (`JOB_ID`)
	  REFERENCES `GAS`.`JOBS` (`JOB_ID`);
  ALTER TABLE `GAS`.`EMPLOYEES` ADD CONSTRAINT `EMP_MANAGER_FK` FOREIGN KEY (`MANAGER_ID`)
	  REFERENCES `GAS`.`EMPLOYEES` (`EMPLOYEE_ID`);
-- ------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`JOB_HISTORY` ADD CONSTRAINT `JHIST_DEPT_FK` FOREIGN KEY (`DEPARTMENT_ID`)
	  REFERENCES `GAS`.`DEPARTMENTS` (`DEPARTMENT_ID`);
  ALTER TABLE `GAS`.`JOB_HISTORY` ADD CONSTRAINT `JHIST_EMP_FK` FOREIGN KEY (`EMPLOYEE_ID`)
	  REFERENCES `GAS`.`EMPLOYEES` (`EMPLOYEE_ID`);
  ALTER TABLE `GAS`.`JOB_HISTORY` ADD CONSTRAINT `JHIST_JOB_FK` FOREIGN KEY (`JOB_ID`)
	  REFERENCES `GAS`.`JOBS` (`JOB_ID`);
-- ------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
-- ------------------------------------------------------

  ALTER TABLE `GAS`.`LOCATIONS` ADD CONSTRAINT `LOC_C_ID_FK` FOREIGN KEY (`COUNTRY_ID`)
	  REFERENCES `GAS`.`COUNTRIES` (`COUNTRY_ID`);
-- ------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
-- ------------------------------------------------------

  CREATE OR REPLACE TRIGGER `GAS`.`SECURE_EMPLOYEES` 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER `GAS`.`SECURE_EMPLOYEES` DISABLE;
-- ------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
-- ------------------------------------------------------

  CREATE OR REPLACE TRIGGER `GAS`.`UPDATE_JOB_HISTORY` 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate(),
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER `GAS`.`UPDATE_JOB_HISTORY` DISABLE;
-- ------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
-- ------------------------------------------------------
/* set define off; */

  DROP PROCEDURE IF EXISTS `GAS`.`ADD_JOB_HISTORY`;

  DELIMITER //

  CREATE PROCEDURE `GAS`.`ADD_JOB_HISTORY` 
  (  p_emp_id           /* Use -meta option job_history.employee_id%type */
   , p_start_date datetime      /* Use -meta option job_history.start_date%type */
   , p_end_date datetime        /* Use -meta option job_history.end_date%type */
   , p_job_id           /* Use -meta option job_history.job_id%type */
   , p_department_id    /* Use -meta option job_history.department_id%type */
   )
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END;
//

DELIMITER ;

 add_job_history;

/
-- ------------------------------------------------------
--  DDL for Procedure SECURE_DML
-- ------------------------------------------------------
/* set define off; */

  DROP PROCEDURE IF EXISTS `GAS`.`SECURE_DML`;

  DELIMITER //

  CREATE PROCEDURE `GAS`.`SECURE_DML`() 
BEGIN
  IF DATE_FORMAT (SYSDATE(), '%H:%i') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE(), 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END;
//

DELIMITER ;

 secure_dml;

/
