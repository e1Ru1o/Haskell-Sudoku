# Code details
The `code` folder contains some modules used by the `Main.hs` script.

* SudtokuTypes:
  
    As the name of the module suggest it contains all the types used to manage
    the sudoku game. Also contains some easy methods to work with them. The types are:

    1. Cell: Container to store the cells row, column and value
    2. Table: Is a Cells list
    3. Sudoku: That contains to Tables, the first for empty Cells and second for non-empty ones

* SudokuIO:
  
    Contains a suduko reader and a formater.
    The reader `loadSudoku` load a sudoku from a file.
    The formater `formatSudoku` return a String that represent the sudoku

    The file `sudoku.txt` is an example of input with the expected format of suduko by the reader funtion.
    Also the string returned by the formater has the same format. Every `0` represent an empty cell.
    You are free to write your sudokus  in your prefered form, but is required that the file has only 9 lines and 9 digits on each one.

* Game:
  
    This is the most important module of the proyect. It contains the pipeline followed to solve the sudoku. Also has a `check` method to verify is the given sudoku is valid.

    The first step of the followed strategy  is find for each empty cell all the values that are possible to store inside it. Next the cell that has the minimum number of options will be filled. The selected cell could have more than one option, thats implie a doubt about what of them is the correct, then simply by iterating this values trying to solve recursively the resultant sudoku of set the value to the cell, the solution will be finded. It is a fact that every valid sudoku have one or more solution, then this aproach will stop at a valid state.  

* Main:
  
    This is the final pice of the project that load and solve the sudoku