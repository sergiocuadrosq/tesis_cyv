cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
global logs "$main/docs/logs"
global final "$data/final"
set maxvar 10000

cd "$processed"

local archivos "2014-2015.dta 2015-2016.dta 2016-2017.dta 2017-2018.dta 2018-2019.dta 2019-2020.dta"


foreach x of local archivos {
	use "`x'",clear
	gen periodo=substr("`x'", 1, length("`x'") - 4)
	foreach var of varlist * {
		if substr("`var'", -2, 2) == substr("`x'", 3, 2) {
        rename `var' `=substr("`var'", 1, length("`var'") - 3) + "_t1"'
		}
		else if substr("`var'", -2, 2) == string(real(substr("`x'",3, 2)) + 1) {
        rename `var' `=substr("`var'", 1, length("`var'") - 3) + "_t2"'
		}
	}
    local newname = substr("`x'", 1, length("`x'") - 4) + "_standard.dta"
    save "$final/`newname'", replace 
	
}


clear 

cd "$final"



local archivos "2014-2015_standard.dta 2015-2016_standard.dta 2016-2017_standard.dta 2017-2018_standard.dta 2018-2019_standard.dta 2019-2020_standard.dta"

foreach x of local archivos {
	use "`x'",clear
	di "------------------------------------"
	di "Las variables en el archivo `x' son:"
	di "------------------------------------"
    ds
}


////////////// Final append ///////////////

local archivos "2014-2015_standard.dta 2015-2016_standard.dta 2016-2017_standard.dta 2017-2018_standard.dta 2018-2019_standard.dta 2019-2020_standard.dta"

* Cargar el primer archivo para iniciar el dataset
use "`: word 1 of `archivos''", clear

* Iterar sobre los archivos restantes y hacer el append
foreach x of local archivos {
    if "`x'" != "`: word 1 of `archivos''" {  * Para evitar cargar el primer archivo nuevamente
        append using "`x'"
    }
}

* Guardar el dataset combinado
save "$final/panel_apilado.dta", replace

















