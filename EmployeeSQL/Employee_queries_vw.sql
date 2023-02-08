--1 List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS employee_name,
	ep.first_name,
	ep.sex,
	sl.salary
FROM employees ep
JOIN salaries sl ON sl.emp_no = ep.emp_no

--2 List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS employee_name,
	ep.hire_date
FROM employees ep
WHERE hire_date >= '19860101' AND hire_date <= '19861231'
ORDER BY 3

--3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS dept_manager,
	dp.dept_no,
	dp.dept_name,
	ep.emp_no
FROM employees ep
JOIN dept_manager dm ON dm.emp_no = ep.emp_no
JOIN departments dp ON dp.dept_no = dm.dept_no

--4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS employee_name,
	dp.dept_no,
	dp.dept_name,
	ep.emp_no
FROM employees ep
JOIN dept_emp de ON de.emp_no = ep.emp_no
JOIN departments dp ON dp.dept_no = de.dept_no

--5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS employee_name,
	ep.sex
FROM employees ep
WHERE ep.first_name = 'Hercules' AND ep.last_name LIKE 'B%'
ORDER BY 1

--6 List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS employee_name,
	ep.emp_no
FROM employees ep
JOIN dept_emp de ON de.emp_no = ep.emp_no
JOIN departments dp ON dp.dept_no = de.dept_no
WHERE dp.dept_name = 'Sales'

--7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	CONCAT(ep.first_name , ' ', ep.last_name) AS employee_name,
	ep.emp_no,
	dp.dept_name
FROM employees ep
JOIN dept_emp de ON de.emp_no = ep.emp_no
JOIN departments dp ON dp.dept_no = de.dept_no
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development'

--8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	ep.last_name,
	COUNT(*) 
FROM employees ep
GROUP BY ep.last_name
HAVING COUNT(*) > 1
ORDER BY 2 DESC