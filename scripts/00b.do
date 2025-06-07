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

unicode encoding set "latin1"

unicode translate "enaho01a-2019-2023-500-panel.dta"
use "enaho01a-2019-2023-500-panel.dta"

* Eliminar variables que terminan en 21, 22 o 23

gen status_inf = .
replace status_inf=1 if ocupinf_19==2 & ocupinf_20==1
replace status_inf=2 if ocupinf_19==1 & ocupinf_20==1
replace status_inf=3 if ocupinf_19==2 & ocupinf_20==2
replace status_inf=4 if ocupinf_19==1 & ocupinf_20==2

gen panel = "2019-2020"

label define status_inf_labels 1 "Cae en informalidad" 2 "Se mantiene informal" 3 "Se mantiene formal" 4 "Cambia a formal" 
order status_inf ocupinf_19 ocupinf_20
label values status_inf status_inf_labels
keep if perpanel_19_20==1


keep status_inf numper numpanh_19 numpanh_20 conglome vivienda nconglome_19 conglome_19 vivienda_19 hogar_19 codperso_19 p201p_19 p207_19 p209_19 p212_19 p213_19 p214_19 p210_19 p211a_19 p211d_19 p501_19 p502_19 p503_19 p5041_19 p5042_19 p5043_19 p5044_19 p5045_19 p5046_19 p5047_19 p5048_19 p5049_19 p50410_19 p50411_19 p505_19 p505b_19 p506_19 p506r4_19 p507_19 p508_19 p509_19 p510_19 p510a1_19 p5111_19 p5112_19 p5113_19 p5114_19 p5115_19 p5116_19 p5117_19 p5118_19 p51110_19 p5119_19 p51111_19 p51112_19 p511a_19 p513a1_19 p514_19 p520_19 p521b_19 p521c_19 p521d_19 p523_19 p524a1_19 p524a2_19 p528_19 p530a_19 p530b_19 p536_19 p541a_19 p541b_19 p546_19 p555_19 p558a1_19 p558a2_19 p558a3_19 p558a4_19 p558a5_19 p558c_19 p558d_19 p558e1_19 p558e2_19 p558e3_19 p558e4_19 p558e5_19 p558e6_19 ocu500_19 ocupinf_19 emplpsec_19 ocupinf_20


save "$processed/2019-2020_500.dta", replace

