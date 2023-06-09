--------------------------------------------------------
--  File created - �������-������-04-2023   
--------------------------------------------------------
DROP SEQUENCE "C##HR"."DEPARTMENTS_SEQ";
DROP SEQUENCE "C##HR"."EMPLOYEES_SEQ";
DROP SEQUENCE "C##HR"."LOCATIONS_SEQ";
DROP TABLE "C##HR"."ARENDATOR" cascade constraints;
DROP TABLE "C##HR"."AUTOMOB" cascade constraints;
DROP TABLE "C##HR"."AUTO_SAL" cascade constraints;
DROP TABLE "C##HR"."COUNTRIES" cascade constraints;
DROP TABLE "C##HR"."DEPARTMENTS" cascade constraints;
DROP TABLE "C##HR"."DOLJ" cascade constraints;
DROP TABLE "C##HR"."EMPLOYEES" cascade constraints;
DROP TABLE "C##HR"."JOB_HISTORY" cascade constraints;
DROP TABLE "C##HR"."JOBS" cascade constraints;
DROP TABLE "C##HR"."LOCATIONS" cascade constraints;
DROP TABLE "C##HR"."REGIONS" cascade constraints;
DROP TABLE "C##HR"."S_FIZ_LIC" cascade constraints;
DROP TABLE "C##HR"."S_FIZ_LIC3" cascade constraints;
DROP TABLE "C##HR"."AUTO_SAL" cascade constraints;
DROP TABLE "C##HR"."REGIONS" cascade constraints;
DROP TABLE "C##HR"."LOCATIONS" cascade constraints;
DROP TABLE "C##HR"."EMPLOYEES" cascade constraints;
DROP TABLE "C##HR"."DEPARTMENTS" cascade constraints;
DROP TABLE "C##HR"."JOBS" cascade constraints;
DROP TABLE "C##HR"."COUNTRIES" cascade constraints;
DROP TABLE "C##HR"."ARENDATOR" cascade constraints;
DROP TABLE "C##HR"."AUTOMOB" cascade constraints;
DROP TABLE "C##HR"."DOLJ" cascade constraints;
DROP TABLE "C##HR"."JOB_HISTORY" cascade constraints;
DROP TABLE "C##HR"."S_FIZ_LIC" cascade constraints;
DROP TABLE "C##HR"."S_FIZ_LIC3" cascade constraints;
DROP VIEW "C##HR"."EMP_DETAILS_VIEW";
DROP PROCEDURE "C##HR"."ADD_JOB_HISTORY";
DROP PROCEDURE "C##HR"."SECURE_DML";
DROP PROCEDURE "C##HR"."ADD_JOB_HISTORY";
DROP PROCEDURE "C##HR"."SECURE_DML";
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ARENDATOR
--------------------------------------------------------

  CREATE TABLE "C##HR"."ARENDATOR" 
   (	"KOD_ARENDATORA" NUMBER(10,0), 
	"IM" VARCHAR2(38 BYTE), 
	"FAM" VARCHAR2(38 BYTE), 
	"DATA_ROJD" DATE, 
	"ADRES" VARCHAR2(38 BYTE), 
	"TEL" VARCHAR2(38 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AUTOMOB
--------------------------------------------------------

  CREATE TABLE "C##HR"."AUTOMOB" 
   (	"ID_A" NUMBER(10,0), 
	"ID_S" NUMBER(5,0), 
	"MARK_A" VARCHAR2(25 BYTE), 
	"COUNTRY_A" VARCHAR2(25 BYTE), 
	"COLOUR" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AUTO_SAL
--------------------------------------------------------

  CREATE TABLE "C##HR"."AUTO_SAL" 
   (	"ID_S" NUMBER(5,0), 
	"CITY" VARCHAR2(25 BYTE), 
	"STREET" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "C##HR"."COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2 BYTE), 
	"COUNTRY_NAME" VARCHAR2(40 BYTE), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50;

   COMMENT ON COLUMN "C##HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "C##HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "C##HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "C##HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "C##HR"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
   COMMENT ON TABLE "C##HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
--------------------------------------------------------
--  DDL for Table DOLJ
--------------------------------------------------------

  CREATE TABLE "C##HR"."DOLJ" 
   (	"KOD_DOLJ" NUMBER(5,0), 
	"DOLJ" VARCHAR2(128 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "C##HR"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "C##HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "C##HR"."JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
   COMMENT ON TABLE "C##HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "C##HR"."JOBS" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
   COMMENT ON COLUMN "C##HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "C##HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "C##HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "C##HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "C##HR"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
   COMMENT ON TABLE "C##HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "C##HR"."REGIONS" 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table S_FIZ_LIC
--------------------------------------------------------

  CREATE TABLE "C##HR"."S_FIZ_LIC" 
   (	"KOD" NUMBER(5,0), 
	"FAM" VARCHAR2(50 BYTE), 
	"IM" VARCHAR2(50 BYTE), 
	"OTCH" VARCHAR2(50 BYTE), 
	"P_VIDAN" VARCHAR2(50 BYTE), 
	"P_SER_NOM" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table S_FIZ_LIC3
--------------------------------------------------------

  CREATE TABLE "C##HR"."S_FIZ_LIC3" 
   (	"KOD" NUMBER(5,0), 
	"FIO" VARCHAR2(150 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AUTO_SAL
--------------------------------------------------------

  CREATE TABLE "C##HR"."AUTO_SAL" 
   (	"ID_S" NUMBER(5,0), 
	"CITY" VARCHAR2(25 BYTE), 
	"STREET" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "C##HR"."REGIONS" 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "C##HR"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
   COMMENT ON COLUMN "C##HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
   COMMENT ON TABLE "C##HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "C##HR"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "C##HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "C##HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "C##HR"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
   COMMENT ON COLUMN "C##HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
   COMMENT ON TABLE "C##HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "C##HR"."JOBS" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
   COMMENT ON COLUMN "C##HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "C##HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "C##HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "C##HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "C##HR"."COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2 BYTE), 
	"COUNTRY_NAME" VARCHAR2(40 BYTE), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50;

   COMMENT ON COLUMN "C##HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "C##HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "C##HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "C##HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
--------------------------------------------------------
--  DDL for Table ARENDATOR
--------------------------------------------------------

  CREATE TABLE "C##HR"."ARENDATOR" 
   (	"KOD_ARENDATORA" NUMBER(10,0), 
	"IM" VARCHAR2(38 BYTE), 
	"FAM" VARCHAR2(38 BYTE), 
	"DATA_ROJD" DATE, 
	"ADRES" VARCHAR2(38 BYTE), 
	"TEL" VARCHAR2(38 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AUTOMOB
--------------------------------------------------------

  CREATE TABLE "C##HR"."AUTOMOB" 
   (	"ID_A" NUMBER(10,0), 
	"ID_S" NUMBER(5,0), 
	"MARK_A" VARCHAR2(25 BYTE), 
	"COUNTRY_A" VARCHAR2(25 BYTE), 
	"COLOUR" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DOLJ
--------------------------------------------------------

  CREATE TABLE "C##HR"."DOLJ" 
   (	"KOD_DOLJ" NUMBER(5,0), 
	"DOLJ" VARCHAR2(128 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "C##HR"."JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
   COMMENT ON COLUMN "C##HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
   COMMENT ON TABLE "C##HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
--------------------------------------------------------
--  DDL for Table S_FIZ_LIC
--------------------------------------------------------

  CREATE TABLE "C##HR"."S_FIZ_LIC" 
   (	"KOD" NUMBER(5,0), 
	"FAM" VARCHAR2(50 BYTE), 
	"IM" VARCHAR2(50 BYTE), 
	"OTCH" VARCHAR2(50 BYTE), 
	"P_VIDAN" VARCHAR2(50 BYTE), 
	"P_SER_NOM" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table S_FIZ_LIC3
--------------------------------------------------------

  CREATE TABLE "C##HR"."S_FIZ_LIC3" 
   (	"KOD" NUMBER(5,0), 
	"FIO" VARCHAR2(150 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "C##HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
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
WITH READ ONLY
;
REM INSERTING into C##HR.ARENDATOR
SET DEFINE OFF;
REM INSERTING into C##HR.AUTOMOB
SET DEFINE OFF;
REM INSERTING into C##HR.AUTO_SAL
SET DEFINE OFF;
Insert into C##HR.AUTO_SAL (ID_S,CITY,STREET) values ('10001','���������','��. ��������');
Insert into C##HR.AUTO_SAL (ID_S,CITY,STREET) values ('10002','���������','��. ��������');
Insert into C##HR.AUTO_SAL (ID_S,CITY,STREET) values ('10003','���������','��. �������');
Insert into C##HR.AUTO_SAL (ID_S,CITY,STREET) values ('10004','���������','��. ���������');
REM INSERTING into C##HR.COUNTRIES
SET DEFINE OFF;
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina','2');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia','3');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil','2');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada','2');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China','3');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt','4');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('HK','HongKong','3');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel','4');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India','3');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan','3');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Kuwait','4');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico','2');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria','4');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore','3');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom','1');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America','2');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia','4');
Insert into C##HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe','4');
REM INSERTING into C##HR.DEPARTMENTS
SET DEFINE OFF;
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('10','Administration','200','1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('20','Marketing','201','1800');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('30','Purchasing','114','1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('40','Human Resources','203','2400');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('50','Shipping','121','1500');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('60','IT','103','1400');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('70','Public Relations','204','2700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('80','Sales','145','2500');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('90','Executive','100','1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('100','Finance','108','1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('110','Accounting','205','1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('120','Treasury',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('130','Corporate Tax',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('140','Control And Credit',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('150','Shareholder Services',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('160','Benefits',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('170','Manufacturing',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('180','Construction',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('190','Contracting',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('200','Operations',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('210','IT Support',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('220','NOC',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('230','IT Helpdesk',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('240','Government Sales',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('250','Retail Sales',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('260','Recruiting',null,'1700');
Insert into C##HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('270','Payroll',null,'1700');
REM INSERTING into C##HR.DOLJ
SET DEFINE OFF;
Insert into C##HR.DOLJ (KOD_DOLJ,DOLJ) values ('1','������');
Insert into C##HR.DOLJ (KOD_DOLJ,DOLJ) values ('2','������');
REM INSERTING into C##HR.EMPLOYEES
SET DEFINE OFF;
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('100','Steven','King','SKING','515.123.4567',to_date('17.06.87','DD.MM.RR'),'AD_PRES','24000',null,null,'90');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('101','Neena','Kochhar','NKOCHHAR','515.123.4568',to_date('21.09.89','DD.MM.RR'),'AD_VP','17000',null,'100','90');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('102','Lex','De Haan','LDEHAAN','515.123.4569',to_date('13.01.93','DD.MM.RR'),'AD_VP','17000',null,'100','90');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('103','Alexander','Hunold','AHUNOLD','590.423.4567',to_date('03.01.90','DD.MM.RR'),'IT_PROG','9000',null,'102','60');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('104','Bruce','Ernst','BERNST','590.423.4568',to_date('21.05.91','DD.MM.RR'),'IT_PROG','6000',null,'103','60');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('105','David','Austin','DAUSTIN','590.423.4569',to_date('25.06.97','DD.MM.RR'),'IT_PROG','4800',null,'103','60');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('106','Valli','Pataballa','VPATABAL','590.423.4560',to_date('05.02.98','DD.MM.RR'),'IT_PROG','4800',null,'103','60');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('107','Diana','Lorentz','DLORENTZ','590.423.5567',to_date('07.02.99','DD.MM.RR'),'IT_PROG','4200',null,'103','60');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('108','Nancy','Greenberg','NGREENBE','515.124.4569',to_date('17.08.94','DD.MM.RR'),'FI_MGR','12000',null,'101','100');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('109','Daniel','Faviet','DFAVIET','515.124.4169',to_date('16.08.94','DD.MM.RR'),'FI_ACCOUNT','9000',null,'108','100');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('110','John','Chen','JCHEN','515.124.4269',to_date('28.09.97','DD.MM.RR'),'FI_ACCOUNT','8200',null,'108','100');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('111','Ismael','Sciarra','ISCIARRA','515.124.4369',to_date('30.09.97','DD.MM.RR'),'FI_ACCOUNT','7700',null,'108','100');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('112','Jose Manuel','Urman','JMURMAN','515.124.4469',to_date('07.03.98','DD.MM.RR'),'FI_ACCOUNT','7800',null,'108','100');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('113','Luis','Popp','LPOPP','515.124.4567',to_date('07.12.99','DD.MM.RR'),'FI_ACCOUNT','6900',null,'108','100');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('114','Den','Raphaely','DRAPHEAL','515.127.4561',to_date('07.12.94','DD.MM.RR'),'PU_MAN','11000',null,'100','30');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('115','Alexander','Khoo','AKHOO','515.127.4562',to_date('18.05.95','DD.MM.RR'),'PU_CLERK','3100',null,'114','30');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('116','Shelli','Baida','SBAIDA','515.127.4563',to_date('24.12.97','DD.MM.RR'),'PU_CLERK','2900',null,'114','30');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('117','Sigal','Tobias','STOBIAS','515.127.4564',to_date('24.07.97','DD.MM.RR'),'PU_CLERK','2800',null,'114','30');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('118','Guy','Himuro','GHIMURO','515.127.4565',to_date('15.11.98','DD.MM.RR'),'PU_CLERK','2600',null,'114','30');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('119','Karen','Colmenares','KCOLMENA','515.127.4566',to_date('10.08.99','DD.MM.RR'),'PU_CLERK','2500',null,'114','30');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('120','Matthew','Weiss','MWEISS','650.123.1234',to_date('18.07.96','DD.MM.RR'),'ST_MAN','7900',null,'100','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('121','Adam','Fripp','AFRIPP','650.123.2234',to_date('10.04.97','DD.MM.RR'),'ST_MAN','8200',null,'100','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('122','Payam','Kaufling','PKAUFLIN','650.123.3234',to_date('01.05.95','DD.MM.RR'),'ST_MAN','8000',null,'100','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('123','Shanta','Vollman','SVOLLMAN','650.123.4234',to_date('10.10.97','DD.MM.RR'),'ST_MAN','6500',null,'100','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('124','Kevin','Mourgos','KMOURGOS','650.123.5234',to_date('16.11.99','DD.MM.RR'),'ST_MAN','5800',null,'100','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('125','Julia','Nayer','JNAYER','650.124.1214',to_date('16.07.97','DD.MM.RR'),'ST_CLERK','3200',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('126','Irene','Mikkilineni','IMIKKILI','650.124.1224',to_date('28.09.98','DD.MM.RR'),'ST_CLERK','2700',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('127','James','Landry','JLANDRY','650.124.1334',to_date('14.01.99','DD.MM.RR'),'ST_CLERK','2400',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('128','Steven','Markle','SMARKLE','650.124.1434',to_date('08.03.00','DD.MM.RR'),'ST_CLERK','2200',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('129','Laura','Bissot','LBISSOT','650.124.5234',to_date('20.08.97','DD.MM.RR'),'ST_CLERK','3300',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('130','Mozhe','Atkinson','MATKINSO','650.124.6234',to_date('30.10.97','DD.MM.RR'),'ST_CLERK','2800',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('131','James','Marlow','JAMRLOW','650.124.7234',to_date('16.02.97','DD.MM.RR'),'ST_CLERK','2500',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('132','TJ','Olson','TJOLSON','650.124.8234',to_date('10.04.99','DD.MM.RR'),'ST_CLERK','2100',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('133','Jason','Mallin','JMALLIN','650.127.1934',to_date('14.06.96','DD.MM.RR'),'ST_CLERK','3300',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('134','Michael','Rogers','MROGERS','650.127.1834',to_date('26.08.98','DD.MM.RR'),'ST_CLERK','2900',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('135','Ki','Gee','KGEE','650.127.1734',to_date('12.12.99','DD.MM.RR'),'ST_CLERK','2400',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('136','Hazel','Philtanker','HPHILTAN','650.127.1634',to_date('06.02.00','DD.MM.RR'),'ST_CLERK','2200',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('137','Renske','Ladwig','RLADWIG','650.121.1234',to_date('14.07.95','DD.MM.RR'),'ST_CLERK','3600',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('138','Stephen','Stiles','SSTILES','650.121.2034',to_date('26.10.97','DD.MM.RR'),'ST_CLERK','3200',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('139','John','Seo','JSEO','650.121.2019',to_date('12.02.98','DD.MM.RR'),'ST_CLERK','2700',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('140','Joshua','Patel','JPATEL','650.121.1834',to_date('06.04.98','DD.MM.RR'),'ST_CLERK','2500',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('141','Trenna','Rajs','TRAJS','650.121.8009',to_date('17.10.95','DD.MM.RR'),'ST_CLERK','3500',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('142','Curtis','Davies','CDAVIES','650.121.2994',to_date('29.01.97','DD.MM.RR'),'ST_CLERK','3100',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('143','Randall','Matos','RMATOS','650.121.2874',to_date('15.03.98','DD.MM.RR'),'ST_CLERK','2600',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('144','Peter','Vargas','PVARGAS','650.121.2004',to_date('09.07.98','DD.MM.RR'),'ST_CLERK','2500',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('145','John','Russell','JRUSSEL','011.44.1344.429268',to_date('01.10.96','DD.MM.RR'),'SA_MAN','14000','0,4','100','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('146','Karen','Partners','KPARTNER','011.44.1344.467268',to_date('05.01.97','DD.MM.RR'),'SA_MAN','13500','0,3','100','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('147','Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',to_date('10.03.97','DD.MM.RR'),'SA_MAN','12000','0,3','100','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('148','Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',to_date('15.10.99','DD.MM.RR'),'SA_MAN','11000','0,3','100','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('149','Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_date('29.01.00','DD.MM.RR'),'SA_MAN','10500','0,2','100','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('150','Peter','Tucker','PTUCKER','011.44.1344.129268',to_date('30.01.97','DD.MM.RR'),'SA_REP','10000','0,3','145','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('151','David','Bernstein','DBERNSTE','011.44.1344.345268',to_date('24.03.97','DD.MM.RR'),'SA_REP','9500','0,25','145','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('152','Peter','Hall','PHALL','011.44.1344.478968',to_date('20.08.97','DD.MM.RR'),'SA_REP','9000','0,25','145','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('153','Christopher','Olsen','COLSEN','011.44.1344.498718',to_date('30.03.98','DD.MM.RR'),'SA_REP','8000','0,2','145','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('154','Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',to_date('09.12.98','DD.MM.RR'),'SA_REP','7500','0,2','145','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('155','Oliver','Tuvault','OTUVAULT','011.44.1344.486508',to_date('23.11.99','DD.MM.RR'),'SA_REP','7000','0,15','145','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('156','Janette','King','JKING','011.44.1345.429268',to_date('30.01.96','DD.MM.RR'),'SA_REP','10000','0,35','146','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('157','Patrick','Sully','PSULLY','011.44.1345.929268',to_date('04.03.96','DD.MM.RR'),'SA_REP','9500','0,35','146','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('158','Allan','McEwen','AMCEWEN','011.44.1345.829268',to_date('01.08.96','DD.MM.RR'),'SA_REP','9000','0,35','146','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('159','Lindsey','Smith','LSMITH','011.44.1345.729268',to_date('10.03.97','DD.MM.RR'),'SA_REP','8000','0,3','146','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('160','Louise','Doran','LDORAN','011.44.1345.629268',to_date('15.12.97','DD.MM.RR'),'SA_REP','7500','0,3','146','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('161','Sarath','Sewall','SSEWALL','011.44.1345.529268',to_date('03.11.98','DD.MM.RR'),'SA_REP','7000','0,25','146','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('162','Clara','Vishney','CVISHNEY','011.44.1346.129268',to_date('11.11.97','DD.MM.RR'),'SA_REP','10500','0,25','147','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('163','Danielle','Greene','DGREENE','011.44.1346.229268',to_date('19.03.99','DD.MM.RR'),'SA_REP','9500','0,15','147','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('164','Mattea','Marvins','MMARVINS','011.44.1346.329268',to_date('24.01.00','DD.MM.RR'),'SA_REP','7200','0,1','147','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('165','David','Lee','DLEE','011.44.1346.529268',to_date('23.02.00','DD.MM.RR'),'SA_REP','6800','0,1','147','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('166','Sundar','Ande','SANDE','011.44.1346.629268',to_date('24.03.00','DD.MM.RR'),'SA_REP','6400','0,1','147','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('167','Amit','Banda','ABANDA','011.44.1346.729268',to_date('21.04.00','DD.MM.RR'),'SA_REP','6200','0,1','147','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('168','Lisa','Ozer','LOZER','011.44.1343.929268',to_date('11.03.97','DD.MM.RR'),'SA_REP','11500','0,25','148','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('169','Harrison','Bloom','HBLOOM','011.44.1343.829268',to_date('23.03.98','DD.MM.RR'),'SA_REP','10000','0,2','148','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('170','Tayler','Fox','TFOX','011.44.1343.729268',to_date('24.01.98','DD.MM.RR'),'SA_REP','9600','0,2','148','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('171','William','Smith','WSMITH','011.44.1343.629268',to_date('23.02.99','DD.MM.RR'),'SA_REP','7400','0,15','148','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('172','Elizabeth','Bates','EBATES','011.44.1343.529268',to_date('24.03.99','DD.MM.RR'),'SA_REP','7300','0,15','148','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('173','Sundita','Kumar','SKUMAR','011.44.1343.329268',to_date('21.04.00','DD.MM.RR'),'SA_REP','6100','0,1','148','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('174','Ellen','Abel','EABEL','011.44.1644.429267',to_date('11.05.96','DD.MM.RR'),'SA_REP','11000','0,3','149','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('175','Alyssa','Hutton','AHUTTON','011.44.1644.429266',to_date('19.03.97','DD.MM.RR'),'SA_REP','8800','0,25','149','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('176','Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_date('24.03.98','DD.MM.RR'),'SA_REP','8600','0,2','149','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('177','Jack','Livingston','JLIVINGS','011.44.1644.429264',to_date('23.04.98','DD.MM.RR'),'SA_REP','8400','0,2','149','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('178','Kimberely','Grant','KGRANT','011.44.1644.429263',to_date('24.05.99','DD.MM.RR'),'SA_REP','7000','0,15','149',null);
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('179','Charles','Johnson','CJOHNSON','011.44.1644.429262',to_date('04.01.00','DD.MM.RR'),'SA_REP','6200','0,1','149','80');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('180','Winston','Taylor','WTAYLOR','650.507.9876',to_date('24.01.98','DD.MM.RR'),'SH_CLERK','3200',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('181','Jean','Fleaur','JFLEAUR','650.507.9877',to_date('23.02.98','DD.MM.RR'),'SH_CLERK','3100',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('182','Martha','Sullivan','MSULLIVA','650.507.9878',to_date('21.06.99','DD.MM.RR'),'SH_CLERK','2500',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('183','Girard','Geoni','GGEONI','650.507.9879',to_date('03.02.00','DD.MM.RR'),'SH_CLERK','2800',null,'120','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('184','Nandita','Sarchand','NSARCHAN','650.509.1876',to_date('27.01.96','DD.MM.RR'),'SH_CLERK','4200',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('185','Alexis','Bull','ABULL','650.509.2876',to_date('20.02.97','DD.MM.RR'),'SH_CLERK','4100',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('186','Julia','Dellinger','JDELLING','650.509.3876',to_date('24.06.98','DD.MM.RR'),'SH_CLERK','3400',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('187','Anthony','Cabrio','ACABRIO','650.509.4876',to_date('07.02.99','DD.MM.RR'),'SH_CLERK','3000',null,'121','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('188','Kelly','Chung','KCHUNG','650.505.1876',to_date('14.06.97','DD.MM.RR'),'SH_CLERK','3800',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('189','Jennifer','Dilly','JDILLY','650.505.2876',to_date('13.08.97','DD.MM.RR'),'SH_CLERK','3600',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('190','Timothy','Gates','TGATES','650.505.3876',to_date('11.07.98','DD.MM.RR'),'SH_CLERK','2900',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('191','Randall','Perkins','RPERKINS','650.505.4876',to_date('19.12.99','DD.MM.RR'),'SH_CLERK','2500',null,'122','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('192','Sarah','Bell','SBELL','650.501.1876',to_date('04.02.96','DD.MM.RR'),'SH_CLERK','4000',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('193','Britney','Everett','BEVERETT','650.501.2876',to_date('03.03.97','DD.MM.RR'),'SH_CLERK','3900',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('194','Samuel','McCain','SMCCAIN','650.501.3876',to_date('01.07.98','DD.MM.RR'),'SH_CLERK','3200',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('195','Vance','Jones','VJONES','650.501.4876',to_date('17.03.99','DD.MM.RR'),'SH_CLERK','2800',null,'123','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('196','Alana','Walsh','AWALSH','650.507.9811',to_date('24.04.98','DD.MM.RR'),'SH_CLERK','3100',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('197','Kevin','Feeney','KFEENEY','650.507.9822',to_date('23.05.98','DD.MM.RR'),'SH_CLERK','3000',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('198','Donald','OConnell','DOCONNEL','650.507.9833',to_date('21.06.99','DD.MM.RR'),'SH_CLERK','2600',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('199','Douglas','Grant','DGRANT','650.507.9844',to_date('13.01.00','DD.MM.RR'),'SH_CLERK','2600',null,'124','50');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('200','Jennifer','Whalen','JWHALEN','515.123.4444',to_date('17.09.87','DD.MM.RR'),'AD_ASST','4400',null,'101','10');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('201','Michael','Hartstein','MHARTSTE','515.123.5555',to_date('17.02.96','DD.MM.RR'),'MK_MAN','13000',null,'100','20');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('202','Pat','Fay','PFAY','603.123.6666',to_date('17.08.97','DD.MM.RR'),'MK_REP','6000',null,'201','20');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('203','Susan','Mavris','SMAVRIS','515.123.7777',to_date('07.06.94','DD.MM.RR'),'HR_REP','6500',null,'101','40');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('204','Hermann','Baer','HBAER','515.123.8888',to_date('07.06.94','DD.MM.RR'),'PR_REP','10000',null,'101','70');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('205','Shelley','Higgins','SHIGGINS','515.123.8080',to_date('07.06.94','DD.MM.RR'),'AC_MGR','12000',null,'101','110');
Insert into C##HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('206','William','Gietz','WGIETZ','515.123.8181',to_date('07.06.94','DD.MM.RR'),'AC_ACCOUNT','8300',null,'205','110');
REM INSERTING into C##HR.JOB_HISTORY
SET DEFINE OFF;
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('102',to_date('13.01.93','DD.MM.RR'),to_date('24.07.98','DD.MM.RR'),'IT_PROG','60');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('101',to_date('21.09.89','DD.MM.RR'),to_date('27.10.93','DD.MM.RR'),'AC_ACCOUNT','110');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('101',to_date('28.10.93','DD.MM.RR'),to_date('15.03.97','DD.MM.RR'),'AC_MGR','110');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('201',to_date('17.02.96','DD.MM.RR'),to_date('19.12.99','DD.MM.RR'),'MK_REP','20');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('114',to_date('24.03.98','DD.MM.RR'),to_date('31.12.99','DD.MM.RR'),'ST_CLERK','50');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('122',to_date('01.01.99','DD.MM.RR'),to_date('31.12.99','DD.MM.RR'),'ST_CLERK','50');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('200',to_date('17.09.87','DD.MM.RR'),to_date('17.06.93','DD.MM.RR'),'AD_ASST','90');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('176',to_date('24.03.98','DD.MM.RR'),to_date('31.12.98','DD.MM.RR'),'SA_REP','80');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('176',to_date('01.01.99','DD.MM.RR'),to_date('31.12.99','DD.MM.RR'),'SA_MAN','80');
Insert into C##HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('200',to_date('01.07.94','DD.MM.RR'),to_date('31.12.98','DD.MM.RR'),'AC_ACCOUNT','90');
REM INSERTING into C##HR.JOBS
SET DEFINE OFF;
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President','20000','40000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President','15000','30000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant','3000','6000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager','8200','16000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant','4200','9000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager','8200','16000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant','4200','9000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager','10000','20000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative','6000','12000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager','8000','15000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk','2500','5500');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager','5500','8500');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk','2000','5000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk','2500','5500');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer','4000','10000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager','9000','15000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative','4000','9000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative','4000','9000');
Insert into C##HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative','4500','10500');
REM INSERTING into C##HR.LOCATIONS
SET DEFINE OFF;
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1000','1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1100','93091 Calle della Testa','10934','Venice',null,'IT');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1200','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1300','9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1400','2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1500','2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1600','2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1700','2004 Charade Rd','98199','Seattle','Washington','US');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1800','147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1900','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2000','40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2100','1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2200','12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2300','198 Clementi North','540198','Singapore',null,'SG');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2400','8204 Arthur St',null,'London',null,'UK');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2500','Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2600','9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2700','Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2800','Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2900','20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3000','Murtenstrasse 921','3095','Bern','BE','CH');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3100','Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into C##HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3200','Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
REM INSERTING into C##HR.REGIONS
SET DEFINE OFF;
Insert into C##HR.REGIONS (REGION_ID,REGION_NAME) values ('1','Europe');
Insert into C##HR.REGIONS (REGION_ID,REGION_NAME) values ('2','Americas');
Insert into C##HR.REGIONS (REGION_ID,REGION_NAME) values ('3','Asia');
Insert into C##HR.REGIONS (REGION_ID,REGION_NAME) values ('4','Middle East and Africa');
REM INSERTING into C##HR.S_FIZ_LIC
SET DEFINE OFF;
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('1','������','����','��������','��� ��������� ������','3310 124568');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('2','������','����','��������','��� ������������ ������','3250 145868');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('3','�������','����','��������','��� ��������� ������','7810 124879');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('4','������','����','��������',null,null);
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('5','�������','����','��������','��� ��������� ������','3310 124568');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('6','����','��������','������','��� ��������� ������','3310 124568');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('7','����','��������','������','��� ������������ ������','3250 145868');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('8','����','��������','�������','��� ��������� ������','7810 124879');
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('9','����','��������','������',null,null);
Insert into C##HR.S_FIZ_LIC (KOD,FAM,IM,OTCH,P_VIDAN,P_SER_NOM) values ('10','����','��������','������','��� ��������� ������','3310 124568');
REM INSERTING into C##HR.S_FIZ_LIC3
SET DEFINE OFF;
Insert into C##HR.S_FIZ_LIC3 (KOD,FIO) values ('5','������ ���� ��������');
REM INSERTING into C##HR.EMP_DETAILS_VIEW
SET DEFINE OFF;
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('100','AD_PRES',null,'90','1700','US','Steven','King','24000',null,'Executive','President','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('101','AD_VP','100','90','1700','US','Neena','Kochhar','17000',null,'Executive','Administration Vice President','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('102','AD_VP','100','90','1700','US','Lex','De Haan','17000',null,'Executive','Administration Vice President','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('103','IT_PROG','102','60','1400','US','Alexander','Hunold','9000',null,'IT','Programmer','Southlake','Texas','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('104','IT_PROG','103','60','1400','US','Bruce','Ernst','6000',null,'IT','Programmer','Southlake','Texas','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('105','IT_PROG','103','60','1400','US','David','Austin','4800',null,'IT','Programmer','Southlake','Texas','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('106','IT_PROG','103','60','1400','US','Valli','Pataballa','4800',null,'IT','Programmer','Southlake','Texas','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('107','IT_PROG','103','60','1400','US','Diana','Lorentz','4200',null,'IT','Programmer','Southlake','Texas','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('108','FI_MGR','101','100','1700','US','Nancy','Greenberg','12000',null,'Finance','Finance Manager','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('109','FI_ACCOUNT','108','100','1700','US','Daniel','Faviet','9000',null,'Finance','Accountant','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('110','FI_ACCOUNT','108','100','1700','US','John','Chen','8200',null,'Finance','Accountant','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('111','FI_ACCOUNT','108','100','1700','US','Ismael','Sciarra','7700',null,'Finance','Accountant','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('112','FI_ACCOUNT','108','100','1700','US','Jose Manuel','Urman','7800',null,'Finance','Accountant','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('113','FI_ACCOUNT','108','100','1700','US','Luis','Popp','6900',null,'Finance','Accountant','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('114','PU_MAN','100','30','1700','US','Den','Raphaely','11000',null,'Purchasing','Purchasing Manager','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('115','PU_CLERK','114','30','1700','US','Alexander','Khoo','3100',null,'Purchasing','Purchasing Clerk','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('116','PU_CLERK','114','30','1700','US','Shelli','Baida','2900',null,'Purchasing','Purchasing Clerk','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('117','PU_CLERK','114','30','1700','US','Sigal','Tobias','2800',null,'Purchasing','Purchasing Clerk','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('118','PU_CLERK','114','30','1700','US','Guy','Himuro','2600',null,'Purchasing','Purchasing Clerk','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('119','PU_CLERK','114','30','1700','US','Karen','Colmenares','2500',null,'Purchasing','Purchasing Clerk','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('120','ST_MAN','100','50','1500','US','Matthew','Weiss','7900',null,'Shipping','Stock Manager','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('121','ST_MAN','100','50','1500','US','Adam','Fripp','8200',null,'Shipping','Stock Manager','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('122','ST_MAN','100','50','1500','US','Payam','Kaufling','8000',null,'Shipping','Stock Manager','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('123','ST_MAN','100','50','1500','US','Shanta','Vollman','6500',null,'Shipping','Stock Manager','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('124','ST_MAN','100','50','1500','US','Kevin','Mourgos','5800',null,'Shipping','Stock Manager','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('125','ST_CLERK','120','50','1500','US','Julia','Nayer','3200',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('126','ST_CLERK','120','50','1500','US','Irene','Mikkilineni','2700',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('127','ST_CLERK','120','50','1500','US','James','Landry','2400',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('128','ST_CLERK','120','50','1500','US','Steven','Markle','2200',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('129','ST_CLERK','121','50','1500','US','Laura','Bissot','3300',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('130','ST_CLERK','121','50','1500','US','Mozhe','Atkinson','2800',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('131','ST_CLERK','121','50','1500','US','James','Marlow','2500',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('132','ST_CLERK','121','50','1500','US','TJ','Olson','2100',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('133','ST_CLERK','122','50','1500','US','Jason','Mallin','3300',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('134','ST_CLERK','122','50','1500','US','Michael','Rogers','2900',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('135','ST_CLERK','122','50','1500','US','Ki','Gee','2400',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('136','ST_CLERK','122','50','1500','US','Hazel','Philtanker','2200',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('137','ST_CLERK','123','50','1500','US','Renske','Ladwig','3600',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('138','ST_CLERK','123','50','1500','US','Stephen','Stiles','3200',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('139','ST_CLERK','123','50','1500','US','John','Seo','2700',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('140','ST_CLERK','123','50','1500','US','Joshua','Patel','2500',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('141','ST_CLERK','124','50','1500','US','Trenna','Rajs','3500',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('142','ST_CLERK','124','50','1500','US','Curtis','Davies','3100',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('143','ST_CLERK','124','50','1500','US','Randall','Matos','2600',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('144','ST_CLERK','124','50','1500','US','Peter','Vargas','2500',null,'Shipping','Stock Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('145','SA_MAN','100','80','2500','UK','John','Russell','14000','0,4','Sales','Sales Manager','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('146','SA_MAN','100','80','2500','UK','Karen','Partners','13500','0,3','Sales','Sales Manager','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('147','SA_MAN','100','80','2500','UK','Alberto','Errazuriz','12000','0,3','Sales','Sales Manager','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('148','SA_MAN','100','80','2500','UK','Gerald','Cambrault','11000','0,3','Sales','Sales Manager','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('149','SA_MAN','100','80','2500','UK','Eleni','Zlotkey','10500','0,2','Sales','Sales Manager','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('150','SA_REP','145','80','2500','UK','Peter','Tucker','10000','0,3','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('151','SA_REP','145','80','2500','UK','David','Bernstein','9500','0,25','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('152','SA_REP','145','80','2500','UK','Peter','Hall','9000','0,25','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('153','SA_REP','145','80','2500','UK','Christopher','Olsen','8000','0,2','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('154','SA_REP','145','80','2500','UK','Nanette','Cambrault','7500','0,2','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('155','SA_REP','145','80','2500','UK','Oliver','Tuvault','7000','0,15','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('156','SA_REP','146','80','2500','UK','Janette','King','10000','0,35','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('157','SA_REP','146','80','2500','UK','Patrick','Sully','9500','0,35','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('158','SA_REP','146','80','2500','UK','Allan','McEwen','9000','0,35','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('159','SA_REP','146','80','2500','UK','Lindsey','Smith','8000','0,3','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('160','SA_REP','146','80','2500','UK','Louise','Doran','7500','0,3','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('161','SA_REP','146','80','2500','UK','Sarath','Sewall','7000','0,25','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('162','SA_REP','147','80','2500','UK','Clara','Vishney','10500','0,25','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('163','SA_REP','147','80','2500','UK','Danielle','Greene','9500','0,15','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('164','SA_REP','147','80','2500','UK','Mattea','Marvins','7200','0,1','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('165','SA_REP','147','80','2500','UK','David','Lee','6800','0,1','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('166','SA_REP','147','80','2500','UK','Sundar','Ande','6400','0,1','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('167','SA_REP','147','80','2500','UK','Amit','Banda','6200','0,1','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('168','SA_REP','148','80','2500','UK','Lisa','Ozer','11500','0,25','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('169','SA_REP','148','80','2500','UK','Harrison','Bloom','10000','0,2','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('170','SA_REP','148','80','2500','UK','Tayler','Fox','9600','0,2','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('171','SA_REP','148','80','2500','UK','William','Smith','7400','0,15','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('172','SA_REP','148','80','2500','UK','Elizabeth','Bates','7300','0,15','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('173','SA_REP','148','80','2500','UK','Sundita','Kumar','6100','0,1','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('174','SA_REP','149','80','2500','UK','Ellen','Abel','11000','0,3','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('175','SA_REP','149','80','2500','UK','Alyssa','Hutton','8800','0,25','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('176','SA_REP','149','80','2500','UK','Jonathon','Taylor','8600','0,2','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('177','SA_REP','149','80','2500','UK','Jack','Livingston','8400','0,2','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('179','SA_REP','149','80','2500','UK','Charles','Johnson','6200','0,1','Sales','Sales Representative','Oxford','Oxford','United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('180','SH_CLERK','120','50','1500','US','Winston','Taylor','3200',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('181','SH_CLERK','120','50','1500','US','Jean','Fleaur','3100',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('182','SH_CLERK','120','50','1500','US','Martha','Sullivan','2500',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('183','SH_CLERK','120','50','1500','US','Girard','Geoni','2800',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('184','SH_CLERK','121','50','1500','US','Nandita','Sarchand','4200',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('185','SH_CLERK','121','50','1500','US','Alexis','Bull','4100',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('186','SH_CLERK','121','50','1500','US','Julia','Dellinger','3400',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('187','SH_CLERK','121','50','1500','US','Anthony','Cabrio','3000',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('188','SH_CLERK','122','50','1500','US','Kelly','Chung','3800',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('189','SH_CLERK','122','50','1500','US','Jennifer','Dilly','3600',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('190','SH_CLERK','122','50','1500','US','Timothy','Gates','2900',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('191','SH_CLERK','122','50','1500','US','Randall','Perkins','2500',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('192','SH_CLERK','123','50','1500','US','Sarah','Bell','4000',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('193','SH_CLERK','123','50','1500','US','Britney','Everett','3900',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('194','SH_CLERK','123','50','1500','US','Samuel','McCain','3200',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('195','SH_CLERK','123','50','1500','US','Vance','Jones','2800',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('196','SH_CLERK','124','50','1500','US','Alana','Walsh','3100',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('197','SH_CLERK','124','50','1500','US','Kevin','Feeney','3000',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('198','SH_CLERK','124','50','1500','US','Donald','OConnell','2600',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('199','SH_CLERK','124','50','1500','US','Douglas','Grant','2600',null,'Shipping','Shipping Clerk','South San Francisco','California','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('200','AD_ASST','101','10','1700','US','Jennifer','Whalen','4400',null,'Administration','Administration Assistant','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('201','MK_MAN','100','20','1800','CA','Michael','Hartstein','13000',null,'Marketing','Marketing Manager','Toronto','Ontario','Canada','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('202','MK_REP','201','20','1800','CA','Pat','Fay','6000',null,'Marketing','Marketing Representative','Toronto','Ontario','Canada','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('203','HR_REP','101','40','2400','UK','Susan','Mavris','6500',null,'Human Resources','Human Resources Representative','London',null,'United Kingdom','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('204','PR_REP','101','70','2700','DE','Hermann','Baer','10000',null,'Public Relations','Public Relations Representative','Munich','Bavaria','Germany','Europe');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('205','AC_MGR','101','110','1700','US','Shelley','Higgins','12000',null,'Accounting','Accounting Manager','Seattle','Washington','United States of America','Americas');
Insert into C##HR.EMP_DETAILS_VIEW (EMPLOYEE_ID,JOB_ID,MANAGER_ID,DEPARTMENT_ID,LOCATION_ID,COUNTRY_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT,DEPARTMENT_NAME,JOB_TITLE,CITY,STATE_PROVINCE,COUNTRY_NAME,REGION_NAME) values ('206','AC_ACCOUNT','205','110','1700','US','William','Gietz','8300',null,'Accounting','Public Accountant','Seattle','Washington','United States of America','Americas');
--------------------------------------------------------
--  DDL for Index AUT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."AUT_PK" ON "C##HR"."AUTOMOB" ("ID_A", "ID_S") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."COUNTRY_C_ID_PK" ON "C##HR"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."DEPT_ID_PK" ON "C##HR"."DEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."DEPT_LOCATION_IX" ON "C##HR"."DEPARTMENTS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_DEPARTMENT_IX" ON "C##HR"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."EMP_EMAIL_UK" ON "C##HR"."EMPLOYEES" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."EMP_EMP_ID_PK" ON "C##HR"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_JOB_IX" ON "C##HR"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_MANAGER_IX" ON "C##HR"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_NAME_IX" ON "C##HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."JHIST_DEPARTMENT_IX" ON "C##HR"."JOB_HISTORY" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."JHIST_EMP_ID_ST_DATE_PK" ON "C##HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."JHIST_EMPLOYEE_IX" ON "C##HR"."JOB_HISTORY" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."JHIST_JOB_IX" ON "C##HR"."JOB_HISTORY" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."JOB_ID_PK" ON "C##HR"."JOBS" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."LOC_CITY_IX" ON "C##HR"."LOCATIONS" ("CITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."LOC_COUNTRY_IX" ON "C##HR"."LOCATIONS" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."LOC_ID_PK" ON "C##HR"."LOCATIONS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."LOC_STATE_PROVINCE_IX" ON "C##HR"."LOCATIONS" ("STATE_PROVINCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."REG_ID_PK" ON "C##HR"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008648
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008648" ON "C##HR"."ARENDATOR" ("KOD_ARENDATORA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008692
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008692" ON "C##HR"."DOLJ" ("KOD_DOLJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008695
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008695" ON "C##HR"."AUTO_SAL" ("ID_S") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008704
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008704" ON "C##HR"."S_FIZ_LIC" ("KOD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008705
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008705" ON "C##HR"."S_FIZ_LIC3" ("KOD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008648
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008648" ON "C##HR"."ARENDATOR" ("KOD_ARENDATORA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index AUT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."AUT_PK" ON "C##HR"."AUTOMOB" ("ID_A", "ID_S") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008695
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008695" ON "C##HR"."AUTO_SAL" ("ID_S") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."COUNTRY_C_ID_PK" ON "C##HR"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."DEPT_ID_PK" ON "C##HR"."DEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."DEPT_LOCATION_IX" ON "C##HR"."DEPARTMENTS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008692
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008692" ON "C##HR"."DOLJ" ("KOD_DOLJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."EMP_EMAIL_UK" ON "C##HR"."EMPLOYEES" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."EMP_EMP_ID_PK" ON "C##HR"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_DEPARTMENT_IX" ON "C##HR"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_JOB_IX" ON "C##HR"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_MANAGER_IX" ON "C##HR"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."EMP_NAME_IX" ON "C##HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."JHIST_EMP_ID_ST_DATE_PK" ON "C##HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."JHIST_JOB_IX" ON "C##HR"."JOB_HISTORY" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."JHIST_EMPLOYEE_IX" ON "C##HR"."JOB_HISTORY" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."JHIST_DEPARTMENT_IX" ON "C##HR"."JOB_HISTORY" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."JOB_ID_PK" ON "C##HR"."JOBS" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."LOC_COUNTRY_IX" ON "C##HR"."LOCATIONS" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."LOC_ID_PK" ON "C##HR"."LOCATIONS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."LOC_CITY_IX" ON "C##HR"."LOCATIONS" ("CITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "C##HR"."LOC_STATE_PROVINCE_IX" ON "C##HR"."LOCATIONS" ("STATE_PROVINCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."REG_ID_PK" ON "C##HR"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008704
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008704" ON "C##HR"."S_FIZ_LIC" ("KOD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008705
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##HR"."SYS_C008705" ON "C##HR"."S_FIZ_LIC3" ("KOD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##HR"."SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "C##HR"."SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##HR"."UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "C##HR"."UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##HR"."UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "C##HR"."UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##HR"."SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "C##HR"."SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "C##HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "C##HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "C##HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "C##HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  Constraints for Table ARENDATOR
--------------------------------------------------------

  ALTER TABLE "C##HR"."ARENDATOR" ADD PRIMARY KEY ("KOD_ARENDATORA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUTOMOB
--------------------------------------------------------

  ALTER TABLE "C##HR"."AUTOMOB" ADD CONSTRAINT "AUT_PK" PRIMARY KEY ("ID_A", "ID_S")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUTO_SAL
--------------------------------------------------------

  ALTER TABLE "C##HR"."AUTO_SAL" ADD PRIMARY KEY ("ID_S")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##HR"."AUTO_SAL" ADD CONSTRAINT "CHK_ID_S" CHECK (id_s >=10000 and id_s<= 99999) ENABLE;
  ALTER TABLE "C##HR"."AUTO_SAL" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."AUTO_SAL" MODIFY ("STREET" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "C##HR"."COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "C##HR"."DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX "C##HR"."DEPT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DOLJ
--------------------------------------------------------

  ALTER TABLE "C##HR"."DOLJ" MODIFY ("KOD_DOLJ" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."DOLJ" ADD UNIQUE ("KOD_DOLJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "C##HR"."EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
  ALTER TABLE "C##HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX "C##HR"."EMP_EMP_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "C##HR"."JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
  ALTER TABLE "C##HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX "C##HR"."JHIST_EMP_ID_ST_DATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "C##HR"."JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX "C##HR"."JOB_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "C##HR"."LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX "C##HR"."LOC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "C##HR"."REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "C##HR"."REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX "C##HR"."REG_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_FIZ_LIC
--------------------------------------------------------

  ALTER TABLE "C##HR"."S_FIZ_LIC" ADD PRIMARY KEY ("KOD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table S_FIZ_LIC3
--------------------------------------------------------

  ALTER TABLE "C##HR"."S_FIZ_LIC3" ADD PRIMARY KEY ("KOD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTOMOB
--------------------------------------------------------

  ALTER TABLE "C##HR"."AUTOMOB" ADD FOREIGN KEY ("ID_S")
	  REFERENCES "C##HR"."AUTO_SAL" ("ID_S") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "C##HR"."COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "C##HR"."REGIONS" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "C##HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "C##HR"."LOCATIONS" ("LOCATION_ID") ENABLE;
  ALTER TABLE "C##HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "C##HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "C##HR"."EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "C##HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "C##HR"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "C##HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "C##HR"."EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "C##HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "C##HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "C##HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "C##HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "C##HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "C##HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "C##HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "C##HR"."LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "C##HR"."COUNTRIES" ("COUNTRY_ID") ENABLE;
