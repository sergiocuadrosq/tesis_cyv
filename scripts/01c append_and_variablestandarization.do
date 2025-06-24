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

gen status_inf = .
replace status_inf=0 if ocupinf_t1==2 & ocupinf_t2==2
replace status_inf=1 if ocupinf_t1==2 & ocupinf_t2==1
replace status_inf=2 if ocupinf_t1==1 & ocupinf_t2==2
replace status_inf=3 if ocupinf_t1==1 & ocupinf_t2==1

label define status_inf_labels 1 "Cae en informalidad" 3 "Se mantiene informal" 0 "Se mantiene formal" 2 "Cambia a formal" 

label values status_inf status_inf_labels

keep if status_inf==0 | status_inf==1


* Guardar el dataset combinado
save "$final/panel_final_combined_data.dta", replace















