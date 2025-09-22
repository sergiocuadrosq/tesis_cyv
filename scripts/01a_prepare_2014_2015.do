cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    2014-2015     //////////////////////////////
///////////////////////////////////////////////////////////////////////

cd "$raw/2014-2018"

//------------ Módulo 100 ------------//

clear
use "enaho01-2014-2018-100-panel.dta"

keep if hpan1415 == 1

keep conglome_14 vivienda_14 hogar_14 p101_14 p102_14 p103_14 p103a_14 p104_14 p104a_14 ///
     p105a_14 p105b_14 p106_14 p106a_14  p110_14 p110a1_14 p111a_14 p112a_14 ///
     p1144_14 p1142_14
	 
	 //p107b1_14
	 

save "$processed/2014-2015/2014-2015_100.dta", replace

//------------ Módulo 300 ------------//

clear
use "enaho01a-2014-2018-300-panel.dta"

keep if perpanel1415 == 1
drop if codperso_14 == ""

keep conglome_14 vivienda_14 hogar_14 codperso_14 p300a_14 p301a_14 p306_14 ///
      p314a_14
	 
	 // p313_14 p302_14

save "$processed/2014-2015/2014-2015_300.dta", replace

//------------ Módulo 400 ------------//

clear
use "enaho01a-2014-2018-400-panel.dta"

keep if perpanel1415 == 1
drop if codperso_14 == ""

keep conglome_14 vivienda_14 hogar_14 codperso_14 p401f_14 p401_14 p4021_14 p4022_14 ///
     p4023_14 p4024_14 p4025_14 p4191_14 p4192_14 p4193_14 p4194_14 p4195_14 ///
     
	 
	 /// p4196_14 p4197_14 p4198_14

save "$processed/2014-2015/2014-2015_400.dta", replace

//------------ Módulo 500 ------------//

clear
use "enaho01a-2014-2018-500-panel.dta"

keep if perpanel1415 == 1
drop if codperso_14 == ""

keep ocupinf_14 ocupinf_15 conglome_14 vivienda_14 hogar_14 codperso_14 p207_14 p208a_14 ///
     p209_14 p501_14 p507_14 p509_14 p510_14 p510a1_14 p510b_14 p511a_14 p512a_14 p513t_14 ///
     p513a1_14 p513a2_14 p514_14 p518_14 p519_14 p520_14 p521_14 p521c_14 ///
	 p558c_14 p558d_14 ///
	 i524a1_14 d529t_14 i530a_14 d536_14 i538a1_14 d540t_14 i541a_14 d543_14 d544t_14 i538a1_14 d538a1_14
	 
// p524a1_14 p524a2_14 p530a_14 p530b_14 p535_14 p528_14

save "$processed/2014-2015/2014-2015_500.dta", replace

//------------ Módulo Sumaria ------------//

clear
use "sumaria-2014-2018-panel.dta"

keep if hpan1415 == 1

keep conglome_14 vivienda_14 hogar_14 mieperho_14 percepho_14 pobreza_14
	 
// ingbruhd_14 ingindhd_14 ///insedthd_14 ingseihd_14 ingtexhd_14 ingexthd_14 ingtrahd_14 ingrenhd_14 ingmo1hd_14 /// inghog1d_14 gashog1d_14 estrsocial_14 linea_14

save "$processed/2014-2015/2014-2015_sumaria.dta", replace

//------------ Merge Final ------------//

clear
cd "$processed/2014-2015/"

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


save "$processed/2014-2015.dta", replace
