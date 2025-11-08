cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
global trasversal "$processed/2_trasversal"
global logs "$main/docs/logs"
global final "$data/final"
set maxvar 10000

cd "$trasversal"

local archivos "2011.dta 2012.dta 2013.dta 2014.dta 2015.dta 2016.dta 2017.dta 2018.dta 2019.dta 2020.dta"


foreach x of local archivos {
	use "`x'",clear
	di "------------------------------------"
	di "Las variables en el archivo `x' son:"
	di "------------------------------------"
    ds
}


////////////// Final append ///////////////

local archivos "2011.dta 2012.dta 2013.dta 2014.dta 2015.dta 2016.dta 2017.dta 2018.dta 2019.dta 2020.dta"

* Crear dataset vacío temporal
clear
tempfile base
save `base', emptyok

* Iterar sobre los archivos
foreach x of local archivos {
    use "`x'", clear
    gen periodo = substr("`x'", 1, 4)   // extrae el año del nombre del archivo
    append using `base'
    save `base', replace
}

* Cargar dataset final combinado
use `base', clear

* Guardar el dataset combinado
save "$final/2_trasversal/trasversal_apilado.dta", replace

















