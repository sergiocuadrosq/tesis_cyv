cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
global panel "$processed/1_panel"

set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    Final Merge     /////////////////////////////
///////////////////////////////////////////////////////////////////////

////////////////////////// 2011-2012///////////////////////////////////
clear
cd "$panel/2011-2012/"

use "2011-2012_500.dta"

order conglome_11 vivienda_11 hogar_11 codperso_11

merge 1:1 conglome_11 vivienda_11 hogar_11 codperso_11 using "2011-2012_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_11 vivienda_11 hogar_11 codperso_11 using "2011-2012_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_11 vivienda_11 hogar_11 using "2011-2012_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_11 vivienda_11 hogar_11 using "2011-2012_sumaria.dta"
keep if _merge==3
drop _merge

save "$panel/2011-2012.dta", replace

////////////////////////// 2012-2013///////////////////////////////////
clear
cd "$panel/2012-2013/"

use "2012-2013_500.dta"

order conglome_12 vivienda_12 hogar_12 codperso_12

merge 1:1 conglome_12 vivienda_12 hogar_12 codperso_12 using "2012-2013_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_12 vivienda_12 hogar_12 codperso_12 using "2012-2013_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_12 vivienda_12 hogar_12 using "2012-2013_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_12 vivienda_12 hogar_12 using "2012-2013_sumaria.dta"
keep if _merge==3
drop _merge

save "$panel/2012-2013.dta", replace

////////////////////////// 2014-2015///////////////////////////////////
clear
cd "$panel/2014-2015/"

use "2014-2015_500.dta"

order conglome_14 vivienda_14 hogar_14 codperso_14

merge 1:1 conglome_14 vivienda_14 hogar_14 codperso_14 using "2014-2015_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_14 vivienda_14 hogar_14 codperso_14 using "2014-2015_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_14 vivienda_14 hogar_14 using "2014-2015_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_14 vivienda_14 hogar_14 using "2014-2015_sumaria.dta"
keep if _merge==3
drop _merge

save "$panel/2014-2015.dta", replace

////////////////////////// 2015-2016 ///////////////////////////////////
clear
cd "$panel/2015-2016/"

use "2015-2016_500.dta"

order conglome_15 vivienda_15 hogar_15 codperso_15

merge 1:1 conglome_15 vivienda_15 hogar_15 codperso_15 using "2015-2016_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_15 vivienda_15 hogar_15 codperso_15 using "2015-2016_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_15 vivienda_15 hogar_15 using "2015-2016_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_15 vivienda_15 hogar_15 using "2015-2016_sumaria.dta"
keep if _merge==3
drop _merge

save "$panel/2015-2016.dta", replace

////////////////////////// 2016-2017 ///////////////////////////////////
clear
cd "$panel/2016-2017/"

use "2016-2017_500.dta"

order conglome_16 vivienda_16 hogar_16 codperso_16

merge 1:1 conglome_16 vivienda_16 hogar_16 codperso_16 using "2016-2017_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_16 vivienda_16 hogar_16 codperso_16 using "2016-2017_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_16 vivienda_16 hogar_16 using "2016-2017_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_16 vivienda_16 hogar_16 using "2016-2017_sumaria.dta"
keep if _merge==3
drop _merge

save "$panel/2016-2017.dta", replace

////////////////////////// 2017-2018 ///////////////////////////////////
clear
cd "$panel/2017-2018/"

use "2017-2018_500.dta"

order conglome_17 vivienda_17 hogar_17 codperso_17

merge 1:1 conglome_17 vivienda_17 hogar_17 codperso_17 using "2017-2018_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_17 vivienda_17 hogar_17 codperso_17 using "2017-2018_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_17 vivienda_17 hogar_17 using "2017-2018_100.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_17 vivienda_17 hogar_17 using "2017-2018_sumaria.dta"
keep if _merge==3
drop _merge

save "$panel/2017-2018.dta", replace
////////////////////////// 2018-2019 ///////////////////////////////////

clear
cd "$panel/2018-2019/"

use "2018-2019_500.dta"

order conglome_18 vivienda_18 hogar_18 codperso_18

merge 1:1 conglome_18 vivienda_18 hogar_18 codperso_18 using "2018-2019_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_18 vivienda_18 hogar_18 codperso_18 using "2018-2019_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_18 vivienda_18 hogar_18 using 2018-2019_100.dta
keep if _merge==3
drop _merge

merge m:1 conglome_18 vivienda_18 hogar_18 using 2018-2019_sumaria.dta
keep if _merge==3
drop _merge

save "$panel/2018-2019.dta", replace

////////////////////////// 2019-2023 ///////////////////////////////////
clear
cd "$panel/2019-2020/"

use "2019-2020_500.dta"

order conglome_19 vivienda_19 hogar_19 codperso_19

merge 1:1 conglome_19 vivienda_19 hogar_19 codperso_19 using "2019-2020_300.dta"
keep if _merge==3
drop _merge

merge 1:1 conglome_19 vivienda_19 hogar_19 codperso_19 using "2019-2020_400.dta"
keep if _merge==3
drop _merge

merge m:1 conglome_19 vivienda_19 hogar_19 using 2019-2020_100.dta
keep if _merge==3
drop _merge

merge m:1 conglome_19 vivienda_19 hogar_19 using 2019-2020_sumaria.dta
keep if _merge==3
drop _merge

save "$panel/2019-2020.dta", replace
