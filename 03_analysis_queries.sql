-- >>>>>>> SQL EMPLOYEE PROJECT - ANALYSIS QUERIES <<<<<<<<<<<<<<<<<


-- ///// BATCH 01 BASIC SQL //////

-- Q1. Employees earning more than 60,000
select employee_id,first_name,last_name,salary
from Employees
where salary > 60000;

-- Q2.Employees earning Less than 50,000
select employee_id,first_name,last_name,salary
from Employees
where salary<50000;

--Q3.Employees from department 10
select *
from Employees
where department_id=10;

--Q4.Employees hired after 1 January 2023
SELECT employee_id, first_name, hire_date, salary
FROM employees
WHERE hire_date > TO_DATE('01-Jan-2023','DD-Mon-YYYY');

--Q5.Sort employees by salary from highest to lowest
select employee_id,first_name,last_name,salary
from employees
order by salary desc;

--Q6.Sort employees by salary from lowest to highest
select employee_id,first_name,last_name,salary
from employees
order by salary;

--Q7.Find employees whose salary is between 50,000 and 70,000
select employee_id,first_name,salary
from employees
where salary between 50000 and 70000;

--Q8.Find employees belonging to departments 10, 30, or 50
select employee_id,first_name,department_id
from employees
where department_id in (10,30,50);

--Q9.Find employees whose first name starts with A
select employee_id,first_name,salary
from employees
where first_name like 'A%';

--Q10.Find employees whose last name contains Patil
select employee_id,first_name,last_name
from employees
where last_name like '%Patil%';





-- ///// BATCH 02 Aggregate Functions //////


--Q1. Count total employees
select count(*)
from employees;

--Q2. Find the total salary paid to all employees
select sum(salary)
from employees;

--Q3.Find the average employee salary
select avg(salary)
from employees;

--Q4.find highest salary 
select max(salary)
from employees;

--Q5.find lowest salary
select min(salary)
from employees;

--Q6.count employee in each department
select department_id, count(*)
from employees
group by department_id;

--Q7. find average salary for each department
select department_id, avg(salary)
from employees
group by department_id;

--Q8.Find total salary for each department
select department_id,sum(salary)
from employees
group by department_id;

--Q9.Find the highest salary in each department
select department_id,max(salary)
from employees
group by department_id;

--Q10.Show departments having more than 2 employees
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;





--///// BATCH 03  JOINS //////

--Q1.Employee with department name
select e.employee_id,e.first_name,e.last_name,d.department_name
from employees e inner JOIN departments d
on e.department_id=d.department_id;

--Q2.Employee salary with department name
select e.employee_id,e.first_name,e.salary,d.department_name
from Employees e inner JOIN departments d
on e.department_id=d.department_id;

--Q3.Employees working in Mumbai
select e.employee_id,e.first_name,e.last_name,d.department_name,d.loc
from employees e inner join departments d 
on e.department_id=d.department_id
where d.loc in ('Mumbai');

--Q4.Employees with their project names
SELECT e.employee_id,e.first_name,p.project_name
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
INNER JOIN projects p
ON ep.project_id = p.project_id;

--Q5.Employee, project and role
select e.first_name,p.project_name,ep.role
from employees e inner join employee_projects ep
on e.employee_id=ep.employee_id
inner join projects p 
on ep.project_id=p.project_id;
--Q6.Employees working on the "Data Warehouse" project

select e.employee_id,e.first_name,e.last_name,p.project_name
from employees e inner join employee_projects ep
on e.employee_id=ep.employee_id
inner join projects p
on ep.project_id=p.project_id
where project_name in ('Data Warehouse');

--Q7 Employees working on projects with budget greater than 600,000
select e.employee_id,e.first_name,p.project_name,p.budget
from employees e inner join employee_projects ep
on e.employee_id=ep.employee_id
inner join projects p
on ep.project_id=p.project_id
where budget>600000;

--Q8 Show each project and the employees assigned to it
select p.project_id,p.project_name,e.employee_id,e.first_name
from projects p left join employee_projects ep
on p.project_id=ep.project_id
left join employees e  
on ep.employee_id=e.employee_id;

--Q9 Show employees and their department location
select e.employee_id,e.first_name,d.department_name,d.loc
from employees e inner join departments d
on e.department_id=d.department_id;

--Q10 Show employee, department, project and role
select e.employee_id,e.first_name,d.department_name,p.project_name,ep.role
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
INNER JOIN projects p
ON ep.project_id = p.project_id;





--////// BATCH 04 SubQueries /////

--Q1.Employees earning more than the average salary
select employee_id,first_name,salary
from employees
where salary>(select avg(salary)
from employees );

