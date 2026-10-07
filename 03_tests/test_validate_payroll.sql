SET LINESIZE 200
SET PAGESIZE 50

COLUMN first_name FORMAT A12
COLUMN result     FORMAT A45

-- Every employee
SELECT employee_id,
       first_name,
       fn_validate_payroll(employee_id) AS result
FROM employees
ORDER BY employee_id;

-- An ID that does not exist
SELECT fn_validate_payroll(9999) AS result FROM dual;