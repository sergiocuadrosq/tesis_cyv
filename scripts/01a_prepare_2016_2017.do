cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

///////////////////////////////////////////////////////////////////////
///////////////////////    2016-2017     //////////////////////////////
///////////////////////////////////////////////////////////////////////

cd "$raw/2016-2020"

//------------ Módulo 100 ------------//

clear
use "enaho01-2016-2020-100-panel.dta"

keep if hpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 p101_16 p102_16 p103_16 p103a_16 p104_16 p104a_16 ///
     p105a_16 p105b_16 p106_16 p106a_16  p110_16 p110a1_16 p111a_16 p112a_16 ///
     p113a_16 p1144_16 p1142_16
	 
	 // p107b1_16

save "$processed/2016-2017/2016-2017_100.dta", replace

//------------ Módulo 300 ------------//

clear
use "enaho01a-2016-2020-300-panel.dta"

keep if perpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 codperso_16 p300a_16 p301a_16 p306_16 ///
      p314a_16
	 
	 // p313_16 p302_16

save "$processed/2016-2017/2016-2017_300.dta", replace

//------------ Módulo 400 ------------//

clear
use "enaho01a-2016-2020-400-panel.dta"

keep if perpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 codperso_16 ///
     p401f_16 p401_16 p4021_16 p4022_16 p4023_16 p4024_16 p4025_16 ///
     p4191_16 p4192_16 p4193_16 p4194_16 p4195_16 ///
     p4031_16 p4032_16 p4033_16 p4034_16 p4035_16 p4036_16 p4037_16 p4038_16 p4039_16 ///
     p40310_16 p40311_16 p40313_16 p40314_16 ///
     p4091_16 p4092_16 p4093_16 p4094_16 p4095_16 p4096_16 p4097_16 p4098_16 p4099_16 ///
     p40910_16 p40911_16	 
	 ///     p4196_16 p4197_16 p4198_16

save "$processed/2016-2017/2016-2017_400.dta", replace

//------------ Módulo 500 ------------//

clear
use "enaho01a-2016-2020-500-panel01.dta"

merge 1:1 conglome vivienda numper using "enaho01a-2016-2020-500-panel02.dta"

keep if _merge==3
drop _merge

keep if perpanel1617 == 1

keep ocupinf_16 ocupinf_17 conglome_16 vivienda_16 hogar_16 dominio_16 codperso_16 p207_16 p208a_16 ///
     p209_16 p501_16 p505_16 p507_16 p509_16 p510_16 p510a1_16 p510b_16 p511a_16 p512a_16 p513t_16 ///
     p513a1_16 p513a2_16 p514_16 p518_16 p519_16 p520_16 p521_16 p521c_16  ///
        p558c_16 p558d_16 p558e1_16 p558e2_16 p558e3_16 p558e4_16 p558e5_16 p558e6_16 i524a1_16 d529t_16 i530a_16 d536_16 i538a1_16 d540t_16 i541a_16 d543_16 d544t_16 i538a1_16 d538a1_16 
	 
	 /// p524a1_16 p524a2_16 p530a_16 p530b_16 p535_16 p528_16
	 ///dominio_16 p505_16

save "$processed/2016-2017/2016-2017_500.dta", replace

//------------ Módulo Sumaria ------------//

clear
use "sumaria-2016-2020-panelf.dta"

keep if hpanel1617 == 1

keep conglome_16 vivienda_16 hogar_16 mieperho_16 percepho_16 pobreza_16

// ingbruhd_16 ingindhd_16 /// insedthd_16 ingseihd_16 ingtexhd_16 ingexthd_16 ingtrahd_16 ingrenhd_16 ingmo1hd_16 /// inghog1d_16 gashog1d_16 estrsocial_16 linea_16

save "$processed/2016-2017/2016-2017_sumaria.dta", replace

//------------ Merge Final ------------//

clear
cd "$processed/2016-2017/"

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

save "$processed/2016-2017.dta", replace















