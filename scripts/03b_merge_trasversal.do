cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
global trasversal "$processed/2_trasversal"

set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    Final Merge     ////////////////////////////
///////////////////////////////////////////////////////////////////////

//////////////////////////    2011   //////////////////////////////////
clear
cd "$trasversal/2011/"

use "2011_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2011_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2011_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2011_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2011_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2011.dta", replace

//////////////////////////    2012   //////////////////////////////////
clear
cd "$trasversal/2012/"

use "2012_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2012_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2012_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2012_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2012_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2012.dta", replace

//////////////////////////    2013   //////////////////////////////////
clear
cd "$trasversal/2013/"

use "2013_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2013_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2013_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2013_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2013_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2013.dta", replace

//////////////////////////    2014   //////////////////////////////////
clear
cd "$trasversal/2014/"

use "2014_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2014_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2014_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2014_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2014_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2014.dta", replace

//////////////////////////    2015   //////////////////////////////////
clear
cd "$trasversal/2015/"

use "2015_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2015_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2015_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2015_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2015_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2015.dta", replace

//////////////////////////    2016   //////////////////////////////////
clear
cd "$trasversal/2016/"

use "2016_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2016_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2016_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2016_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2016_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2016.dta", replace

//////////////////////////    2017   //////////////////////////////////
clear
cd "$trasversal/2017/"

use "2017_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2017_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2017_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2017_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2017_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2017.dta", replace


//////////////////////////    2018   //////////////////////////////////
clear
cd "$trasversal/2018/"

use "2018_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2018_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2018_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2018_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2018_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2018.dta", replace


//////////////////////////    2019   //////////////////////////////////
clear
cd "$trasversal/2019/"

use "2019_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2019_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2019_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2019_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2019_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2019.dta", replace

//////////////////////////    2020   //////////////////////////////////
clear
cd "$trasversal/2020/"

use "2020_500.dta"

order conglome vivienda hogar codperso

merge 1:1 conglome vivienda hogar codperso using "2020_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome vivienda hogar codperso using "2020_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2020_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome vivienda hogar using "2020_sumaria.dta"
keep if _merge==3
drop _merge

save "$trasversal/2020.dta", replace
