# Employee Database SQL Project

## 📌 Project Overview

This project is an Employee Management Database developed using Oracle SQL.

The project demonstrates how to design a relational database, create tables, insert employee and project data, and perform SQL analysis using queries.

The project contains database creation scripts, sample data, and 100 SQL analysis queries.

---

## 🎯 Project Objectives

- Design an Employee Management relational database
- Create tables using SQL
- Define Primary Keys and Foreign Keys
- Insert and manage employee data
- Establish relationships between employees, departments, and projects
- Perform data analysis using SQL queries
- Practice SQL joins, aggregate functions, subqueries, and filtering
- Analyze employee and project information

---

## 🗄️ Database Structure

The database contains the following tables:

### 1. Departments

Stores information about company departments.

Main columns:

- department_id
- department_name
- loc

### 2. Employees

Stores employee information.

Main columns:

- employee_id
- first_name
- last_name
- email
- hiredate
- salary
- department_id

### 3. Projects

Stores company project information.

Main columns:

- project_id
- project_name
- start_date
- end_date
- budget

### 4. Employee_Projects

Stores the relationship between employees and projects.

Main columns:

- employee_id
- project_id

---

## 🔗 Table Relationships

The database uses relational constraints to connect the tables.

```text
DEPARTMENTS
     |
     | 1 : Many
     |
EMPLOYEES
     |
     | Many : Many
     |
EMPLOYEE_PROJECTS
     |
     |
PROJECTS