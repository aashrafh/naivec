# Naïve C

A simple C/C++ compiler implemented in LEX (Flex) and YACC (Bison)

# Prerequisites

- GNU `flex` and `bison`
- GNU `gcc` compiler

# How to run

- To compile the lexer and parser run the script `run.sh` to generate the `.c` and `compiler.exe` files
- To pass the text file `input.txt` to the `.exe` file run `compiler.exe  input`
- Print statements is outputed in the console after running the `.exe` file for debugging
- If an error occurred it will print syntax error and exit the file

# Notes 

- `if` statements must include semicolon at the end of it if there is no `else` statement
- `break` and `continue` can be only used inside loop statements (for, while, switch, do-while)
- Non-void functions must have a return
- There are 4 testcases:

        - All the cases that pass with no errors; run `compiler.exe  noErrors`
        - Variables errors; run `compiler.exe variablesErrors`
        - Loops errors; run `compiler.exe  functionErrors`
        - Conditions errors; run `compiler.exe  conditionError`
        - Each input file will generate an output file containing whether the compilation errors or the quadruples and the symbol table of the code if it is compiled successfully the file will be called  **_`:fileName:Output.txt`_**

## Quadruples definitions
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






        


        
