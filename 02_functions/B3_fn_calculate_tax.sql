CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary IN NUMBER)
RETURN NUMBER
IS
BEGIN
    IF p_salary IS NULL THEN
        RETURN NULL;
    END IF;

    IF p_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Salary must be a non-negative number.');
    END IF;

    IF p_salary <= 30000 THEN
        RETURN p_salary * 0.05;
    ELSIF p_salary <= 60000 THEN
        RETURN p_salary * 0.10;
    ELSIF p_salary <= 100000 THEN
        RETURN p_salary * 0.15;
    ELSE
        RETURN p_salary * 0.20;
    END IF;
END;
/