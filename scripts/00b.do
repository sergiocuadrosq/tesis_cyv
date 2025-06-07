cls
clear
global main "C:\projects\tesis_cyv"
global dos "$main/scripts"
global data "$main/data"
global outputs "$main/outputs"
global processed "$data/processed"
global raw "$data/raw"
set maxvar 10000
cd "$raw"

//////////// 2019-2020//////////////

//-----------Módulo 500-----------//

use "enaho01a-2019-2023-500-panel.dta"

// Conservo a los que están en los dos primeros años al menos

keep if perpanel_19_20==1

// Generando variable de transición (0=Se mantiene formal, 1=Cae en informalidad, 2=Se mantiene informal, 3=Cambia a formal)
gen status_inf = .
replace status_inf=0 if ocupinf_19==2 & ocupinf_20==2
replace status_inf=1 if ocupinf_19==2 & ocupinf_20==1
replace status_inf=2 if ocupinf_19==1 & ocupinf_20==1
replace status_inf=3 if ocupinf_19==1 & ocupinf_20==2

label define status_inf_labels 0 "Se mantiene formal" 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Cambia a formal"
label values status_inf status_inf_labels

order status_inf ocupinf_19 ocupinf_20 perpanel_19_20

// Elimino a los que no logro caracterizar su transición

keep if !missing(status_inf)

// Conservo sólo a los que eran formales en el primer período

keep if status_inf == 0 | status_inf == 1

tab status_inf

// Selecciono las variables que creo relevantes (luego puedo añadir más)

