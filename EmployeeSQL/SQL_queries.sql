CREATE TABLE departments (
    dept_no VARCHAR(255)   NOT NULL,
    dept_name VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE department_employee (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_department_employee PRIMARY KEY (
        emp_no, dept_no
     )
);

CREATE TABLE department_manager (
    dept_no VARCHAR(255)   NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_department_manager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title VARCHAR(255)   NOT NULL,
    birth_date VARCHAR(255)   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    sex VARCHAR(255)   NOT NULL,
    hire_date VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE titles (
    title_id VARCHAR(255)   NOT NULL,
    title VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE department_employee ADD CONSTRAINT fk_department_employee_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE department_employee ADD CONSTRAINT fk_department_employee_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager ADD CONSTRAINT fk_department_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title FOREIGN KEY(emp_title)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM department_employee;
SELECT * FROM department_manager;
	
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no;
	
SELECT first_name, last_name, hire_date
FROM employees WHERE hire_date LIKE '%1986';

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM department_manager AS dm
JOIN departments AS d
	ON dm.dept_no = d.dept_no
JOIN employees AS e
	ON e.emp_no = dm.emp_no;
	
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN department_employee AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no;
	
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN department_employee AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN department_employee AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

SELECT last_name, COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;

