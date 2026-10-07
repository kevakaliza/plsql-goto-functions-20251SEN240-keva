\# PL/SQL GOTO Statements and Functions



\*\*Course:\*\* Database Development with PL/SQL (INSY 8311)

\*\*Student:\*\* \[Nyirishema Kaliza Keva] | \*\*ID:\*\* 20251SEN240

\*\*Assignment:\*\* Individual Assignment III



\## Overview

Part A: GOTO programs. Part B: stored functions. Part C: combined payroll validator.



\## How to Run

1\. Run `00\_setup/create\_tables.sql`

2\. Run the functions in `02\_functions/`

3\. Run the programs in `01\_goto/`

4\. Run the test files in `03\_tests/`

5\. Verify results against the screenshots in `screenshots/`



Use SQL\*Plus with `SET SERVEROUTPUT ON`.



\## Tools

Oracle Database (XE), SQL\*Plus, Git/GitHub



\## Assumptions

\- B1 to B4 take values (salary, hire date, department ID), not employee IDs.

\- B3 tax brackets: up to 30,000 at 5%; up to 60,000 at 10%; up to 100,000 at 15%; above that 20%.

\- B2 returns NULL for a missing or future hire date.

\- B4 returns 'Unknown' for a NULL or missing department.

\- C1 returns 'VALID' or 'INVALID: <reason>' (employee exists, salary above zero, hire date present and not in the future, department exists).



\## Notes (AI use)

I used an AI assistant for guidance on setting up SQL\*Plus and Git and for help

structuring the functions. I ran and tested all code myself and can explain it.

