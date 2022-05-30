# Team 7 members
Names | Sec | Bench number
--- | --- | --- 
Ahmed Ashraf | 1 | 2        
Ahmed Sherif | 1 | 3
Ahmed Magdy  | 1 | 5
Abdelrahman Ahmed Fadl | 1 | 32

---
# Running Notes
- to compile the lexer and parser run the script run.sh it will generate the .c and compiler.exe files
- to pass the text file to the .exe file run **_compiler.exe < input.txt_**
- print statements is outputed in the console after running the .exe file for debugging
- if an error occurred it will print syntax error and exit the file

---
# Compiler notes 
- we are trying to mock the c++ compiler
- in **if statements** it must include semicolon at the end of it if there is no **else statement**
- break and continue can be only used inside loop statements (for, while, switch, do-while)
- block structures are implemented 
- functions are implemented void function doesn't have a return and returned type functions must have a return
- inline and block comments are implemented 
- block comments cannot include * in it
---
# Phase 2
- We have written 4 input files 1 for all the cases that passes with no error run **_compiler.exe < generate.txt_** it will print in the end the symbol table and the quadruples and the scope of each variable and whether it is used or not 
- the other 3 files contain 3 types of errors one for variables one for functions and one for the loops and conditions
- to run each use **_compiler.exe < conditionError.txt_** and **_compiler.exe < functionErrors.txt_** and  **_compiler.exe < variablesErrors.txt_**



        


        