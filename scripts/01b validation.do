cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

cd "$processed"

clear
use "2015-2016.dta"


clear all

local archivos "2014-2015.dta 2015-2016.dta 2016-2017.dta 2017-2018.dta 2018-2019.dta 2019-2020.dta"

foreach var of varlist _all {
    local lbl : value label `var'
        label list `lbl'
    }

// Paso 1: crear lista única de etiquetas de valores usadas
tempname lblset
local lblset ""

foreach var of varlist _all {
    local lbl : value label `var'
    if "`lbl'" != "" & strpos("`lblset'", "`lbl'") == 0 {
        local lblset "`lblset' `lbl'"
    }
}

// Paso 2: mostrar contenido de cada etiqueta
foreach lbl of local lblset {
    display "Etiqueta: `lbl'"
    label list `lbl'
    display "------------------------------"
}

foreach var of varlist _all {
    local lbl : value label `var'
    if "`lbl'" != "" {
        display "Variable: `var'"
        label list `lbl'
        display "------------------------------"
    }
}