--Q2.Employee(s) earning the highest salary
select employee_id,first_name,last_name,salary
from employees
where salary in (select max(salary)
from employees);

--Q3 Employee(s) earning the lowest salary
select employee_id,first_name,last_name,salary
from employees
where salary in (select min(salary)
from employees);

--Q4 Employees earning more than the average salary of department 10
select employee_id,first_name,last_name,salary,department_id
from employees
where salary>(select avg(salary)
from employees
where department_id=10);

--Q5 Employees working in the same department as Amit
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = (
SELECT department_id
FROM employees
WHERE first_name = 'Amit');


--Q6 Employees earning more than Amit
select employee_id,first_name,salary
from employees
where salary>(select salary
from employees
WHERE first_name = 'Amit');

-- Q7.Employees working in the IT department
select employee_id,first_name,last_name
from employees
where department_id in (select department_id
from departments
where department_name in ('IT'));

--Q8 Employees assigned to the Data Warehouse project
select employee_id,first_name
from employees
where employee_id in (select employee_id
from employee_projects
where project_id=(select project_id
from projects
where project_name='Data Warehouse'));

--Q9.Projects with a budget greater than the average project budget
select project_id,project_name,budget
from projects
where budget>(select avg(budget)
from projects);

--Q10.Employees who are assigned to at least one project
SELECT employee_id,  first_name
FROM employees
WHERE employee_id IN (SELECT employee_id
FROM employee_projects);





-- /////// BATCH 05 Case Statements & Conditional Logic ///////

--Q1.Salary category
select employee_id,first_name,salary,
Case 
    when salary>=70000 then 'High'
    when salary>=50000 then 'Medium'
    else 'Low'
end as Salary_category
from employees;

--Q2.Employee experience category
select employee_id,first_name,hire_date,
Case 
    when hire_date<'01-Jan-2022' then 'experienced'
    when hire_date>'01-Jan-2022' then 'Recent'
end as experience
from employees;

--Q3.Department type
select employee_id,first_name,department_id,
Case
    when department_id=10 then 'IT'
    when department_id=20 then 'HR'
    when department_id=30 then 'Finance'
    when department_id=40 then 'Sales'
    when department_id=50 then 'Marketing'
end as department_type
from employees;

--Q4.Salary increase calculation
select employee_id,first_name,salary,
Case
    when salary>=70000 then salary*1.10
    when salary>=50000 then salary*1.07
    else salary*1.05
end as New_salary
from employees;

--Q5.Salary status
select employee_id,first_name,salary,
Case
    when salary>=60000 then 'Above Target'
    else 'Below Target'
end as Salary_Status
from employees;

--Q.6 Project budget category
select project_id,project_name,budget,
Case
    when budget>=800000 then 'Large'
    when budget>=500000 then 'Medium'
    else 'Small'
end as budget_category
from projects;

--Q.7 Employee department location
select e.employee_id,e.first_name,d.department_name,d.loc,
Case 
    when d.loc='Mumbai' then 'Mumbai Office'
    when d.loc='Thane' then 'Thane Office'
    when d.loc='Pune' then 'Pune Office'
    when d.loc='Navi Mumbai' then 'Navi Mumbai Office'
end as location_type
from employees e inner join departments d
on e.department_id=d.department_id;

--Q.8 Employee performance level
select employee_id,first_name,salary,
Case
    when salary>=70000 then 'Excellent'
    when salary>=60000 then 'Good'
    when salary>=50000 then 'Average'
    else 'need improvement'
end as performance
from employees;

--Q9.Project duration status
select project_id,project_name, start_date , end_date,
Case
    when end_date-start_date>300 then 'long'
    else 'short'
end as duration_status
from projects;

--Q.10 Employee project count

SELECT e.employee_id,
       e.first_name,
       COUNT(ep.project_id) AS project_count,
       CASE
           WHEN COUNT(ep.project_id) >= 2 THEN 'Multiple Projects'
           WHEN COUNT(ep.project_id) = 1 THEN 'Single Project'
           ELSE 'No Project'
       END AS project_status
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name
ORDER BY e.employee_id;




--////// BATCH 06 Date & String Functions ///////////

--Q1. Display employee names in uppercase
select employee_id,upper(first_name), upper(last_name)
from employees;

--Q2. Display employee names in lowercase
select employee_id,lower(first_name), lower(last_name)
from employees;

--Q3. Display full employee name
select employee_id ,first_name|| '' ||last_name as full_name
from employees;

--Q4 Find employees whose first name has more than 4 characters
select employee_id,first_name
from employees
where Length(first_name)>4;

