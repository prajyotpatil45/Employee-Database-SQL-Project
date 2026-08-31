

create table DEPARTMENTS
(
department_id number(5) primary key, 
department_name varchar2(15),
loc  varchar2(10)   
);


create table EMPLOYEES
(
    employee_id number(5) primary key,
    first_name varchar2(20),
    last_name varchar2(20),
    email varchar2(40),
    hire_date date,
    salary number(10,2),
    department_id number(5),

    FOREIGN KEY (department_id)
REFERENCES DEPARTMENTS(department_id)
);


create table PROJECTS
(
    project_id number(5) primary key,
    project_name varchar2(30) not null,
    start_date date,
    end_date date,
    budget number(12,2)
);

create table EMPLOYEE_PROJECTS
(
    employee_id number(5),
    project_id number(5),
    role  varchar2(30),
    assigned_date date,

    primary key(employee_id,project_id),

    FOREIGN key(employee_id)
REFERENCES EMPLOYEES(employee_id),

    FOREIGN key(project_id)
REFERENCES PROJECTS(project_id)

);