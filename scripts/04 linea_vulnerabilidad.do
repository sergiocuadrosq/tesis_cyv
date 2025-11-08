import delimited "C:\projects\tesis_cyv\data\final\2_trasversal\4_linea\df_predicted_lineavulnerabilidad.csv", clear
gen ingtra_n=ingtrabw/12


table periodo [iw=fac500a], stat(mean ingtra_n)

keep if target ==1
table periodo [iw=fac500a], stat(mean ingtra_n)

import delimited "C:\projects\tesis_cyv\data\final\2_trasversal\4_linea\df_predicted_lineavulnerabilidad.csv", clear
gen ingtra_n=ingtrabw/12
keep if target ==0
table periodo [iw=fac500a], stat(mean ingtra_n)