--Q5.Display the first 3 characters of each employee's first name
select employee_id,first_name,SUBSTR(first_name,1,3) as first_3_char
FROM Employees;

--Q6.Display employee email domain
SELECT employee_id,email,SUBSTR(email, INSTR(email, '@') + 1) AS email_domain
FROM employees;

--Q7.Display employee's hire year
select employee_id,first_name,hire_date,EXTRACT(YEAR FROM hire_date) as hire_year
from employees;

--Q8.Find employees hired in 2023
SELECT employee_id,first_name,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2023;


--Q9. Calculate years of service
select  employee_id,first_name,hire_date,floor(MONTHS_BETWEEN(SYSDATE, hire_date) / 12 ) as years_of_service  
from employees;

-- Q10.Find projects that lasted more than 200 days
select project_id,project_name,start_date,end_date,end_date-start_date as duration_days
from employees
where end_date-start_date>200;




-- ////// Batch 07 Advanced Aggregation & HAVING //////

-- Q1.Count employees in each department
select d.department_id,d.department_name,count(*) as employee_count
from departments d inner join employees e
on d.department_id=e.department_id
group by d.department_id,d.department_name;

--Q2. Find departments with average salary above 55,000
select department_id,avg(salary) as average_salary
from Employees
group by department_id
having avg(salary)>55000;

--Q3. Find departments where total salary is greater than 100,000
select department_id, sum(salary) as total_salary
from Employees
group by department_id
having sum(salary)>100000;

--Q4.  Find the highest-paid employee in each department
SELECT employee_id, first_name,last_name,department_id,salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
)
ORDER BY department_id;

--Q5.Find departments with more than 2 employees
select department_id,department_name,count(e.employee_id) as employee_count
from departments d
inner join employees e
on d.department_id=e.department_id
group by department_id,department_name
having count(*)>2;

--Q6. Count employees assigned to each project
select project_id,project_name,count(ep.employee_id) as employee_count
from projects p inner join employee_projects ep
on p.project_id=ep.project_id
group by project_id,project_name;

--Q7.Find projects having more than 2 employees
select p.project_id,p.project_name,count(ep.employee_id) as employee_count
from projects p inner join employee_projects ep
on p.project_id=ep.project_id
group by p.project_id,p.project_name
having count(*)>2;

--Q8. Find the average salary by department and show department name
select d.department_id,d.department_name,avg(e.salary) as average_salary
from departments d inner join employees e
on d.department_id=e.department_id
group by d.department_id,d.department_name;

--Q9.Find the department with the highest average salary
select d.department_id,d.department_name,avg(e.salary) as average_salary
from departments d inner join employees e
on d.department_id=e.department_id
group by d.department_id,d.department_name
having avg(e.Salary)=(
    select max(avg_salary)
    from (
        select avg(salary) as avg_salary
        from employees
        group by department_id
    )
);

--Q10. Find the project with the highest number of employees
select p.project_id,p.project_name, count(ep.employee_id) as employee_count
from projects p inner join employee_projects ep
on p.project_id=ep.project_id
group by p.project_id,p.project_name
order by employee_count desc
fetch first 1 row only;



-- ///// Batch 08 Advanced JOINs + Subqueries ////////

--Q1.Find employees and their department names
select employee_id,first_name,department_name
from employees e inner join departments d
on e.department_id=d.department_id;

--Q2.Employees working in Mumbai departments
SELECT e.employee_id, e.first_name,d.department_name, d.loc
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.loc = 'Mumbai';

--Q3.Employees assigned to more than one project
SELECT e.employee_id, e.first_name,COUNT(ep.project_id) AS project_count
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name
HAVING COUNT(ep.project_id) > 1;

--Q4.Employees not assigned to any project
SELECT e.employee_id,e.first_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.employee_id IS NULL;

--Q5.Projects with no employees assigned
SELECT p.project_id,p.project_name
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id = ep.project_id
WHERE ep.project_id IS NULL;


-- Q6. Employees earning more than their department average
SELECT e.employee_id, e.first_name,
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


--Q7. Employee(s) with the second-highest salary
SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- Q8. Employees working on the same project as Amit

SELECT DISTINCT e.employee_id,
       e.first_name,
       ep.project_id
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IN (
    SELECT ep2.project_id
    FROM employee_projects ep2
    INNER JOIN employees e2
    ON ep2.employee_id = e2.employee_id
    WHERE e2.first_name = 'Amit'
);

-- Q9. Project(s) having the highest budget

SELECT project_id,project_name, budget
FROM projects
WHERE budget = (
    SELECT MAX(budget)
    FROM projects
);

