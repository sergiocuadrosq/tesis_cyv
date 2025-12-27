import delimited "C:\projects\tesis_cyv\data\final\2_trasversal\4_linea\df_predicted_lineavulnerabilidad_xgb.csv", clear


scalar p99 = r(p99)
replace ingtra_n = p99 if ingtra_n > p99


* Crear la variable de grupo de edad
gen grupo_edad = .

* Asignar grupos según la variable de edad
replace grupo_edad = 1 if edad >= 14 & edad <= 24
replace grupo_edad = 2 if edad >= 25 & edad <= 44
replace grupo_edad = 3 if edad >= 45 & edad <= 64
replace grupo_edad = 4 if edad >= 65

* Etiquetar los grupos para mayor claridad
label define grupo_edad_lbl 1 "14-24" 2 "25-44" 3 "45-64" 4 "65+"
label values grupo_edad grupo_edad_lbl


preserve
keep if ingtra_n<2013
keep if ocu500 == 1 & ingtra_n > 0 
keep if resi==1
keep if periodo==2019
table niveleduc [iw=fac500a]

restore



preserve
keep if ingtra_n>2013
keep if ocu500 == 1 & ingtra_n > 0 
keep if resi==1
keep if periodo==2019
table niveleduc [iw=fac500a]

restore







 
keep if y_proba > 0.17 & y_proba < 0.19

table periodo [iw=fac500a], stat(mean ingtra_n)


preserve

keep if y_proba > 0.16 & y_proba < 0.20
keep if ocu500 == 1 & ingtra_n > 0 
keep if resi==1
table periodo area[iw=fac500a], stat(mean ingtra_n)
restore

preserve

keep if y_proba > 0.17 & y_proba < 0.19
keep if ocu500 == 1 & ingtra_n > 0 
keep if resi==1
table periodo region [iw=fac500a], stat(mean ingtra_n)
restore

preserve

keep if y_proba > 0.17 & y_proba < 0.19
keep if ocu500 == 1 & ingtra_n > 0 
keep if resi==1
keep if dpto == 15 | dpto==7

table periodo [iw=fac500a], stat(mean ingtra_n)
restore