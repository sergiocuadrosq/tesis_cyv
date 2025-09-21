cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    2017-2018     //////////////////////////////
///////////////////////////////////////////////////////////////////////

cd "$raw/2017-2021"

//------------ Módulo 100 ------------//

clear
use "enaho01-2017-2021-100-panel.dta"

keep if hpanel_1718 == 1

keep conglome_17 vivienda_17 hogar_17 p101_17 p102_17 p103_17 p103a_17 p104_17 p104a_17 ///
     p105a_17 p105b_17 p106_17 p106a_17  p110_17 p110a1_17 p111a_17 p112a_17 ///
     p1144_17 p1142_17
	 
	 // p107b1_17

save "$processed/2017-2018/2017-2018_100.dta", replace


//------------ Módulo 300 ------------//

clear
use "enaho01a-2017-2021-300-panel.dta"

keep if perpanel1718 == 1

keep conglome_17 vivienda_17 hogar_17 codperso_17 p300a_17 p301a_17 p302_17 p307_17 ///
      p314a_17
	 
	 // p313_17

save "$processed/2017-2018/2017-2018_300.dta", replace

//------------ Módulo 400 ------------//

clear
use "enaho01a-2017-2021-400-panel.dta"

keep if perpanel1718 == 1

keep conglome_17 vivienda_17 hogar_17 codperso_17 p401f_17 p401_17 p4021_17 p4022_17 ///
     p4023_17 p4024_17 p4025_17 p4191_17 p4192_17 p4193_17 p4194_17 p4195_17 ///
     
	 
	 ///p4196_17 p4197_17 p4198_17
	 
save "$processed/2017-2018/2017-2018_400.dta", replace

//------------ Módulo 500 ------------//

clear
use "enaho01a-2017-2021-500-panel.dta"

keep if perpanel1718 == 1

keep ocupinf_17 ocupinf_18 conglome_17 vivienda_17 hogar_17 codperso_17 p207_17 p208a_17 ///
     p209_17 p501_17 p507_17 p510_17 p510a1_17 p510b_17 p511a_17 p512a_17 p513t_17 ///
     p513a1_17 p513a2_17 p514_17 p519_17 p520_17 p521a_17 p521c_17  ///
     p528_17 p558c_17 p558d_17
	 
	 /// p524a1_17 p524a2_17 p530a_17 p530b_17 p535_17

save "$processed/2017-2018/2017-2018_500.dta", replace

//------------ Módulo Sumaria ------------//

clear
use "sumaria-2017-2021-panel.dta"

keep if hpanel_1718 == 1

keep conglome_17 vivienda_17 hogar_17 mieperho_17 percepho_17 pobreza_17
	 
	 //// estrsocial_17 linea_17 ingbruhd_17 ingindhd_17 /// insedthd_17 ingseihd_17 ingtexhd_17 ingexthd_17 ingtrahd_17 ingrenhd_17 ingmo1hd_17 /// inghog1d_17 gashog1d_17  

save "$processed/2017-2018/2017-2018_sumaria.dta", replace


//------------ Merge Final ------------//

clear
cd "$processed/2017-2018/"

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

save "$processed/2017-2018.dta", replace




























