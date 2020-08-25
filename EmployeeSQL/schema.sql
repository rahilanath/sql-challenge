-- Create schemas
CREATE SCHEMA IF NOT EXISTS dbo;


-- Create tables
CREATE TABLE IF NOT EXISTS dbo.departments
(
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(25),
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS dbo.dept_emp
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dbo.dept_manager
(
    dept_no VARCHAR(4),
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS dbo.employees
(
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(30),
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(1),
    hire_date DATE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS dbo.titles
(
    title_id VARCHAR(30) NOT NULL,
    title VARCHAR(25),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS dbo.salaries
(
    emp_no INTEGER NOT NULL,
    salary DECIMAL(8, 2),
    PRIMARY KEY(emp_no)
);


-- Create FKs
ALTER TABLE dbo.employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dbo.salaries(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dbo.dept_emp
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dbo.departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dbo.dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dbo.employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dbo.employees
    ADD    FOREIGN KEY (emp_title_id)
    REFERENCES dbo.titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dbo.dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dbo.employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dbo.dept_manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dbo.departments(dept_no)
    MATCH SIMPLE
;