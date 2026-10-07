-- A1 Version B: Number Classifier

SET SERVEROUTPUT ON

DECLARE
    v_value NUMBER := -14;

BEGIN

    IF v_value = 0 THEN
        GOTO zero_result;
    ELSIF v_value < 0 THEN
        GOTO negative_result;
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_value || ' is POSITIVE');
    GOTO parity_check;

    <<negative_result>>
    DBMS_OUTPUT.PUT_LINE(v_value || ' is NEGATIVE');
    GOTO parity_check;

    <<zero_result>>
    DBMS_OUTPUT.PUT_LINE('The number is ZERO');
    GOTO completed;

    <<parity_check>>
    IF MOD(v_value, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_value || ' is EVEN');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_value || ' is ODD');
    END IF;

    <<completed>>
    DBMS_OUTPUT.PUT_LINE('Number classification finished.');

END;
/
