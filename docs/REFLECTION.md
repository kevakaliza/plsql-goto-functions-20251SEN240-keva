\# Reflection



\## What I learned about GOTO

GOTO sends the program directly to a labeled part of the code. In A2 I used

`GOTO continue\_loop` to skip employees with an invalid salary and move on to the

next one in the loop. It worked, but it also showed me why GOTO is usually

avoided: every jump makes the flow harder to follow, and a program with many

jumps quickly becomes confusing. Normal control structures like IF/ELSE and

loops are clearer and easier to maintain.



\## Why the GOTO in A3 is illegal

In A3, Oracle rejected my code with `PLS-00375: illegal GOTO statement`. The

reason is that PL/SQL lets you jump out of a block (such as an IF block or a

loop) to a label in an enclosing block, but it does not let you jump into a

block from outside. A label inside a block belongs to that block's scope, so

code outside it cannot reach it. I fixed it by moving the label outside the IF

block so the GOTO could reach it.



\## Rewriting without GOTO (A4)

In A4 I rewrote the A1 and A2 logic without GOTO by \[using nested IF/ELSE

logic / using CONTINUE]. The output was the same as before, which showed me that

GOTO is never required and that structured code can do the same job more

clearly.



\## What I learned about functions

In Part B I wrote functions that return a single value (annual salary, years of

service, tax, department name) and used them inside a SELECT statement. I

learned that a function used in SQL should only read data, and that handling bad

input matters: some of my functions return NULL or 'Unknown', and others raise an

error. In Part C I combined these functions in a payroll validator, which showed

me how functions can be reused inside other functions to keep code organized.



\## What was hard

The hardest part was understanding which jumps are allowed between blocks and

when GOTO can or cannot be used. Using functions in SQL was also confusing at

first, especially passing the right values and dealing with rows that had

invalid data, like the employee with a future hire date. Practicing with the

examples and testing different inputs helped me understand these ideas.

