cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global panel "$raw/1_panel"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo 100     /////////////////////////////
///////////////////////////////////////////////////////////////////////

////////////////////////// 2011-2015///////////////////////////////////

cd "$panel/2011-2015"

clear
use "enaho01-2011-2015-100.dta"
keep if hpan1112 == 1

keep conglome_11 vivienda_11 hogar_11 p101_11 p102_11 p103_11 p103a_11 p104_11 p104a_11 ///
     p105a_11 p105b_11 p106_11 p106a_11  p110_11 p111_11 p112a_11 p113a_11 ///
     p1144_11 p1142_11 
	 //p107b1_11 p110a1_11
	 
rename p111_11 p111a_11

save "$processed/1_panel/2011-2012/2011-2012_100.dta", replace

////////////////////////// 2012-2016///////////////////////////////////

cd "$panel/2012-2016"

clear
use "enaho01_2012_2016_100_panel.dta"
keep if hpan1213 == 1

keep conglome_12 vivienda_12 hogar_12 p101_12 p102_12 p103_12 p103a_12 p104_12 p104a_12 ///
     p105a_12 p105b_12 p106_12 p106a_12  p110_12  p111a_12 p112a_12 p113a_12 ///
     p1144_12 p1142_12 
	 //p107b1_12 p110a1_12

save "$processed/1_panel/2012-2013/2012-2013_100.dta", replace

////////////////////////// 2014-2015///////////////////////////////////

cd "$panel/2014-2018"

clear
use "enaho01-2014-2018-100-panel.dta"
keep if hpan1415 == 1

keep conglome_14 vivienda_14 hogar_14 p101_14 p102_14 p103_14 p103a_14 p104_14 p104a_14 ///
     p105a_14 p105b_14 p106_14 p106a_14  p110_14  p111a_14 p112a_14 p113a_14 ///
     p1144_14 p1142_14	 
	 //p107b1_14 p110a1_14

save "$processed/1_panel/2014-2015/2014-2015_100.dta", replace

////////////////////////// 2015-2016 ///////////////////////////////////

cd "$panel/2015-2019"
clear
use "enaho01-2015-2019-100-panel.dta"

keep if hpanel_1516 == 1

keep conglome_15 vivienda_15 hogar_15 p101_15 p102_15 p103_15 p103a_15 p104_15 p104a_15 ///
     p105a_15 p105b_15 p106_15 p106a_15  p110_15  p111a_15 p112a_15 ///
     p113a_15 p1144_15 p1142_15
	 
	 // p107b1_15 p110a1_15

save "$processed/1_panel/2015-2016/2015-2016_100.dta", replace

////////////////////////// 2016-2017 ///////////////////////////////////

cd "$panel/2016-2020"
clear
use "enaho01-2016-2020-100-panel.dta"
keep if hpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 p101_16 p102_16 p103_16 p103a_16 p104_16 p104a_16 ///
     p105a_16 p105b_16 p106_16 p106a_16  p110_16  p111a_16 p112a_16 ///
     p113a_16 p1144_16 p1142_16
	 
	 // p107b1_16 p110a1_16

save "$processed/1_panel/2016-2017/2016-2017_100.dta", replace

////////////////////////// 2017-2018 ///////////////////////////////////

cd "$panel/2017-2021"
clear
use "enaho01-2017-2021-100-panel.dta"

keep if hpanel_1718 == 1

keep conglome_17 vivienda_17 hogar_17 p101_17 p102_17 p103_17 p103a_17 p104_17 p104a_17 ///
     p105a_17 p105b_17 p106_17 p106a_17  p110_17  p111a_17 p112a_17 ///
     p113a_17 p1144_17 p1142_17
	 
	 // p107b1_17 p110a1_17

save "$processed/1_panel/2017-2018/2017-2018_100.dta", replace

////////////////////////// 2018-2019 ///////////////////////////////////

cd "$panel/2018-2022"
clear
use "enaho01-2018-2022-100-panel.dta"

keep if hpan1819==1

keep conglome_18 vivienda_18 hogar_18 p101_18 p102_18 p103_18 p103a_18 p104_18 p104a_18 p105a_18 p105b_18 p106_18 p106a_18  p110_18  p111a_18 p112a_18 p113a_18 p1144_18 p1142_18

/// p110a1_18

save "$processed/1_panel/2018-2019/2018-2019_100.dta", replace

////////////////////////// 2019-2023 ///////////////////////////////////

cd "$panel/2019-2023"
clear
use "enaho01-2019-2023-100-panel.dta"

keep if hpanel_19_20==1

keep conglome_19 vivienda_19 hogar_19 p101_19 p102_19 p103_19 p103a_19 p104_19 p104a_19 p105a_19 p105b_19 p106_19 p106a_19  p110_19  p111a_19 p112a_19  p113a_19 p1144_19 p1142_19

// p107b1_19 p110a1_19

save "$processed/1_panel/2019-2020/2019-2020_100.dta", replace





