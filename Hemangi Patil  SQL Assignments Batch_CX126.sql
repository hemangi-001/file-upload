Create Database Hemangi_130

CREATE TABLE departments0 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees5 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    hire_date DATE,
    dept_id INT,
    gender CHAR(1),
    FOREIGN KEY (dept_id) REFERENCES departments0(dept_id)
);

CREATE TABLE salaries2 (
    emp_id INT,
    salary INT,
    bonus INT,
    FOREIGN KEY (emp_id) REFERENCES employees5(emp_id)
);

Select * From departments0
Select * From Employees5
Select * From Salaries2

Q:1 Retrieve all Employees who work in the IT departments
Sol: Select emp_name From Employees5 
     Join Departments0 on Employees5.dept_id=departments0.dept_id
	 where departments0.dept_name='IT'

Q:2List employees hired after 1st jan 2018.
Sol: Select emp_name,hire_date
     From employees5
	 where hire_date>'2018-01-01'

Q:3 Show employees with salary greater than 70000
Sol: Select employees5.emp_name,Salaries2.Salary
     From employees5
	 join Salaries2 on employees5.emp_id=Salaries2.emp_id
	 where Salaries2.Salary>70000

Q:4 Count employees in each department.
Sol: Select departments0.dept_name,COUNT(*)AS Total_employees
     from employees5
	 join departments0 ON employees5.dept_id=departments0.dept_id
	 Group by departments0.dept_name

Q:5 Get the average salary of female employees.
Sol:Select AVG(Salaries2.Salary) AS avg_female_salary
    From employees5
	Join salaries2 ON employees5.emp_id=Salaries2.emp_id
	where gender='f'

Q:6 Find the top 5 highest paid employees.
Sol: Select employees5.emp_name,Salaries2.salary
     from employees5
	 join Salaries2 ON employees5.emp_id=Salaries2.emp_id
	 Order by Salaries2.Salary DESC
	 
Q:7 List employees with a bonus more than 4000.
Sol: Select employees5.emp_name,Salaries2.bonus
     from employees5
	 Join salaries2 on employees5.emp_id=Salaries2.emp_id
	 where Salaries2.bonus>4000

Q:8 Find employees not receving any bonus.
Sol: Select employees5.emp_name
     from employees5
	 Join Salaries2 on employees5.emp_id=Salaries2.emp_id
	 where Salaries2.bonus=0

Q:9 Find Total payroll(Salary+bonus)per department.
Sol: Select departments0.dept_name,SUM(Salaries2.salary+Salaries2.bonus)AS total_payroll 
    from employees5
	join Salaries2 on Employees5.emp_id=Salaries2.emp_id
	join departments0 on employees5.dept_id=departments0.dept_id
	Group by departments0.dept_name

Q:10 Count male and female employees.
Sol: Select gender,COUNT(*) AS Count
     from employees5
	 Group by gender

Q:11 List departments with average salary over 60000
Sol: Select departments0.dept_name,AVG(Salaries2.salary)AS avg_Salary
     From employees5
	 Join salaries2 ON employees5.emp_id=Salaries2.emp_id
	 Join departments0 on employees5.dept_id=departments0.dept_id
	 Group by departments0.dept_name
	 Having AVG(Salaries2.salary)>60000

Q:12 Find the youngest employee based on hire date
Sol: Select emp_name,hire_date
     from employees5
	 Order by hire_date DESC
	 
Q:13 List employees without Salary record.
Sol: Select employees5.emp_name
     from employees5
	 left join Salaries2 on employees5.emp_id=salaries2.emp_id
	 where Salaries2.emp_id is NULL

Q:14 Rank employees by salary within their department
Sol: Select employees5.emp_name,departments0.dept_name,Salaries2.salary
     RANK()OVER(PARTITION BY e.dept_id ORDER BY Salaries2.Salary DESC) AS Salary_rank
	 from employees5
	 join Salaries2 on employees5.emp_id=salaries2.emp_id
	 join departments0 ON employees5.dept_id=departments0.dept_id

Q:15 Add a prefix"Emp_"to all employee names.
Sol: Select emp_name,CONCAT('Emp_',emp_name) AS modified_name
    From employees5

Q:16 Find employees whose names Start with 'S'
Sol: Select emp_name
     From employees5
	 where emp_name Like 'S%'

Q:17 Find employees whose names contain the Substring 'an'.
Sol: Select emp_name
     From employees5
	 Where emp_name LIKE '%an%'

Q:18 Return employees whose names have 'a' as the second letter
Sol: Select emp_name
     From employees5
	 Where CHARINDEX('a', emp_name)=2

Q:19 Extract the last 2 characters from employee names that the longer than 5 letters
Sol: Select emp_name,RIGHT(emp_name,2) AS last_two_chars
     From employees5
	 Where CHAR_LENGTH(emp_name)>5

Q:20 Extract characters before the first occurrence of letter 'a' in employees names
Sol: Select emp_name,
     LEFT(emp_name, CHARINDEX('a', emp_name)-1)AS before_a From employees5
	 WHERE CHARINDEX('a',emp_name)>0