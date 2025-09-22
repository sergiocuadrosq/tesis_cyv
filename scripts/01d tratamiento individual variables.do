cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/final"
global logs "$main/docs/logs"
global final "$data/final"
set maxvar 10000

cd "$final"
 
use "panel_apilado.dta"


//////// Codificación de variable objetivo (y descarte de condiciones no necesarias)


gen status_inf = .
replace status_inf=0 if ocupinf_t1==2 & ocupinf_t2==2
replace status_inf=1 if ocupinf_t1==2 & ocupinf_t2==1
replace status_inf=2 if ocupinf_t1==1 & ocupinf_t2==2
replace status_inf=3 if ocupinf_t1==1 & ocupinf_t2==1

label define status_inf_labels 1 "Cae en informalidad" 3 "Se mantiene informal" 0 "Se mantiene formal" 2 "Cambia a formal" 

label values status_inf status_inf_labels

keep if status_inf==0 | status_inf==1

//////////////////// Renaming /////////////////////

rename conglome_t1 conglome
rename vivienda_t1 vivienda
rename hogar_t1 hogar
rename codperso_t1 codperso
rename p207_t1 sexo
rename p208a_t1 edad
rename p209_t1 estadocivil
rename p501_t1 tuvotrabajo
rename p507_t1 categoria_trabajador
rename p510_t1 trabajopara
rename p510a1_t1 registrosunat
rename p510b_t1 cuentassunat
rename p511a_t1 tipocontrato
rename p512a_t1 numpersonastrabajo
rename p514_t1 tuvootrotrabajo
rename p519_t1 normtrabaja
rename p520_t1 horas_normtrabaja
rename p521_t1 disponiblehorastrabajar
//rename p521a_t1 disponibletrabajar
rename p521c_t1 deseaotrotrabajo
// rename p528_t1 recibiopagoespecie
rename p558c_t1 antepasadosconsidera
rename p558d_t1 perteneceindig
rename p300a_t1 lenguamaterna
rename p301a_t1 niveleduc
// rename p302_t1 leerescribir
rename p306_t1 asiste_educ
// rename p307_t1 asiste_educ
rename p314a_t1 usointernet
rename p401f_t1 viviadistrito
rename p401_t1 padece_enfer
rename p4021_t1 sintoma_malestar
rename p4022_t1 enfermedad
rename p4023_t1 recaida
rename p4024_t1 accidente
rename p4025_t1 notuvoenf
rename p4191_t1 essalud
rename p4192_t1 seguroprivado
rename p4193_t1 eps
rename p4194_t1 seguroffaa
rename p4195_t1 sis
rename p101_t1 tipovivienda
rename p102_t1 materialparedes
rename p103_t1 materialpisos
rename p103a_t1 materialtechos
rename p104_t1 habitaciones
rename p104a_t1 habitacionesdormir
rename p105a_t1 vivienda_status
rename p106a_t1 viviendatitulo
// rename p107b1_t1 credito_vivienda
rename p110_t1 agua_procedencia
rename p110a1_t1 agua_potable
rename p111a_t1 conexionsshh
rename p112a_t1 electricidad
rename p1142_t1 celular
rename p1144_t1 internet
rename percepho_t1 personas_ingresos
rename mieperho_t1 personas_hogar
rename pobreza_t1 pobreza

////////////////////////////////////////////////////////
////////////////Tratamiento individual//////////////////
////////////////////////////////////////////////////////

//

gen tiempotrabajo = p513a1_t1 + (p513a2_t1/12) 
drop p513a1_t1 p513a2_t1

//

replace trabajopara = 99 if categoria_trabajador == 6 & trabajopara == .
replace trabajopara = 99 if p509_t1!=.
drop p509_t1

//

replace antepasadosconsidera = 7 if antepasadosconsidera == 9

//

drop if viviadistrito ==3

//

replace conexionsshh = 7 if conexionsshh == 9
replace conexionsshh = 7 if conexionsshh == 8

//

replace agua_potable = 99 if (agua_procedencia != 1 & agua_procedencia != 2 & agua_procedencia != 3)

//

replace agua_procedencia = 7 if agua_procedencia==8

//

egen alquiler = rowtotal(p105b_t1 p106_t1)
drop p105b_t1 p106_t1

//

replace numpersonastrabajo = 99 if trabajopara==1

// 	

replace registrosunat = 99 if (trabajopara==1 | trabajopara==2 |trabajopara==3 | categoria_trabajador==6)

//

replace cuentassunat = 99 if (trabajopara==1 | trabajopara==2 |trabajopara==3 | categoria_trabajador==6)

//

replace tipocontrato = 1 if trabajopara==1
replace tipocontrato = 99 if categoria_trabajador == 1
replace tipocontrato = 99 if categoria_trabajador ==2

//

replace lenguamaterna = 8 if lenguamaterna==9 

//

drop if niveleduc == 12

//

replace viviendatitulo = 99 if vivienda_status==1
replace viviendatitulo = 99 if vivienda_status==5
replace viviendatitulo = 99 if vivienda_status==6
replace viviendatitulo = 99 if vivienda_status==7

//

egen horastotales_sempasada = rowtotal(p513t_t1 p518_t1)
drop p513t_t1 p518_t1

replace horas_normtrabaja=horastotales_sempasada if horas_normtrabaja==.

//

replace deseaotrotrabajo = 99 if categoria_trabajador==5

///

egen ingtrabw = rowtotal(i524a1_t1 d529t_t1 i530a_t1 d536_t1 i538a1_t1 d540t_t1 i541a_t1 d543_t1 d544t_t1 i538a1_t1 d538a1_t1)
drop i524a1_t1 d529t_t1 i530a_t1 d536_t1 i538a1_t1 d540t_t1 i541a_t1 d543_t1 d544t_t1 i538a1_t1 d538a1_t1

save "final_dataset.dta",replace
export delimited using "final_dataset.csv", replace nolabel
