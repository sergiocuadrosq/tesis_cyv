cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo Sumaria   ///////////////////////////
///////////////////////////////////////////////////////////////////////

////////////////////////// 2011-2012///////////////////////////////////
cd "$raw/2011-2015"
clear
use "sumaria-2011-2015.dta"

keep if hpan1112 == 1

keep conglome_11 vivienda_11 hogar_11 mieperho_11 percepho_11 pobreza_11

save "$processed/2011-2012/2011-2012_sumaria.dta", replace
	 
// ingbruhd_11 ingindhd_11 ///insedthd_11 ingseihd_11 ingtexhd_11 ingexthd_11 ingtrahd_11 ingrenhd_11 ingmo1hd_11 /// inghog1d_11 gashog1d_11 estrsocial_11 linea_11

////////////////////////// 2012-2013///////////////////////////////////
cd "$raw/2012-2016"
clear
use "sumaria_2012_2016_panel.dta"

keep if hpan1213 == 1

keep conglome_12 vivienda_12 hogar_12 mieperho_12 percepho_12 pobreza_12

save "$processed/2012-2013/2012-2013_sumaria.dta", replace
	 
// ingbruhd_12 ingindhd_12 ///insedthd_12 ingseihd_12 ingtexhd_12 ingexthd_12 ingtrahd_12 ingrenhd_12 ingmo1hd_12 /// inghog1d_12 gashog1d_12 estrsocial_12 linea_12

////////////////////////// 2014-2015///////////////////////////////////
cd "$raw/2014-2018"
clear
use "sumaria-2014-2018-panel.dta"

keep if hpan1415 == 1

keep conglome_14 vivienda_14 hogar_14 mieperho_14 percepho_14 pobreza_14

save "$processed/2014-2015/2014-2015_sumaria.dta", replace
	 
// ingbruhd_14 ingindhd_14 ///insedthd_14 ingseihd_14 ingtexhd_14 ingexthd_14 ingtrahd_14 ingrenhd_14 ingmo1hd_14 /// inghog1d_14 gashog1d_14 estrsocial_14 linea_14

////////////////////////// 2015-2016 ///////////////////////////////////

cd "$raw/2015-2019"
clear
use "sumaria-2015-2019-panel.dta"

keep if hpanel_1516 == 1

keep conglome_15 vivienda_15 hogar_15 mieperho_15 percepho_15  pobreza_15
// ingbruhd_15 ingindhd_15 /// insedthd_15 ingseihd_15 ingtexhd_15 ingexthd_15 ingtrahd_15 ingrenhd_15 ingmo1hd_15 /// inghog1d_15 gashog1d_15 estrsocial_15 linea_15
save "$processed/2015-2016/2015-2016_sumaria.dta", replace


////////////////////////// 2016-2017 ///////////////////////////////////

cd "$raw/2016-2020"

clear
use "sumaria-2016-2020-panelf.dta"

keep if hpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 mieperho_16 percepho_16 pobreza_16

// ingbruhd_16 ingindhd_16 /// insedthd_16 ingseihd_16 ingtexhd_16 ingexthd_16 ingtrahd_16 ingrenhd_16 ingmo1hd_16 /// inghog1d_16 gashog1d_16 estrsocial_16 linea_16

save "$processed/2016-2017/2016-2017_sumaria.dta", replace

////////////////////////// 2017-2018 ///////////////////////////////////

cd "$raw/2017-2021"

use "sumaria-2017-2021-panel.dta"

keep if hpanel_1718 == 1
keep conglome_17 vivienda_17 hogar_17 mieperho_17 percepho_17 pobreza_17
	 
	 //// estrsocial_17 linea_17 ingbruhd_17 ingindhd_17 /// insedthd_17 ingseihd_17 ingtexhd_17 ingexthd_17 ingtrahd_17 ingrenhd_17 ingmo1hd_17 /// inghog1d_17 gashog1d_17  

save "$processed/2017-2018/2017-2018_sumaria.dta", replace

////////////////////////// 2018-2019 ///////////////////////////////////

cd "$raw/2018-2022"
clear
use "sumaria-2018-2022-panel.dta"

keep if hpanel_18_19==1
keep conglome_18 vivienda_18 hogar_18 mieperho_18 percepho_18 pobreza_18

// keep linea_18 estrsocial_18 ingbruhd_18 ingindhd_18 insedthd_18 ingseihd_18 ingtexhd_18 ingexthd_18 ingtrahd_18 ingrenhd_18 ingmo1hd_18 inghog1d_18 gashog1d_18 pobreza_18

save "$processed/2018-2019/2018-2019_sumaria.dta", replace

////////////////////////// 2019-2023 ///////////////////////////////////

cd "$raw/2019-2023"
clear
use "sumaria-2019-2023-panel.dta"

keep if hpanel_19_20==1
keep conglome_19 vivienda_19 hogar_19 mieperho_19 percepho_19 pobreza_19

// keep linea_19 estrsocial_19 ingbruhd_19 ingindhd_19 insedthd_19 ingseihd_19 ingtexhd_19 ingexthd_19 ingtrahd_19 ingrenhd_19 ingmo1hd_19 inghog1d_19 gashog1d_19 pobreza_19

save "$processed/2019-2020/2019-2020_sumaria.dta", replace


