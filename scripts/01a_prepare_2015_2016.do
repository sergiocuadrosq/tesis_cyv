cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    2015-2016     //////////////////////////////
///////////////////////////////////////////////////////////////////////

cd "$raw/2015-2019"

//------------ Módulo 100 ------------//

clear
use "enaho01-2015-2019-100-panel.dta"

keep if hpanel_1516 == 1

keep conglome_15 vivienda_15 hogar_15 p101_15 p102_15 p103_15 p103a_15 p104_15 p104a_15 ///
     p105a_15 p105b_15 p106_15 p106a_15  p110_15 p110a1_15 p111a_15 p112a_15 ///
     p1144_15 p1142_15
	 
	 // p107b1_15

save "$processed/2015-2016/2015-2016_100.dta", replace

//------------ Módulo 300 ------------//

clear
use "enaho01a-2015-2019-300-panel.dta"

keep if perpanel_1516 == 1

drop if codperso_15==""

keep conglome_15 vivienda_15 hogar_15 codperso_15 p300a_15 p301a_15 p306_15 ///
      p314a_15
	 
	 // p313_15 p302_15

save "$processed/2015-2016/2015-2016_300.dta", replace

//------------ Módulo 400 ------------//

clear
use "enaho01a-2015-2019-400-panel.dta"

keep if perpanel_1516 == 1

drop if codperso_15==""

keep conglome_15 vivienda_15 hogar_15 codperso_15 p401f_15 p401_15 p4021_15 p4022_15 ///
     p4023_15 p4024_15 p4025_15 p4191_15 p4192_15 p4193_15 p4194_15 p4195_15 ///
	 
	 // p4196_15 p4197_15 p4198_15

save "$processed/2015-2016/2015-2016_400.dta", replace

//------------ Módulo 500 ------------//

clear
use "enaho01a-2015-2019-500-panel_01.dta"

keep if perpanel_1516 == 1

drop if codperso_15==""

keep ocupinf_15 ocupinf_16 conglome_15 vivienda_15 hogar_15 codperso_15 p207_15 p208a_15 ///
     p209_15 p501_15 p507_15 p509_15 p510_15 p510a1_15 p510b_15 p511a_15 p512a_15 p513t_15 ///
     p513a1_15 p513a2_15 p514_15 p518_15 p519_15 p520_15 p521_15 p521c_15 ///
       p558c_15 p558d_15 ///
	   i524a1_15 d529t_15 i530a_15 d536_15 i538a1_15 d540t_15 i541a_15 d543_15 d544t_15 i538a1_15 d538a1_15
	 
	 /// p524a1_15 p524a2_15 p530a_15 p530b_15 p535_15 p528_15

save "$processed/2015-2016/2015-2016_500.dta", replace

//------------ Módulo Sumaria ------------//

clear
use "sumaria-2015-2019-panel.dta"

keep if hpanel_1516 == 1

keep conglome_15 vivienda_15 hogar_15 mieperho_15 percepho_15  pobreza_15


// ingbruhd_15 ingindhd_15 /// insedthd_15 ingseihd_15 ingtexhd_15 ingexthd_15 ingtrahd_15 ingrenhd_15 ingmo1hd_15 /// inghog1d_15 gashog1d_15 estrsocial_15 linea_15

save "$processed/2015-2016/2015-2016_sumaria.dta", replace

//------------ Merge Final ------------//

clear
cd "$processed/2015-2016/"

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

save "$processed/2015-2016.dta", replace