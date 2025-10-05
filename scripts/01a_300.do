cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo 300     /////////////////////////////
///////////////////////////////////////////////////////////////////////

////////////////////////// 2011-2015///////////////////////////////////

cd "$raw/2011-2015"
clear
use "enaho01a-2011-2015-300.dta"

keep if perpanel1112 == 1
drop if codperso_11 == ""

keep conglome_11 vivienda_11 hogar_11 codperso_11 p300a_11 p301a_11 p306_11 ///
      p314a_11
	 
	 // p313_11 p302_11

save "$processed/2011-2012/2011-2012_300.dta", replace

////////////////////////// 2012-2016///////////////////////////////////

cd "$raw/2012-2016"
clear
use "enaho01a_2012_2016_300_panel.dta"

keep if perpanel1213 == 1
drop if codperso_12 == ""

keep conglome_12 vivienda_12 hogar_12 codperso_12 p300a_12 p301a_12 p306_12 ///
      p314a_12
	 
	 // p313_12 p302_12

save "$processed/2012-2013/2012-2013_300.dta", replace

////////////////////////// 2014-2015///////////////////////////////////

cd "$raw/2014-2018"
clear
use "enaho01a-2014-2018-300-panel.dta"

keep if perpanel1415 == 1
drop if codperso_14 == ""

keep conglome_14 vivienda_14 hogar_14 codperso_14 p300a_14 p301a_14 p306_14 ///
      p314a_14
	 
	 // p313_14 p302_14

save "$processed/2014-2015/2014-2015_300.dta", replace

////////////////////////// 2015-2016 ///////////////////////////////////

cd "$raw/2015-2019"

clear
use "enaho01a-2015-2019-300-panel.dta"

keep if perpanel_1516 == 1
drop if codperso_15==""

keep conglome_15 vivienda_15 hogar_15 codperso_15 p300a_15 p301a_15 p306_15 ///
      p314a_15
	 
	 // p313_15 p302_15

save "$processed/2015-2016/2015-2016_300.dta", replace

////////////////////////// 2016-2017 ///////////////////////////////////

cd "$raw/2016-2020"
clear
use "enaho01a-2016-2020-300-panel.dta"

keep if perpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 codperso_16 p300a_16 p301a_16 p306_16 ///
      p314a_16
	 
	 // p313_16 p302_16

save "$processed/2016-2017/2016-2017_300.dta", replace

////////////////////////// 2017-2018 ///////////////////////////////////

cd "$raw/2017-2021"
clear
use "enaho01a-2017-2021-300-panel.dta"

keep if perpanel1718 == 1

keep conglome_17 vivienda_17 hogar_17 codperso_17 p300a_17 p301a_17 p306_17 ///
      p314a_17
	 
	 // p313_17 p302_17

save "$processed/2017-2018/2017-2018_300.dta", replace

////////////////////////// 2018-2019 ///////////////////////////////////

cd "$raw/2018-2022"

clear
use "enaho01a-2018-2022-300-panel.dta"

keep if perpanel1819==1

keep conglome_18 vivienda_18 hogar_18 codperso_18 p300a_18 p301a_18 p306_18  p314a_18

//  p313_18 p302_18

save "$processed/2018-2019/2018-2019_300.dta", replace

////////////////////////// 2019-2023 ///////////////////////////////////

cd "$raw/2019-2023"
clear
use "enaho01a-2019-2023-300-panel.dta"

keep if perpanel_19_20==1

keep conglome_19 vivienda_19 hogar_19 codperso_19 p300a_19 p301a_19 p306_19  p314a_19

/// p313_19 p302_19

save "$processed/2019-2020/2019-2020_300.dta", replace
