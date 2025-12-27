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
 
use "1_panel/panel_apilado.dta"


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
rename dominio_t1 dominio
rename conglome_t1 conglome
rename vivienda_t1 vivienda
rename hogar_t1 hogar
rename codperso_t1 codperso
rename p207_t1 sexo
rename p208a_t1 edad
rename p209_t1 estadocivil
rename p510a1_t1 registropersonajuridica
rename p510b_t1 cuentassunat
rename p511a_t1 tipocontrato
rename p5111_t1 pagosueldo
rename p5112_t1 pagosalario
rename p5113_t1 pagocomision
rename p5114_t1 pagodestajo
rename p5115_t1 pagosubvencion
rename p5116_t1 pagohonorarios
rename p5117_t1 pagoganancianegocio
rename p5118_t1 pagoagropecuario
rename p5119_t1 pagopropina
rename p51110_t1 pagoespecie
rename p51111_t1 pagootros
rename p51112_t1 pagonorecibe
rename p512a_t1 numpersonastrabajo
rename p514_t1 tuvootrotrabajo
rename p519_t1 normtrabaja
rename p520_t1 horas_normtrabaja
rename p521_t1 disponiblehorastrabajar
//rename p521a_t1 disponibletrabajar
// rename p521c_t1 deseaotrotrabajo (eliminada pq en paneles antiguos no aparece)
// rename p528_t1 recibiopagoespecie
// rename p558c_t1 antepasadosconsidera (no aparece paneles antiguos)
// rename p558d_t1 perteneceindig (no aparece paneles antiguos)
rename p300a_t1 lenguamaterna
rename p301a_t1 niveleduc
// rename p302_t1 leerescribir
rename p306_t1 asiste_educ
// rename p307_t1 asiste_educ
rename p314a_t1 usointernet
// rename p401f_t1 viviadistrito (eliminada no aparece paneles antiguos)
rename p401_t1 padece_enfer

rename p4191_t1 essalud
rename p4192_t1 seguroprivado
rename p4193_t1 eps
rename p4194_t1 seguroffaa
rename p4195_t1 sis
rename p4031_t1 puestosalud
rename p4032_t1 centrosalud
rename p4033_t1 centroopuesto
rename p4034_t1 posta
rename p4035_t1 hospital_minsa
rename p4036_t1 hospital_seguro
rename p4037_t1 hospital_ffaa
rename p4038_t1 consultorio 
rename p4039_t1 clinica
rename p40310_t1 farmacia
rename p40311_t1 domicilio
rename p40313_t1 otro
rename p40314_t1 no_busco
rename p4091_t1 no_dinero
rename p4092_t1 lejos
rename p4093_t1 demora_mucho
rename p4094_t1 noconfia
rename p4095_t1 nograve
rename p4096_t1 remedio_caseros
rename p4097_t1 no_seguro
rename p4098_t1 autoreceto
rename p4099_t1 notiempo
rename p40910_t1 maltrato
rename p40911_t1 otro_motivo
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
// rename p110a1_t1 agua_potable (eliminada no aparece paneles antiguos)
rename p111a_t1 conexionsshh
rename p112a_t1 electricidad
rename p113a_t1 combustible
rename p1142_t1 celular
rename p1144_t1 internet
rename percepho_t1 personas_ingresos
rename mieperho_t1 personas_hogar
rename pobreza_t1 pobreza

////////////////////////////////////////////////////////
////////////////Tratamiento individual//////////////////
////////////////////////////////////////////////////////

// ------ ¿Tuvo trabajo? -------

rename p501_t1 tuvotrabajo

// ------ Sector en el que trabaja --------

rename p505_t1 sector_trabajador
recode sector_trabajador ///
    11/23   = 1 /// Fuerzas Armadas y Policía
    100/199 = 2 /// Directivos / Gerentes
    200/299 = 3 /// Profesionales
    300/399 = 4 /// Técnicos y nivel medio
    400/499 = 5 /// Administrativos / Oficina
    500/699 = 6 /// Servicios y Comercio
    700/799 = 7 /// Agro y Oficios / Construcción
    800/899 = 8 /// Operadores y Conductores
    900/999 = 9 /// Ocupaciones elementales / No calificados
    .=9      /// cualquier missing se fuerza a categoría 9

