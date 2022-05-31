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
- We have written 4 input files 
- 1 for all the cases that pass with no errors run **_compiler.exe  noErrors_** 
- the other 3 files contain 3 types of errors one for variables one for functions and one for the loops and conditions
- to run each use **_compiler.exe  conditionError_** and **_compiler.exe  functionErrors_** and  **_compiler.exe variablesErrors_**
- each input file will generate an output file containing whether the compilation errors or the quadruples and the symbol table of the code if it is compiled successfully the file will be called  :fileName:Output.txt


## quadruples definitions
quadruple | definition
--- | ---
push  x   | pushes the variable x into the stack
pop x | pops from the stack to the variable x   
add x | add the top 2 variables in the stack and write the result in x
sub x | subtract the top 2 variables in the stack and write the result in x
mul x | multiply the top 2 variables in the stack and write the result in x
div x | divide the top 2 variables in the stack and write the result in x
not x | takes the top value in the stack and gets its invert and writes it in x
and x | perform and operation to the top 2 variables in the stack and write the result in x
or x | perform or operation to the top 2 variables in the stack and write the result in x
compLT x | perform compare less than "<" operation to the top 2 variables in the stack and write the result in x
compGT x | perform compare greater thant ">" operation to the top 2 variables in the stack and write the result in x
compGE x | perform compare greater than or equal ">=" operation to the top 2 variables in the stack and write the result in x
compLE x | perform less than or equal "<=" operation to the top 2 variables in the stack and write the result in x
compNE x | perform not equal "!=" operation to the top 2 variables in the stack and write the result in x
compEQ x | perform equal "==" operation to the top 2 variables in the stack and write the result in x
L000: |  a label to this line
jmp L000 | jump to the label L000
jz L000 | jump to the label L000 if the top of the stack is 0






        


        