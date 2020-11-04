Departments
-
dept_no VARCHAR(255) PK
dept_name VARCHAR(255)

Department_Employee
-
emp_no INT PK FK - Employees.emp_no
dept_no VARCHAR(255) FK - Departments.dept_no

Department_Manager
-
dept_no VARCHAR(255)
emp_no INT PK FK - Employees.emp_no

Employees
-
emp_no INT PK 
emp_title VARCHAR(255) FK - Titles.title_id
birth_date VARCHAR(255)
first_name VARCHAR(255) 
last_name VARCHAR(255) 
sex VARCHAR(255)
hire_date VARCHAR(255)

Salaries
-
emp_no INT PK FK - Employees.emp_no
salary INT

Titles
-
title_id VARCHAR(255) PK
title VARCHAR(255)