* Definir etiquetas de las nuevas categorías
label define sector_trabajador 1 "FFAA/Policía" 2 "Directivos/Gerentes" 3 "Profesionales" 4 "Técnicos (nivel medio)" 5 "Administrativos/Oficina" 6 "Servicios y Comercio" 7 "Agro y Oficios/Construcción" 8 "Operadores y Conductores" 9 "Elementales/No calificados", replace

label values sector_trabajador sector_trabajador
label var sector_trabajador "Ocupación principal (9 macro-categorías)"

// ------ Desempeñó como: ocupación principal

rename p507_t1 categoria_trabajador

// ------ Ingresos -------

egen ingtrabw = rowtotal(i524a1_t1 d529t_t1 i530a_t1 d536_t1 i538a1_t1 d540t_t1 i541a_t1 d543_t1 d544t_t1 i538a1_t1 d538a1_t1)
drop i524a1_t1 d529t_t1 i530a_t1 d536_t1 i538a1_t1 d540t_t1 i541a_t1 d543_t1 d544t_t1 i538a1_t1 d538a1_t1

// ------- Alquiler -------

egen alquiler = rowtotal(p105b_t1 p106_t1)
drop p105b_t1 p106_t1

// ------ Tiempo en el trabajo ------

gen tiempotrabajo = p513a1_t1 + (p513a2_t1/12) 
drop p513a1_t1 p513a2_t1

// ---- Pregunta 402: desagregación sobre algun problema de salud ------

rename p4021_t1 sintoma_malestar
rename p4022_t1 enfermedad
rename p4023_t1 recaida
rename p4024_t1 accidente
rename p4025_t1 notuvoenf

// Nota: Se han deshabilitado la pregunta 403 (donde se atendio) y 404 (quien le atendió)

drop puestosalud centrosalud centroopuesto posta hospital_minsa hospital_seguro hospital_ffaa consultorio clinica farmacia domicilio otro no_busco
drop no_dinero lejos demora_mucho noconfia nograve remedio_caseros no_seguro autoreceto notiempo maltrato otro_motivo

//replace puestosalud = 99 if notuvoenf == 1
//replace centrosalud = 99 if notuvoenf == 1
//replace centroopuesto = 99 if notuvoenf == 1
//replace posta = 99 if notuvoenf == 1
//replace hospital_minsa = 99 if notuvoenf == 1
//replace hospital_seguro = 99 if notuvoenf == 1
//replace hospital_ffaa = 99 if notuvoenf == 1
//replace consultorio = 99 if notuvoenf == 1
//replace clinica = 99 if notuvoenf == 1
//replace farmacia = 99 if notuvoenf == 1
//replace domicilio = 99 if notuvoenf == 1
//replace otro = 99 if notuvoenf == 1
//replace no_busco = 99 if notuvoenf == 1

//replace no_dinero = 99 if  notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace lejos = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace demora_mucho = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace noconfia = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace nograve = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace remedio_caseros = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace no_seguro = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace autoreceto = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace notiempo = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace maltrato = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
//replace otro_motivo = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1

// ----- Trabajó para (imputación de "no aplica" en caso es independiente/empleador o trb. del hogar)

rename p510_t1 trabajopara
replace trabajopara = 99 if categoria_trabajador == 6 
replace trabajopara = 99 if p509_t1!=.
drop p509_t1

label define trabajopara 99 "Independiente/Empleador - Trabajador del hogar",add
label val trabajopara trabajopara

/// ----- Sobre las horas trabajadas la semana pasada (y las horas que norm. trabaja) ----

egen horastotales_sempasada = rowtotal(p513t_t1 p518_t1)
drop p513t_t1 p518_t1

replace horas_normtrabaja=horastotales_sempasada if horas_normtrabaja==.

// ------ Ratio de dependencia  -------
gen ratiodep=.
replace ratiodep=personas_ingresos/personas_hogar

// ------- FF.AA./Policia les pagan en sueldo -------

replace pagosueldo=1 if trabajopara==1
replace pagosalario=0 if trabajopara==1
replace pagocomision=0 if trabajopara==1
replace pagodestajo=0 if trabajopara==1
replace pagosubvencion=0 if trabajopara==1
replace pagohonorarios=0 if trabajopara==1
replace pagoganancianegocio=0 if trabajopara==1
replace pagoagropecuario=0 if trabajopara==1
replace pagopropina=0 if trabajopara==1
replace pagoespecie=0 if trabajopara==1
replace pagootros=0 if trabajopara==1
replace pagonorecibe=0 if trabajopara==1

