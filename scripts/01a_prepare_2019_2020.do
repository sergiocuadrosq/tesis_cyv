cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000
cd "$raw"

///////////////////////////////////////////////////////////////////////
///////////////////////    2019-2020     //////////////////////////////
///////////////////////////////////////////////////////////////////////

cd "$raw/2019-2023"

//------------Modulo 100------------//

clear
use "enaho01-2019-2023-100-panel.dta"

keep if hpanel_19_20==1

keep conglome_19 vivienda_19 hogar_19 p101_19 p102_19 p103_19 p103a_19 p104_19 p104a_19 p105a_19 p105b_19 p106_19 p106a_19  p110_19 p110a1_19 p111a_19 p112a_19 p1144_19 p1142_19

// p107b1_19

save "$processed/2019-2020/2019-2020_100.dta", replace

//------------Módulo 300------------//

clear
use "enaho01a-2019-2023-300-panel.dta"

keep if perpanel_19_20==1

keep conglome_19 vivienda_19 hogar_19 codperso_19 p300a_19 p301a_19 p306_19  p314a_19

/// p313_19 p302_19

save "$processed/2019-2020/2019-2020_300.dta", replace

//------------Modulo 400------------//
clear
use "enaho01a-2019-2023-400-panel.dta"

keep if perpanel_19_20==1

keep conglome_19 vivienda_19 hogar_19 codperso_19 p401f_19 p401_19 p4021_19 p4022_19 p4023_19 p4024_19 p4025_19 p4191_19 p4192_19 p4193_19 p4194_19 p4195_19 

//// p4196_19 p4197_19 p4198_19

save "$processed/2019-2020/2019-2020_400.dta", replace

//------------Módulo 500------------//

clear
use "enaho01a-2019-2023-500-panel.dta"

keep if perpanel_19_20==1

keep ocupinf_19 ocupinf_20 conglome_19 vivienda_19 hogar_19 codperso_19 p207_19 p208a_19 p209_19 p501_19 p507_19 p509_19 p510_19 p510a1_19 p510b_19 p511a_19 p512a_19 p513t_19 p513a1_19 p513a2_19 p514_19 p518_19 p519_19 p520_19 p521_19 p521c_19 p558c_19 p558d_19 ///
i524a1_19 d529t_19 i530a_19 d536_19 i538a1_19 d540t_19 i541a_19 d543_19 d544t_19 i538a1_19 d538a1_19

/// p524a1_19 p524a2_19 p530a_19 p530b_19 p535_19 p528_19

save "$processed/2019-2020/2019-2020_500.dta", replace

//------------Modulo Sumaria------------//

clear
use "sumaria-2019-2023-panel.dta"

keep if hpanel_19_20==1

keep conglome_19 vivienda_19 hogar_19 mieperho_19 percepho_19 pobreza_19

// keep linea_19 estrsocial_19 ingbruhd_19 ingindhd_19 insedthd_19 ingseihd_19 ingtexhd_19 ingexthd_19 ingtrahd_19 ingrenhd_19 ingmo1hd_19 inghog1d_19 gashog1d_19 pobreza_19

save "$processed/2019-2020/2019-2020_sumaria.dta", replace

//----------- Merge --------------///

clear
cd "$processed/2019-2020/"

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

save "$processed/2019-2020.dta", replace


