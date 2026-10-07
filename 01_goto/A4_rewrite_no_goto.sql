-- A4 Version B: Rewriting A1 and A2 without GOTO

SET SERVEROUTPUT ON

-- A1 WITHOUT GOTO

DECLARE
    v_value NUMBER := 24;

BEGIN

    IF v_value = 0 THEN

        DBMS_OUTPUT.PUT_LINE('The number is ZERO');

    ELSIF v_value > 0 THEN

        DBMS_OUTPUT.PUT_LINE(v_value || ' is POSITIVE');

        IF MOD(v_value, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(v_value || ' is EVEN');
        ELSE
            DBMS_OUTPUT.PUT_LINE(v_value || ' is ODD');
        END IF;

    ELSE

        DBMS_OUTPUT.PUT_LINE(v_value || ' is NEGATIVE');

        IF MOD(v_value, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(v_value || ' is EVEN');
        ELSE
            DBMS_OUTPUT.PUT_LINE(v_value || ' is ODD');
        END IF;

    END IF;

    DBMS_OUTPUT.PUT_LINE('Classification finished.');

END;
/

-- A2 WITHOUT GOTO

DECLARE
    v_adjusted_salary NUMBER;

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

            CONTINUE;

        END IF;

        IF emp.salary < 50000 THEN
            v_adjusted_salary := emp.salary * 1.10;
        ELSE
            v_adjusted_salary := emp.salary + 5000;
        END IF;

        IF v_adjusted_salary > 100000 THEN

            v_adjusted_salary := 100000;

            DBMS_OUTPUT.PUT_LINE(
                emp.first_name || ': salary capped at 100,000'
            );

        ELSE

            DBMS_OUTPUT.PUT_LINE(
                emp.first_name || ': ' ||
                emp.salary || ' -> ' ||
                v_adjusted_salary
            );

        END IF;

    END LOOP;

END;
/
