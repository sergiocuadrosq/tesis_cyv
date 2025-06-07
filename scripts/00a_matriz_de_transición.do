cls
clear
global main "C:\projects\tesis_cyv"
global dos "$main/programs"
global data "$main/data"
global outputs "$main/outputs"
global processed "$data/processed"
set maxvar 10000
cd "$data"
//

unicode encoding set "latin1"


//Primer panel: 2019-2020//

unicode translate "enaho01a-2019-2023-500-panel.dta"
use "enaho01a-2019-2023-500-panel.dta"

gen status_inf = .
replace status_inf=1 if ocupinf_19==2 & ocupinf_20==1
replace status_inf=2 if ocupinf_19==1 & ocupinf_20==1
replace status_inf=3 if ocupinf_19==2 & ocupinf_20==2
replace status_inf=4 if ocupinf_19==1 & ocupinf_20==2

gen panel = "2019-2020"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 

label values status_inf status_inf_labels

keep if perpanel_19_20==1
order numpanh_19 numpanh_20 panel ocupinf_19 ocupinf_20 status_inf
keep numpanh_19 numpanh_20 panel ocupinf_19 ocupinf_20 status_inf
rename numpanh_19 numpanh_t1
rename numpanh_20 numpanh_t2
rename ocupinf_19 ocupinf_t1
rename ocupinf_20 ocupinf_t2

save "$processed/2019-2020.dta", replace

//Segundo panel: 2018-2019

clear
cls
unicode translate "enaho01a-2018-2022-500-panel.dta"
use "enaho01a-2018-2022-500-panel.dta"

gen status_inf = .
replace status_inf=1 if ocupinf_18==2 & ocupinf_19==1
replace status_inf=2 if ocupinf_18==1 & ocupinf_19==1
replace status_inf=3 if ocupinf_18==2 & ocupinf_19==2
replace status_inf=4 if ocupinf_18==1 & ocupinf_19==2

gen panel = "2018-2019"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 

label values status_inf status_inf_labels

keep if perpanel1819==1
order numpanh_18 numpanh_19 panel ocupinf_18 ocupinf_19 status_inf
keep numpanh_18 numpanh_19 panel ocupinf_18 ocupinf_19 status_inf
rename numpanh_18 numpanh_t1
rename numpanh_19 numpanh_t2
rename ocupinf_18 ocupinf_t1
rename ocupinf_19 ocupinf_t2

save "$processed/2018-2019.dta", replace


//Tercer panel: 2017-2018

clear
cls
unicode translate "enaho01a-2017-2021-500-panel.dta"
use "enaho01a-2017-2021-500-panel.dta"

gen status_inf = .
replace status_inf=1 if ocupinf_17==2 & ocupinf_18==1
replace status_inf=2 if ocupinf_17==1 & ocupinf_18==1
replace status_inf=3 if ocupinf_17==2 & ocupinf_18==2
replace status_inf=4 if ocupinf_17==1 & ocupinf_18==2

gen panel = "2017-2018"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 

label values status_inf status_inf_labels

keep if perpanel1718==1
order numpanh17 numpanh18 panel ocupinf_17 ocupinf_18 status_inf

keep numpanh17 numpanh18 panel ocupinf_17 ocupinf_18 status_inf
rename numpanh17 numpanh_t1
rename numpanh18 numpanh_t2
rename ocupinf_17 ocupinf_t1
rename ocupinf_18 ocupinf_t2

save "$processed/2017-2018.dta", replace


// Cuarto panel: 2016-2017

clear
cls
unicode translate "enaho01a-2016-2020-500-panel01.dta"
use "enaho01a-2016-2020-500-panel01.dta"

gen status_inf = .
replace status_inf=1 if ocupinf_16==2 & ocupinf_17==1
replace status_inf=2 if ocupinf_16==1 & ocupinf_17==1
replace status_inf=3 if ocupinf_16==2 & ocupinf_17==2
replace status_inf=4 if ocupinf_16==1 & ocupinf_17==2

gen panel = "2016-2017"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 

label values status_inf status_inf_labels

keep if perpanel1617==1
order numpanh16 numpanh17 panel ocupinf_16 ocupinf_17 status_inf

keep numpanh16 numpanh17 panel ocupinf_16 ocupinf_17 status_inf
rename numpanh16 numpanh_t1
rename numpanh17 numpanh_t2
rename ocupinf_16 ocupinf_t1
rename ocupinf_17 ocupinf_t2

save "$processed/2016-2017.dta", replace

// Quinto panel: 2015-2016

clear
cls
unicode translate "enaho01a-2015-2019-500-panel_01.dta"
use "enaho01a-2015-2019-500-panel_01.dta"

gen status_inf = .
replace status_inf=1 if ocupinf_15==2 & ocupinf_16==1
replace status_inf=2 if ocupinf_15==1 & ocupinf_16==1
replace status_inf=3 if ocupinf_15==2 & ocupinf_16==2
replace status_inf=4 if ocupinf_15==1 & ocupinf_16==2

gen panel = "2015-2016"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 

label values status_inf status_inf_labels

keep if perpanel_1516==1
order numpanh15 numpanh16 panel ocupinf_15 ocupinf_16 status_inf

keep numpanh15 numpanh16 panel ocupinf_15 ocupinf_16 status_inf
rename numpanh15 numpanh_t1
rename numpanh16 numpanh_t2
rename ocupinf_15 ocupinf_t1
rename ocupinf_16 ocupinf_t2

save "$processed/2015-2016.dta", replace


// Sexto panel: 2014-2015

clear
cls
unicode translate "enaho01a-2014-2018-500-panel.dta"
use "enaho01a-2014-2018-500-panel.dta"

gen status_inf = .
replace status_inf=1 if ocupinf_14==2 & ocupinf_15==1
replace status_inf=2 if ocupinf_14==1 & ocupinf_15==1
replace status_inf=3 if ocupinf_14==2 & ocupinf_15==2
replace status_inf=4 if ocupinf_14==1 & ocupinf_15==2

gen panel = "2014-2015"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 

label values status_inf status_inf_labels

keep if perpanel1415==1
order numpanh14 numpanh15 panel ocupinf_14 ocupinf_15 status_inf

keep numpanh14 numpanh15 panel ocupinf_14 ocupinf_15 status_inf
rename numpanh14 numpanh_t1
rename numpanh15 numpanh_t2
rename ocupinf_14 ocupinf_t1
rename ocupinf_15 ocupinf_t2

save "$processed/2014-2015.dta", replace


///////////////-------------------------------//////////////

cd "$processed"


use "$processed/2019-2020.dta"
append using "$processed/2018-2019.dta"
append using "$processed/2017-2018.dta"
append using "$processed/2016-2017.dta"
append using "$processed/2015-2016.dta"
append using "$processed/2014-2015.dta"


table panel status_inf

save "$processed/final.dta", replace
