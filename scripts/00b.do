cls
clear
global main "C:\projects\tesis_cyv"
global dos "$main/scripts"
global data "$main/data"
global outputs "$main/outputs"
global processed "$data/processed"
global raw "$data/raw"
set maxvar 10000
cd "$raw"

//////////// 2019-2020//////////////

//-----------Módulo 500-----------//

use "enaho01a-2019-2023-500-panel.dta"

// Conservo a los que están en los dos primeros años al menos

keep if perpanel_19_20==1

// Generando variable de transición (0=Se mantiene formal, 1=Cae en informalidad, 2=Se mantiene informal, 3=Cambia a formal)
gen status_inf = .
replace status_inf=0 if ocupinf_19==2 & ocupinf_20==2
replace status_inf=1 if ocupinf_19==2 & ocupinf_20==1
replace status_inf=2 if ocupinf_19==1 & ocupinf_20==1
replace status_inf=3 if ocupinf_19==1 & ocupinf_20==2

label define status_inf_labels 0 "Se mantiene formal" 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Cambia a formal"
label values status_inf status_inf_labels

order status_inf ocupinf_19 ocupinf_20 perpanel_19_20

// Elimino a los que no logro caracterizar su transición

keep if !missing(status_inf)

// Conservo sólo a los que eran formales en el primer período

keep if status_inf == 0 | status_inf == 1

tab status_inf

// Selecciono las variables que creo relevantes (luego puedo añadir más)

keep status_inf conglome_19 vivienda_19 hogar_19 codperso_19 p207_19 p208a_19 p209_19 p501_19 p507_19 p510_19 p510a1_19 p510b_19 p511a_19 p512a_19 p513t_19 p513a1_19 p513a2_19 p514_19 p519_19 p520_19 p521a_19 p521c_19 p524a1_19 p524a2_19 p528_19 p530a_19 p530b_19 p535_19 p558c_19 p558d_19
// Nota: pregunta 511, pregunta 556, pregunta 557, 558,558e
rename (p207_19 p208a_19 p209_19 p501_19 p507_19 p510_19 p510a1_19 p510b_19 p511a_19 p512a_19 p513t_19 p513a1_19 p513a2_19 p514_19 p519_19 p520_19 p521a_19 p521c_19 p524a1_19 p524a2_19 p528_19 p530a_19 p530b_19 p535_19 p558c_19 p558d_19) (sexo edad estadocivil tuvotrabajo desempenocomo trabajopara registrosunat sistconta tipocontrato numperempresa horasocupprin tiempoocupprinanos tiempoocupprinmeses tuvotrabajosec trabajanormnumhoras horastrabajototalsemana pudomashoras deseaotrotrabajo ingresototalmonto ingresototalnosabe pagoespecie indepgananciatotal indepgananciatotalnosabe autoconsumo antepasados consideraindigena)


save "$processed/2019-2020_500.dta", replace

//-----------Módulo 300-----------//
use "enaho01a-2019-2023-300-panel.dta"

// Conservo a los que están en los dos primeros años al menos

keep if perpanel_19_20==1

// Selecciono las variables que creo relevantes (luego puedo añadir más)

keep conglome_19 vivienda_19 hogar_19 codperso_19 p300a_19 p301a_19 p302_19 p307_19 p313_19 p314a_19 p316b_19

rename (p300a_19 p301a_19 p302_19 p307_19 p313_19 p314a_19 p316b_19) (idiomaninez niveleducacion leerescribir asisteeducacionbasica razonnomatricula internet dispoelectronico)


save "$processed/2019-2020_300.dta", replace

//------------Modulo 400------------//
cd "$raw"
clear
use "enaho01a-2019-2023-400-panel.dta"

// Conservo a los que están en los dos primeros años al menos

keep if perpanel_19_20==1

// Selecciono las variables que creo relevantes (luego puedo añadir más)

keep conglome_19 vivienda_19 hogar_19 codperso_19 p401f_19 p401g1_19 p401_19 p4021_19 p4022_19 p4023_19 p4024_19 p4025_19 p4191_19 p4192_19 p4193_19 p4194_19 p4195_19 p4196_19 p4197_19 p4198_19

rename (p401f_19 p401g1_19 p401_19 p4021_19 p4022_19 p4023_19 p4024_19 p4025_19 p4191_19 p4192_19 p4193_19 p4194_19 p4195_19 p4196_19 p4197_19 p4198_19) (viviadistrito madreviviadistrito padeceenfermedadcronica presentomalestar presentoenfermedad presentorecaida presentoaccidente nopresentoenf essalud seguroprivado eps segurooffaapol sis segurouniv seguroescolarpriv otroseguro)

save "$processed/2019-2020_400.dta", replace

//----------- Merge --------------///


cd "$processed"
use "$processed/2019-2020_500.dta"
merge 1:1 conglome_19 vivienda_19 hogar_19 codperso_19 using "$processed/2019-2020_300.dta"

keep if _merge==3
drop _merge

merge 1:1 conglome_19 vivienda_19 hogar_19 codperso_19 using "$processed/2019-2020_400.dta"
keep if _merge==3
drop _merge

save "$processed/2019-2020.dta", replace
