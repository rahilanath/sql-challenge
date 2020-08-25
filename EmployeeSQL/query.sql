-------------------
-- Data Analysis --
-------------------

-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT emp.emp_no
	,emp.last_name
	,emp.first_name
	,emp.sex
	,sal.salary
FROM dbo.employees AS emp
LEFT JOIN dbo.salaries AS sal
	ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no ASC;

-- List first name, last name, and hire date for employees who 
-- were hired in 1986.
SELECT last_name
	,first_name
	,hire_date
FROM dbo.employees
WHERE extract(year FROM hire_date) = 1986
ORDER BY last_name
	,first_name;
	
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.
SELECT mgr.emp_no
	,emp.last_name
	,emp.first_name
	,mgr.dept_no
	,dept.dept_name
FROM dbo.dept_manager AS mgr
LEFT JOIN dbo.departments AS dept
	ON mgr.dept_no = dept.dept_no
LEFT JOIN dbo.employees AS emp
	ON mgr.emp_no = emp.emp_no
ORDER BY mgr.emp_no ASC;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT deptemp.emp_no
	,emp.last_name
	,emp.first_name
	,dept.dept_name
FROM dbo.dept_emp AS deptemp
LEFT JOIN dbo.employees AS emp
	ON deptemp.emp_no = emp.emp_no
LEFT JOIN dbo.departments AS dept
	ON deptemp.dept_no = dept.dept_no
ORDER BY emp.emp_no ASC;

-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT last_name
	,first_name
	,sex
FROM dbo.employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
ORDER BY last_name
	,first_name;

-- List all employees in the Sales department, including their employee 
-- number, last name, first name, and department name.
SELECT deptemp.emp_no
	,emp.last_name
	,emp.first_name
	,dept.dept_name
FROM dbo.dept_emp AS deptemp
INNER JOIN dbo.departments AS dept
	ON deptemp.dept_no = dept.dept_no
LEFT JOIN dbo.employees AS emp
	ON deptemp.emp_no = emp.emp_no
WHERE dept.dept_name = 'Sales'
ORDER BY deptemp.emp_no ASC;

-- List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT deptemp.emp_no
	,emp.last_name
	,emp.first_name
	,dept.dept_name
FROM dbo.dept_emp AS deptemp
INNER JOIN dbo.departments AS dept
	ON deptemp.dept_no = dept.dept_no
LEFT JOIN dbo.employees AS emp
	ON deptemp.emp_no = emp.emp_no
WHERE dept.dept_name IN ('Sales', 'Development')
ORDER BY deptemp.emp_no ASC;

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name
	,COUNT(*) AS frequency
FROM dbo.employees
GROUP BY last_name
ORDER BY frequency DESC;