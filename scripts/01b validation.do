cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

cd "$processed"

use "2014-2015.dta"

describe



clear
use "2015-2016.dta"


clear all

local archivos "2014-2015.dta 2015-2016.dta 2016-2017.dta 2017-2018.dta 2018-2019.dta 2019-2020.dta"


foreach archivo of local archivos {
    display "------ Archivo: `archivo' ------"
    use "`archivo'", clear
	ds
    display "Número de variables: " c(k)
}