/// --- El negocio donde trabaja esta registrado como persona juridica ---

replace registropersonajuridica=2 if registropersonajuridica==3
replace registropersonajuridica = 3 if (trabajopara==1 | trabajopara==2 |trabajopara==3)
replace registropersonajuridica = 99 if categoria_trabajador==6
label define registropersonajuridica 1 "Persona juridica" 2 "No es persona juridica" 3 "Entidad estatal" 99 "No aplica"
label val registropersonajuridica registropersonajuridica

/// --- El negocio donde trabaja lleva las cuentas por medio de libros ---

replace cuentassunat = 99 if (trabajopara==1 | trabajopara==2 |trabajopara==3 | categoria_trabajador==6)
label define cuentassunat 1 "Si" 2 "No" 99 "No aplica"
label val cuentassunat cuentassunat

// ----- Personas que trabajan para FF.AA. supondremos que trabajan con mas de 500 personas -----
replace numpersonastrabajo = 5 if trabajopara==1


// ----- Tipo de contrato: llenar missings ------

// Trabajar para FF.AA. es sinónimo de contrato a plazo indeterminado
replace tipocontrato = 1 if trabajopara==1
// Pregunta de contrato no aplica si uno es empleador o trabajador independiente
replace tipocontrato = 99 if categoria_trabajador == 1
replace tipocontrato = 99 if categoria_trabajador ==2

// Recoding por problemas en definición de variables a través de periodos:

replace agua_procedencia = 7 if agua_procedencia==8
replace lenguamaterna = 8 if lenguamaterna==9 
drop if niveleduc == 12
replace conexionsshh = 7 if conexionsshh == 9
replace conexionsshh = 7 if conexionsshh == 8

// --- No aplica pregunta sobre título si la vivienda no es propia ---

replace viviendatitulo = 99 if vivienda_status==1
replace viviendatitulo = 99 if vivienda_status==5
replace viviendatitulo = 99 if vivienda_status==6
replace viviendatitulo = 99 if vivienda_status==7

// --- Generamos la variable "region" ---

gen     region=1 if dominio>=1 & dominio<=3 
replace region=1 if dominio==8
replace region=2 if dominio>=4 & dominio<=6 
replace region=3 if dominio==7 
label define region 1 "Costa" 2 "Sierra" 3 "Selva"
lab val region region

// --- Generamos la variable "area" ---

replace estrato_t1=1 if dominio==8
recode estrato_t1 (1/5=1) (6/8=2), gen(area)
recode area (1=1) (2=0)
label variable area "Area"
drop estrato_t1
label define area 1"Urbana" 0"Rural"
label values area area

// --- Generamos la variable "dpto" ---

destring ubigeo, generate(dpto)
replace dpto=dpto/10000
replace dpto=round(dpto)
label variable dpto "Departamento"
label define dpto 1 "Amazonas"
label define dpto 2 "Ancash", add
label define dpto 3 "Apurimac", add
label define dpto 4 "Arequipa", add
label define dpto 5 "Ayacucho", add
label define dpto 6 "Cajamarca", add
label define dpto 7 "Callao", add
label define dpto 8 "Cusco", add
label define dpto 9 "Huancavelica", add
label define dpto 10 "Huanuco", add
label define dpto 11 "Ica", add
label define dpto 12 "Junin", add
label define dpto 13 "La_Libertad", add
label define dpto 14 "Lambayeque", add
label define dpto 15 "Lima", add
label define dpto 16 "Loreto", add
label define dpto 17 "Madre_de_Dios", add
label define dpto 18 "Moquegua", add
label define dpto 19 "Pasco", add
label define dpto 20 "Piura", add
label define dpto 21 "Puno", add
label define dpto 22 "San_Martin", add
label define dpto 23 "Tacna", add
label define dpto 24 "Tumbes", add
label define dpto 25 "Ucayali", add
label values dpto dpto

drop ubigeo_t1

// ---- AFP y ONP ----

gen afp=.
replace afp=1 if p558a1_t1==1
replace afp=0 if p558a1_t1==0
gen onp=.
replace onp=1 if p558a2_t1==2
replace onp=0 if p558a2_t1==0

