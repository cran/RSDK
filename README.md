[![ELKHMISSI - RSDK](https://img.shields.io/static/v1?label=ELKHMISSI&message=RSDK&color=success&logo=github)](https://github.com/ELKHMISSI/RSDK "Go to GitHub repo")
[![License](https://img.shields.io/badge/License-MIT-success)](#license)

---

## Author

+ EL KHMISSI Mohamed <mohamed.el-khmissi01@etu.umontpellier.fr>

---

## RSDK

RSDK or R SuDoKu is an R package developed for the project of R programming in the master 1 SSD (Statistiques et sciences des donnés),faculty of science Montpellier.  
The package contains a shiny application that we can play sudoku on it.

For a full documentation : <https://CRAN.R-project.org/package=RSDK>

---

### Install RSDK

You can install the package from the `CRAN` by runing directly in your console:

```
install.packages("RSDK")
```
Or use the installation of the package from `github`, so:

+ First, you need to install the `devtools` package. You can run in the console the following command
```
install.packages("devtools")
```
+ Load the `devtools` package:
```
library(devtools)
```
+ Then use:
```
install_github("ELKHMISSI/RSDK")
```
After installation of package, are you ready to play?

---

### launch R SuDoKu

For playing in the shiny application all you need it's to load the `RSDK` package, and call `runSudoku()` function, run the following in the console:

```
library(RSDK)
runSudoku()
```
---

### How to play in RSDK

After launching the application:

+ Press the start button to start the game


+ Select a level for the game 

+ Select an empty cell on the grid by clicking on it once, and put a number from 1 to 9 by the keyboard

+ To remove a value from an edited cell just double clicking on it

+ Check button to verify the grid after playing

+ Solution button gives you the grid competly solved.(don't use it 😈!)

+ If an edited cell turns red that mean that the value on it is on the wrong place (it's already on the row or on the column or on 
the box), and if it has been turns green it means that the value on it not in the row,column or the box

+ Enjoy!

---

### How difficulties levels are defined in the game ?

#### What is backtracking algorithm?

<https://en.wikipedia.org/wiki/Backtracking>

The function `bt_solver()` in the package use the algorithm of backtracking to solve the incomplete sudoku grid, and it returns a list of two element the first one contains the solved grid, and the second one contains the number of the backtracking, that the function did to solve the grid.
So the difficulty of each grid is associated to the number of backtracking that the function `bt_solver` did on the resolution of the grid.
For optimization issues we've we have choose the median of an array of the number of backtracking for 100 incomplete grids of the number of gaps, for example we've choose 45 gaps for the "Easy" level,48 gaps for the "Difficult" level, 51 gaps for the "Hard" level and "54" gaps for the "Legend" level.
And the difficulties are as follow:

+ "Easy" level:`#Backtracking` < 75

+ "Difficult" level: 76 <`#Backtracking` < 260

+ "Hard" level: 261 <`#Backtracking` < 600

+ "Legend" level: 600 <`#Backtracking`

---

### License

Released under [MIT](/LICENSE) by [@ELKHMISSI](https://github.com/ELKHMISSI).




