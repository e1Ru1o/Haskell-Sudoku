# Haskell-Sudoku

This project is an implementation of a sudoku solver using **Haskell** programming languaje. For specific details about the code see `doc/Details.pdf`

## Starting
To use the project, clone it or download it to your local computer.


### Requirements 📋
It is necessary to have a **Haskel**'s compiler. This proyect was developed using `ghc 8.0.2`.
If you don't have any compiler simply type the below command on a terminal to intall all that you need 

```
make install
```

### Installation 🔧

To execute the project, just open the console from the root location of the project and execute:

```
make
```
That command assume that your **Haskell** installation count with the `runhaskell` program, if it is not the case you could change the `make main` rule or execute the program manually.

The default file used for load the initial sudoku is `sudoku.txt`, you could use another file by typing:

```
make file="your/sudoku/path"
```

### Example:
If you want to solve the next sudoku:

![Solved Sudoku example](./images/example.png "Solved Sudoku example")

This sudoku is written in the default sodoku file, and after run the aplication produce the next output

![Program Output](./images/output.png "Program Output")


## Authors ✒️

* **Lazaro Raul Iglesias Vera** -- [e1Ru1o](https://github.com/e1Ru1o)

## License 📄

This project is under the License (MIT License) - see the file [LICENSE.md](LICENSE.md) for details.

