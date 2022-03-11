[![ELKHMISSI - RSDK](https://img.shields.io/static/v1?label=ELKHMISSI&message=RSDK&color=success&logo=github)](https://github.com/ELKHMISSI/RSDK "Go to GitHub repo")
[![License](https://img.shields.io/badge/License-MIT-success)](#license)

## License

Released under [MIT](/LICENSE) by [@ELKHMISSI](https://github.com/ELKHMISSI).

---
## Author

+ EL KHMISSI Mohamed <mohamed.el-khmissi01@etu.umontpellier.fr>

---

## RSDK

RSDK or R SuDoKu is an R package developed for the project of R programming in the master 1 SSD (Statistiques et sciences des donnés),faculty of science Montpellier.  
The package contains a shiny application that we can play sudoku on it .

---

### What is backtracking algorithm?

<https://en.wikipedia.org/wiki/Backtracking>

---

### Install RSDK

The installation of the package is directly from `github`, so:

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





