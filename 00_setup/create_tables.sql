-- Version B: Departments and Employees

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees PURGE';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments PURGE';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    salary NUMBER(12,2),
    hire_date DATE,
    department_id NUMBER REFERENCES departments(department_id)
);

INSERT INTO departments VALUES (101, 'Accounting');
INSERT INTO departments VALUES (202, 'Technology');
INSERT INTO departments VALUES (303, 'Human Resources');

INSERT INTO employees VALUES
(11, 'David', 'Karemera', 85000, DATE '2017-02-14', 101);

INSERT INTO employees VALUES
(12, 'Claire', 'Mukeshimana', 42000, DATE '2021-07-20', 202);

INSERT INTO employees VALUES
(13, 'Kevin', 'Nsengiyumva', 55000, DATE '2022-10-03', 101);

INSERT INTO employees VALUES
(14, 'Olivia', 'Uwitonze', 28000, DATE '2025-04-18', 303);

INSERT INTO employees VALUES
(15, 'Brian', 'Hakizimana', 110000, DATE '2019-08-12', NULL);

INSERT INTO employees VALUES
(16, 'Emily', 'Niyomugabo', 0, DATE '2023-01-25', 202);

INSERT INTO employees VALUES
(17, 'Samuel', 'Twagirayezu', 67000, DATE '2027-03-11', 303);

COMMIT;

SELECT *
FROM employees
ORDER BY employee_id;