drop p558a1_t1 p558a2_t1 p558a5_t1








/// ----- Clasificación del negocio bajo CIIU_1D -----

gen      ciiu_aux1 =substr("0"+string(p506r4_t1),1,.)
replace  ciiu_aux1 =substr(string(p506r4_t1),1,.) if p506r4>999
gen      ciiu_aux2 =substr(ciiu_aux1 ,1,2)
destring ciiu_aux2, generate(ciiu_2d)
gen      ciiu_1d=1 if  ciiu_2d<=2
replace  ciiu_1d=2 if  ciiu_2d==3
replace  ciiu_1d=3 if  ciiu_2d>=5  & ciiu_2d<=9
replace  ciiu_1d=4 if  ciiu_2d>=10 & ciiu_2d<=33
replace  ciiu_1d=5 if  ciiu_2d>=41 & ciiu_2d<=43
replace  ciiu_1d=6 if  ciiu_2d>=45 & ciiu_2d<=47
replace  ciiu_1d=7 if (ciiu_2d>=49 & ciiu_2d<=53) | (ciiu_2d>=58 & ciiu_2d<=63)
replace  ciiu_1d=8 if  ciiu_2d==84
replace  ciiu_1d=9 if  ciiu_2d>=55 & ciiu_2d<=56
replace  ciiu_1d=10 if ciiu_2d==68 | (ciiu_2d>=69 & ciiu_2d<=82)
replace  ciiu_1d=11 if ciiu_2d==85 					 
replace  ciiu_1d=12 if (ciiu_2d>=35 & ciiu_2d<=39) | (ciiu_2d>=64 & ciiu_2d<=66)  | ///
  (ciiu_2d>=86 & ciiu_2d<=88) |  (ciiu_2d>=90 & ciiu_2d<=93)| (ciiu_2d>=94 & ciiu_2d<=98) |  ciiu_2d==99
  
drop ciiu_aux1 ciiu_aux2 ciiu_2d
drop p506r4_t1
					 				 
label var ciiu_1d "Division CIIU"
la de ciiu_1d 1 "Agricultura" 2 "Pesca"  3 "Mineria" 4 "Manufactura" 5 "Construccion" ///
 6 "Comercio" 7 "Transportes y Comunicaciones"  8 "Gobierno" 9 "Hoteles y Restaurantes" ///
 10 "Inmobiliarias y alquileres" 11 "Ensehnanza" 12 "Otros Servicios"
 label values ciiu_1d ciiu_1d
*1/ Otros Servicios lo componen las ramas de actividad de Electricidad, Gas y Agua, 
*Intermediación Financiera, Actividades de Servicios Sociales y de Salud, Otras activ.
*de Serv. Comunitarias, Sociales y Personales y Hogares privados con servicio doméstico.

/// ----- Clasificación del negocio bajo CIIU_6C -----

*Población ocupada en empleo informal por Rama de Actividad
gen      ciiu_6c=1 if ciiu_1d<4
replace  ciiu_6c=2 if ciiu_1d==4
replace  ciiu_6c=3 if ciiu_1d==5
replace  ciiu_6c=4 if ciiu_1d==6
replace  ciiu_6c=5 if ciiu_1d==7
replace  ciiu_6c=6 if ciiu_1d>7

label var ciiu_6c "Division CIIU-6 categorias"
la de ciiu_6c 1 "Agricultura/Pesca/Mineria" 2 "Manufactura" 3 "Construccion" ///
 4 "Comercio" 5 "Transportes y Comunicaciones" 6 "Otros Servicios 1/"
 label values ciiu_6c ciiu_6c


// DROP: variables relacionadas a ingreso por separacion, alimentación, etc....
drop p5561a_t1 p5562a_t1 p5563a_t1 p5564a_t1 p5565a_t1 p5566a_t1 p5567a_t1 p5568a_t1 p5569a_t1

// DROP: variables relacionadas a ingreso financieros diversos....
drop p5571a_t1 p5572a_t1 p5573a_t1 p5574a_t1 p5575a_t1 p5576a_t1 p5577a_t1 p5578a_t1





drop ciiu_1d



save "1_panel/final_dataset.dta",replace
export delimited using "1_panel/final_dataset.csv", replace nolabel



