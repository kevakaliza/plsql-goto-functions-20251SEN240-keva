-- A3 Version B: Illegal GOTO and Corrected Version

SET SERVEROUTPUT ON

-- PART 1: ILLEGAL GOTO

BEGIN

    GOTO hidden_label;

    IF TRUE THEN

        <<hidden_label>>
        DBMS_OUTPUT.PUT_LINE(
            'This statement is inside the IF block'
        );

    END IF;

END;
/

-- PART 2: LEGAL GOTO

DECLARE
    v_status BOOLEAN := TRUE;

BEGIN

    IF v_status THEN
        GOTO display_result;
    END IF;

    DBMS_OUTPUT.PUT_LINE('This message will not be displayed');

    <<display_result>>
    DBMS_OUTPUT.PUT_LINE(
        'GOTO works because the label is outside the IF block'
    );

END;
/
