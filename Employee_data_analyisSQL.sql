/*1.List the following details of each employee: employee number, last name, 
first name, gender, and salary.*/

select e.emp_no,e.Last_name , e.first_name,gender, sal.salary 
from employees e , salaries sal
where e.emp_no=sal.emp_no;

/*2.List employees who were hired in 1986*/
select * from employees where extract(year from hire_date)=1986;

/*3.List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, 
first name, and start and end employment dates.*/
select dm.dept_no, d.dept_name, dm.emp_no, e.Last_name, e.first_name, dm.from_date, dm.to_date
from employees e , departments d, dept_manager dm
where e.emp_no= dm.emp_no and dm.dept_no=d.dept_no;

/*4. List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
select e.emp_no, e.last_name,e.first_name,d.dept_name
from employees e,dept_emp de, departments d
where e.emp_no=de.emp_no and de.dept_no=d.dept_no order by dept_name;

/*5. List all employees whose first name is "Hercules" and 
last names begin with "B."*/
select *
from employees e where e.first_name='Hercules' and Left(last_name,1)='B' ;

/*6.List all employees in the Sales department, 
including their employee number, last name, first name, and department name.*/

select e.emp_no, e.last_name,e.first_name,d.dept_name
from employees e,dept_emp de, departments d
where e.emp_no=de.emp_no and de.dept_no=d.dept_no and d.dept_name='Sales';

/*7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
and department name.*/
select e.emp_no, e.last_name,e.first_name,d.dept_name
from employees e,dept_emp de, departments d
where e.emp_no=de.emp_no and de.dept_no=d.dept_no and d.dept_name in ('Sales','Development');

/*8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
*/
select  last_name , count(first_name) no_of_emplyees_sharing_sameLN from employees group by last_name  order by 1 desc;
