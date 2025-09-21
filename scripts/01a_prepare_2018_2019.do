cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000
cd "$raw"

///////////////////////////////////////////////////////////////////////
///////////////////////    2018-2019     //////////////////////////////
///////////////////////////////////////////////////////////////////////

cd "$raw/2018-2022"

//------------Modulo 100------------//

clear
use "enaho01-2018-2022-100-panel.dta"

keep if hpan1819==1

keep conglome_18 vivienda_18 hogar_18 p101_18 p102_18 p103_18 p103a_18 p104_18 p104a_18 p105a_18 p105b_18 p106_18 p106a_18  p110_18 p110a1_18 p111a_18 p112a_18 p1144_18 p1142_18

//p107b1_18

save "$processed/2018-2019/2018-2019_100.dta", replace

//------------Módulo 300------------//

clear
use "enaho01a-2018-2022-300-panel.dta"

keep if perpanel1819==1

keep conglome_18 vivienda_18 hogar_18 codperso_18 p300a_18 p301a_18 p302_18 p307_18  p314a_18

//  p313_18

save "$processed/2018-2019/2018-2019_300.dta", replace

//------------Modulo 400------------//
clear
use "enaho01a-2018-2022-400-panel.dta"

keep if perpanel1819==1

keep conglome_18 vivienda_18 hogar_18 codperso_18 p401f_18 p401_18 p4021_18 p4022_18 p4023_18 p4024_18 p4025_18 p4191_18 p4192_18 p4193_18 p4194_18 p4195_18

///  p4196_18 p4197_18 p4198_18

save "$processed/2018-2019/2018-2019_400.dta", replace

//------------Módulo 500------------//

clear
use "enaho01a-2018-2022-500-panel.dta"

keep if perpanel1819==1

keep ocupinf_18 ocupinf_19 conglome_18 vivienda_18 hogar_18 codperso_18 p207_18 p208a_18 p209_18 p501_18 p507_18 p510_18 p510a1_18 p510b_18 p511a_18 p512a_18 p513t_18 p513a1_18 p513a2_18 p514_18 p519_18 p520_18 p521a_18 p521c_18  p528_18 p558c_18 p558d_18

/// p524a1_18 p524a2_18 p530a_18 p530b_18 p535_18

save "$processed/2018-2019/2018-2019_500.dta", replace

//------------Modulo Sumaria------------//

clear
use "sumaria-2018-2022-panel.dta"

keep if hpanel_18_19==1

keep conglome_18 vivienda_18 hogar_18 mieperho_18 percepho_18 pobreza_18

// keep linea_18 estrsocial_18 ingbruhd_18 ingindhd_18 insedthd_18 ingseihd_18 ingtexhd_18 ingexthd_18 ingtrahd_18 ingrenhd_18 ingmo1hd_18 inghog1d_18 gashog1d_18 pobreza_18


save "$processed/2018-2019/2018-2019_sumaria.dta", replace


//----------- Merge --------------///

clear
cd "$processed/2018-2019/"

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

save "$processed/2018-2019.dta", replace



