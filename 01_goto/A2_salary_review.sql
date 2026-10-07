-- A2 Version B: Salary Review

SET SERVEROUTPUT ON

DECLARE
    v_increase NUMBER;
    v_result   NUMBER;

BEGIN

    FOR emp IN (
        SELECT employee_id, first_name, salary
        FROM employees
        ORDER BY employee_id
    )
    LOOP

        IF emp.salary IS NULL OR emp.salary <= 0 THEN
            DBMS_OUTPUT.PUT_LINE(
                emp.first_name || ': skipped because salary is invalid'
            );
            GOTO continue_loop;
        END IF;

        IF emp.salary < 50000 THEN
            v_increase := emp.salary * 0.10;
            v_result := emp.salary + v_increase;
        ELSE
            v_result := emp.salary + 5000;
        END IF;

        IF v_result > 100000 THEN
            v_result := 100000;

            DBMS_OUTPUT.PUT_LINE(
                emp.first_name || ': salary capped at 100,000'
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                emp.first_name || ': ' ||
                emp.salary || ' becomes ' || v_result
            );
        END IF;

        <<continue_loop>>
        NULL;

    END LOOP;

END;
/
