-- Insert records into DEPARTMENTS table

insert into DEPARTMENTS values(10,'IT','Mumbai');
insert into DEPARTMENTS values(20,'HR','Thane');
insert into DEPARTMENTS values(30,'Finance','Mumbai');
insert into DEPARTMENTS values(40,'sales','Pune');
insert into DEPARTMENTS values(50,'Marketing','Navi Mumbai');

-- Insert records into Employees table 

INSERT INTO EMPLOYEES VALUES(101, 'Rahul', 'Sharma', 'rahul@company.com',TO_DATE('15-Jan-2022', 'DD-Mon-YYYY'), 55000, 10);
INSERT INTO EMPLOYEES VALUES(102, 'Priya', 'Patil', 'priya@company.com',TO_DATE('10-Mar-2022', 'DD-Mon-YYYY'), 62000, 20);
INSERT INTO EMPLOYEES VALUES(103, 'Amit', 'Shah', 'amit@company.com',TO_DATE('20-Jun-2021', 'DD-Mon-YYYY'), 75000, 10);
INSERT INTO EMPLOYEES VALUES(104, 'Sneha', 'Joshi', 'sneha@company.com',TO_DATE('05-Aug-2023', 'DD-Mon-YYYY'), 48000, 30);
INSERT INTO EMPLOYEES VALUES(105, 'Rohan', 'Mehta', 'rohan@company.com',TO_DATE('12-Sep-2022', 'DD-Mon-YYYY'), 58000, 40);
INSERT INTO EMPLOYEES VALUES(106, 'Neha', 'Kulkarni', 'neha@company.com',TO_DATE('18-Feb-2024', 'DD-Mon-YYYY'), 45000, 50);
INSERT INTO EMPLOYEES VALUES(107, 'Akash', 'Desai', 'akash@company.com',TO_DATE('25-Nov-2021', 'DD-Mon-YYYY'), 68000, 10);
INSERT INTO EMPLOYEES VALUES(108, 'Pooja', 'More', 'pooja@company.com',TO_DATE('14-Apr-2023', 'DD-Mon-YYYY'), 52000, 30);
INSERT INTO EMPLOYEES VALUES(109, 'Vijay', 'Patil', 'vijay@company.com',TO_DATE('01-Jul-2022', 'DD-Mon-YYYY'), 61000, 40);
INSERT INTO EMPLOYEES VALUES(110, 'Anjali', 'Rao', 'anjali@company.com',TO_DATE('10-Jan-2024', 'DD-Mon-YYYY'), 47000, 50);


-- Insert record into projects table

INSERT INTO PROJECTS VALUES(201,'ERP Migration',TO_DATE('10-Jan-2023','DD-Mon-YYYY'),TO_DATE('30-Jun-2023','DD-Mon-YYYY'),500000);
INSERT INTO PROJECTS VALUES(202,'Mobile App',TO_DATE('01-Mar-2023','DD-Mon-YYYY'),TO_DATE('31-Dec-2023','DD-Mon-YYYY'),750000);
INSERT INTO PROJECTS VALUES(203,'Data Warehouse',TO_DATE('15-Feb-2024','DD-Mon-YYYY'),TO_DATE('30-Nov-2024','DD-Mon-YYYY'),900000);
INSERT INTO PROJECTS VALUES(204,'Website Redesign',TO_DATE('01-May-2023','DD-Mon-YYYY'),TO_DATE('31-Aug-2023','DD-Mon-YYYY'),300000);
INSERT INTO PROJECTS VALUES(205,'CRM Implementation',TO_DATE('01-Jan-2024','DD-Mon-YYYY'),TO_DATE('31-Dec-2024','DD-Mon-YYYY'),650000);

-- Insert record into Employee_projects table

INSERT INTO Employee_projects VALUES(101,201,'Developer',TO_DATE('20-Jan-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(101,202,'Developer',TO_DATE('05-Mar-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(102,204,'HR Coordinator',TO_DATE('10-May-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(103,201,'Project Lead',TO_DATE('15-Jan-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(103,203,'Data Engineer',TO_DATE('20-Feb-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(104,203,'Financial Analyst',TO_DATE('25-Feb-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(105,204,'Sales Executive',TO_DATE('10-May-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(105,205,'Sales Lead',TO_DATE('05-Jan-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(106,205,'Marketing Specialist',TO_DATE('10-Jan-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(107,201,'Senior Developer',TO_DATE('20-Jan-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(107,203,'Data Engineer',TO_DATE('20-Feb-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(108,203,'Financial Analyst',TO_DATE('25-Feb-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(109,204,'Sales Executive',TO_DATE('10-May-2023','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(109,205,'Sales Executive',TO_DATE('05-Jan-2024','DD-Mon-YYYY'));
INSERT INTO Employee_projects VALUES(110,205,'Marketing Analyst',TO_DATE('10-Jan-2024','DD-Mon-YYYY'));

COMMIT;