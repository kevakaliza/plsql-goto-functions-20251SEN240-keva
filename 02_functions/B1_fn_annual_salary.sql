CREATE OR REPLACE FUNCTION fn_annual_salary (p_monthly_salary IN NUMBER)
RETURN NUMBER
IS
BEGIN
    IF p_monthly_salary IS NULL THEN
        RETURN NULL;
    END IF;

    IF p_monthly_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary must be a non-negative number.');
    END IF;

    RETURN p_monthly_salary * 12;
END;
/