-- Q10. Employees assigned to at least 2 projects
-- and earning more than 50,000

SELECT e.employee_id,
       e.first_name,
       e.salary,
       COUNT(ep.project_id) AS project_count
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
WHERE e.salary > 50000
GROUP BY e.employee_id, e.first_name, e.salary
HAVING COUNT(ep.project_id) >= 2;




--///// Batch 09 Advanced SQL /////////

--Q1. Employees working on Data Warehouse
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       p.project_name
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
INNER JOIN projects p
ON ep.project_id = p.project_id
WHERE p.project_name = 'Data Warehouse';

-- Q2. Employees working on more than one project
SELECT e.employee_id,
       e.first_name,
       COUNT(ep.project_id) AS project_count
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name
HAVING COUNT(ep.project_id) > 1;

-- Q3. Total budget of all projects
SELECT SUM(budget) AS total_budget
FROM projects;

-- Q4. Average project budget
SELECT AVG(budget) AS average_budget
FROM projects;

-- Q5. Projects with budget above average
SELECT project_id,
       project_name,
       budget
FROM projects
WHERE budget > (
    SELECT AVG(budget)
    FROM projects
);

-- Q6. Employee with the highest salary
SELECT employee_id,
       first_name,
       last_name,
       salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Q7. Employees not assigned to Data Warehouse
SELECT e.employee_id,
       e.first_name,
       e.last_name
FROM employees e
WHERE e.employee_id NOT IN (
    SELECT ep.employee_id
    FROM employee_projects ep
    INNER JOIN projects p
    ON ep.project_id = p.project_id
    WHERE p.project_name = 'Data Warehouse'
);

--Q8. Display employee, department and project
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       p.project_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
INNER JOIN projects p
ON ep.project_id = p.project_id;

--Q9. Number of employees in each project
SELECT p.project_id,
       p.project_name,
       COUNT(ep.employee_id) AS employee_count
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name;


--Q90. Department with the highest total salary
SELECT d.department_id,
       d.department_name,
       SUM(e.salary) AS total_salary
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) = (
    SELECT MAX(total_salary)
    FROM (
        SELECT SUM(salary) AS total_salary
        FROM employees
        GROUP BY department_id
    )
);


--////// Batch 10 Advance Sql Analytics & Reporting /////

-- Q1. Employees with 2 or more projects
SELECT e.employee_id,
       e.first_name,
       COUNT(ep.project_id) AS project_count
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name
HAVING COUNT(ep.project_id) >= 2;

--Q2. Total employee salary by project
SELECT p.project_id,
       p.project_name,
       SUM(e.salary) AS total_salary
FROM projects p
INNER JOIN employee_projects ep
ON p.project_id = ep.project_id
INNER JOIN employees e
ON ep.employee_id = e.employee_id
GROUP BY p.project_id, p.project_name;

--Q3. Projects with total employee salary > 150000
SELECT p.project_id,
       p.project_name,
       SUM(e.salary) AS total_salary
FROM projects p
INNER JOIN employee_projects ep
ON p.project_id = ep.project_id
INNER JOIN employees e
ON ep.employee_id = e.employee_id
GROUP BY p.project_id, p.project_name
HAVING SUM(e.salary) > 150000;

-- Q4. Highest-paid employee in each department
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.department_id,
       e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id;


-- Q5. Employees earning above company average
SELECT employee_id,
       first_name,
       last_name,
       salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


--Q6. Department with lowest average salary
SELECT d.department_id,
       d.department_name,
       AVG(e.salary) AS average_salary
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) = (
    SELECT MIN(average_salary)
    FROM (
        SELECT AVG(salary) AS average_salary
        FROM employees
        GROUP BY department_id
    )
);

--Q7. Employees working on highest-budget project
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       p.project_name,
       p.budget
FROM employees e
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
INNER JOIN projects p
ON ep.project_id = p.project_id
WHERE p.budget = (
    SELECT MAX(budget)
    FROM projects
);

-- Q8. Employee salary category
SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 70000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;


-- Q9. Department with the most employees
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) = (
    SELECT MAX(employee_count)
    FROM (
        SELECT COUNT(*) AS employee_count
        FROM employees
        GROUP BY department_id
    )
);

-- Q10. Complete Employee Project Report
SELECT e.employee_id,
       e.first_name || ' ' || e.last_name AS employee_name,
       d.department_name,
       e.salary,
       p.project_name,
       ep.role
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN employee_projects ep
ON e.employee_id = ep.employee_id
INNER JOIN projects p
ON ep.project_id = p.project_id
ORDER BY e.employee_id;



