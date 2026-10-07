CREATE OR REPLACE FUNCTION fn_validate_payroll (p_employee_id IN NUMBER)
RETURN VARCHAR2
IS
    v_salary    employees.salary%TYPE;
    v_hire_date employees.hire_date%TYPE;
    v_dept_id   employees.department_id%TYPE;
BEGIN
    SELECT salary, hire_date, department_id
    INTO v_salary, v_hire_date, v_dept_id
    FROM employees
    WHERE employee_id = p_employee_id;

    IF v_salary IS NULL OR v_salary <= 0 THEN
        RETURN 'INVALID: salary must be greater than zero';
    END IF;

    IF v_hire_date IS NULL THEN
        RETURN 'INVALID: hire date is missing';
    END IF;

    IF fn_years_of_service(v_hire_date) IS NULL THEN
        RETURN 'INVALID: hire date is in the future';
    END IF;

    IF fn_dept_name(v_dept_id) = 'Unknown' THEN
        RETURN 'INVALID: department not found';
    END IF;

    RETURN 'VALID';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: employee not found';
    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END;
/