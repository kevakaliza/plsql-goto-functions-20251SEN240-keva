SET LINESIZE 200
SET PAGESIZE 50

COLUMN first_name       FORMAT A12
COLUMN department       FORMAT A18
COLUMN salary           FORMAT 999,999
COLUMN annual_salary    FORMAT 9,999,999
COLUMN years_of_service FORMAT 99
COLUMN tax              FORMAT 99,999

SELECT employee_id,
       first_name,
       salary,
       fn_annual_salary(salary)       AS annual_salary,
       fn_years_of_service(hire_date) AS years_of_service,
       fn_calculate_tax(salary)       AS tax,
       fn_dept_name(department_id)    AS department
FROM employees
ORDER BY employee_id;