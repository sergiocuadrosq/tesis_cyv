cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
global logs "$main/docs/logs"
set maxvar 10000



cd "$processed"
cls



local archivos "2014-2015.dta 2015-2016.dta 2016-2017.dta 2017-2018.dta 2018-2019.dta 2019-2020.dta"
foreach x of local archivos {
	capture log close
	log using "$logs/etiquetas_revision_`x'.log", text replace
	local etiquetas_usadas ""
	di as text "============================================"
    di as result "👉 Revisando etiquetas en: `x'"
    di as text "============================================"
	use "`x'",clear
	
	foreach var of varlist _all {
    local lbl : value label `var'
    if "`lbl'" != "" {
        di "Variable: `var' — Etiqueta: `lbl'"
        
        * Solo si no ha sido mostrada antes
        if strpos("`etiquetas_usadas'", "`lbl'") == 0 {
            label list `lbl'
            local etiquetas_usadas "`etiquetas_usadas' `lbl'"
        }
    }
    }
	log close
	cls
}

