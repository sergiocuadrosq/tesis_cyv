cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global final "$data/final"
set maxvar 10000

cd "$final"
use "2_trasversal/trasversal_apilado.dta"


//////// Descarte de condiciones no necesarias)

keep if ocupinf==2

//////////////////// Renaming /////////////////////
rename dominio dominio
rename conglome conglome
rename vivienda vivienda
rename hogar hogar
rename codperso codperso
rename p207 sexo
rename p208a edad
rename p209 estadocivil
rename p501 tuvotrabajo
rename p505 sector_trabajador
rename p507 categoria_trabajador
rename p510 trabajopara
rename p510a1 registropersonajuridica
rename p510b cuentassunat
rename p511a tipocontrato
rename p5111 pagosueldo
rename p5112 pagosalario
rename p5113 pagocomision
rename p5114 pagodestajo
rename p5115 pagosubvencion
rename p5116 pagohonorarios
rename p5117 pagoganancianegocio
rename p5118 pagoagropecuario
rename p5119 pagopropina
rename p51110 pagoespecie
rename p51111 pagootros
rename p51112 pagonorecibe
rename p512a numpersonastrabajo
rename p514 tuvootrotrabajo
rename p519 normtrabaja
rename p520 horas_normtrabaja
rename p521 disponiblehorastrabajar
//rename p521a_t1 disponibletrabajar
// rename p521c_t1 deseaotrotrabajo (eliminada pq en paneles antiguos no aparece)
// rename p528_t1 recibiopagoespecie
// rename p558c_t1 antepasadosconsidera (no aparece paneles antiguos)
// rename p558d_t1 perteneceindig (no aparece paneles antiguos)
rename p300a lenguamaterna
rename p301a niveleduc
// rename p302_t1 leerescribir
rename p306 asiste_educ
// rename p307_t1 asiste_educ
rename p314a usointernet
// rename p401f_t1 viviadistrito (eliminada no aparece paneles antiguos)
rename p401 padece_enfer
rename p4021 sintoma_malestar
rename p4022 enfermedad
rename p4023 recaida
rename p4024 accidente
rename p4025 notuvoenf
rename p4191 essalud
rename p4192 seguroprivado
rename p4193 eps
rename p4194 seguroffaa
rename p4195 sis
rename p4031 puestosalud
rename p4032 centrosalud
rename p4033 centroopuesto
rename p4034 posta
rename p4035 hospital_minsa
rename p4036 hospital_seguro
rename p4037 hospital_ffaa
rename p4038 consultorio 
rename p4039 clinica
rename p40310 farmacia
rename p40311 domicilio
rename p40313 otro
rename p40314 no_busco
rename p4091 no_dinero
rename p4092 lejos
rename p4093 demora_mucho
rename p4094 noconfia
rename p4095 nograve
rename p4096 remedio_caseros
rename p4097 no_seguro
rename p4098 autoreceto
rename p4099 notiempo
rename p40910 maltrato
rename p40911 otro_motivo
rename p101 tipovivienda
rename p102 materialparedes
rename p103 materialpisos
rename p103a materialtechos
rename p104 habitaciones
rename p104a habitacionesdormir
rename p105a vivienda_status
rename p106a viviendatitulo
// rename p107b1 credito_vivienda
rename p110 agua_procedencia
// rename p110a1 agua_potable (eliminada no aparece paneles antiguos)
rename p111a conexionsshh
rename p112a electricidad
rename p113a combustible
rename p1142 celular
rename p1144 internet
rename percepho personas_ingresos
rename mieperho personas_hogar
rename pobreza pobreza

////////////////////////////////////////////////////////
////////////////Tratamiento individual//////////////////
////////////////////////////////////////////////////////

//

gen tiempotrabajo = p513a1 + (p513a2/12) 
drop p513a1 p513a2

//

replace registropersonajuridica=2 if registropersonajuridica==3

///

replace trabajopara = 99 if categoria_trabajador == 6 & trabajopara == .
replace trabajopara = 99 if p509!=.
drop p509

//

//replace antepasadosconsidera = 7 if antepasadosconsidera == 9

//

//drop if viviadistrito ==3

//

replace conexionsshh = 7 if conexionsshh == 9
replace conexionsshh = 7 if conexionsshh == 8

//

//replace agua_potable = 99 if (agua_procedencia != 1 & agua_procedencia != 2 & agua_procedencia != 3)

//

replace agua_procedencia = 7 if agua_procedencia==8

//

egen alquiler = rowtotal(p105b p106)
drop p105b p106

//

replace puestosalud = 99 if notuvoenf == 1
replace centrosalud = 99 if notuvoenf == 1
replace centroopuesto = 99 if notuvoenf == 1
replace posta = 99 if notuvoenf == 1
replace hospital_minsa = 99 if notuvoenf == 1
replace hospital_seguro = 99 if notuvoenf == 1
replace hospital_ffaa = 99 if notuvoenf == 1
replace consultorio = 99 if notuvoenf == 1
replace clinica = 99 if notuvoenf == 1
replace farmacia = 99 if notuvoenf == 1
replace domicilio = 99 if notuvoenf == 1
replace otro = 99 if notuvoenf == 1
replace no_busco = 99 if notuvoenf == 1

//

replace no_dinero = 99 if  notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace lejos = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace demora_mucho = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace noconfia = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace nograve = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace remedio_caseros = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace no_seguro = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace autoreceto = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace notiempo = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace maltrato = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1
replace otro_motivo = 99 if notuvoenf == 1 | puestosalud == 1 | centrosalud == 1 | centroopuesto == 1 | posta == 1 | hospital_minsa == 1 | hospital_ffaa == 1 | hospital_seguro == 1 | consultorio == 1 | clinica == 1

//

replace numpersonastrabajo = 99 if trabajopara==1

// 	

replace registropersonajuridica = 99 if (trabajopara==1 | trabajopara==2 |trabajopara==3 | categoria_trabajador==6)

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

egen horastotales_sempasada = rowtotal(p513t p518)
drop p513t p518

replace horas_normtrabaja=horastotales_sempasada if horas_normtrabaja==.

//

// replace deseaotrotrabajo = 99 if categoria_trabajador==5

///

egen ingtrabw = rowtotal(i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1)
drop i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1

///



*===========================================================
* Re-codificar p505_t1 en 9 macro-categorías con etiquetas
*===========================================================

* (Opcional) Guardar copia del original
clonevar sector_trabajador_orig = sector_trabajador

* Re-codificación directa
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
label define p505macro ///
1 "FFAA/Policía" ///
2 "Directivos/Gerentes" ///
3 "Profesionales" ///
4 "Técnicos (nivel medio)" ///
5 "Administrativos/Oficina" ///
6 "Servicios y Comercio" ///
7 "Agro y Oficios/Construcción" ///
8 "Operadores y Conductores" ///
9 "Elementales/No calificados", replace

* Asignar etiquetas
label values sector_trabajador p505macro
label var sector_trabajador "Ocupación principal (9 macro-categorías)"

drop sector_trabajador_orig

///

replace pagosueldo=0 if pagosueldo==.  
replace pagosalario=0 if pagosalario==.
replace pagocomision=0 if pagocomision==.
replace pagodestajo=0 if pagodestajo==.
replace pagosubvencion=0 if pagosubvencion==.
replace pagohonorarios=0 if pagohonorarios==.
replace pagoganancianegocio=0 if pagoganancianegocio==.
replace pagoagropecuario=0 if pagoagropecuario==.
replace pagopropina=0 if pagopropina==.
replace pagoespecie=0 if pagoespecie==.
replace pagootros=0 if pagootros==.
replace pagonorecibe=0 if pagonorecibe==.
////


drop p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a

////


drop p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a
////


gen afp=.
replace afp=1 if p558a1==1
replace afp=0 if p558a1==0
gen onp=.
replace onp=1 if p558a2==2
replace onp=0 if p558a2==0

drop p558a1 p558a2 p558a5

////

gen ratiodep=.
replace ratiodep=personas_ingresos/personas_hogar

////

gen     region=1 if dominio>=1 & dominio<=3 
replace region=1 if dominio==8
replace region=2 if dominio>=4 & dominio<=6 
replace region=3 if dominio==7 
label define region 1 "Costa" 2 "Sierra" 3 "Selva"
lab val region region

////

replace estrato=1 if dominio==8
recode estrato (1/5=1) (6/8=2), gen(area)
recode area (1=1) (2=0)
label variable area "Area"
drop estrato
label define area 1"Urbana" 0"Rural"
label values area area

///
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

drop ubigeo

///

*Población ocupada, según ramas de actividad
*CIIU
gen      ciiu_aux1 =substr("0"+string(p506r4),1,.)
replace  ciiu_aux1 =substr(string(p506r4),1,.) if p506r4>999
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
					 				 
label var ciiu_1d "Division CIIU"
la de ciiu_1d 1 "Agricultura" 2 "Pesca"  3 "Mineria" 4 "Manufactura" 5 "Construccion" ///
 6 "Comercio" 7 "Transportes y Comunicaciones"  8 "Gobierno" 9 "Hoteles y Restaurantes" ///
 10 "Inmobiliarias y alquileres" 11 "Ensehnanza" 12 "Otros Servicios 1/"
 label values ciiu_1d ciiu_1d
*1/ Otros Servicios lo componen las ramas de actividad de Electricidad, Gas y Agua, 
*Intermediación Financiera, Actividades de Servicios Sociales y de Salud, Otras activ.
*de Serv. Comunitarias, Sociales y Personales y Hogares privados con servicio doméstico.

////

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
*1/ Otros Servicios lo componen las ramas de actividad de Electricidad, Gas y Agua, 
*Intermediación Financiera, Actividades de Servicios Sociales y de Salud, Otras activ.
*de Serv. Comunitarias, Sociales y Personales y Hogares privados con servicio doméstico.
*Adicionalmente incluye Gobierno, Hoteles y Restaurantes, Inmobiliarias y alquileres y Ensehnanza

drop p506r4
drop ciiu_1d


///////////// ADICIONALES PARA QUE EL MODELO FUNCIONE ///////////////////

// Hacemos insignificante pagosubvencion//
replace pagosubvencion=0

// Hacemos insignificante las 6 personas que marcaron otro en tipovivienda, se  eliminan de todas formas en el lasso todas sus interacciones//

replace tipovivienda=7 if tipovivienda==8

// Mandamos a la gente (5 gatos) con educacion inicial a "sin nivel" para evitar la creacion de esta nueva categoria.

replace niveledu=1 if niveleduc==2

// Mandamos a 40 personas que hablan otras lenguas amazonicas a su categoria_trabajador

replace lenguamaterna=3 if lenguamaterna==10
replace lenguamaterna=3 if lenguamaterna==11
replace lenguamaterna=3 if lenguamaterna==12
replace lenguamaterna=3 if lenguamaterna==13
replace lenguamaterna=3 if lenguamaterna==14
replace lenguamaterna=3 if lenguamaterna==15

/// Otro contrato definiremos como 99//
replace tipocontrato=99 if tipocontrato==8



save "2_trasversal/final_dataset_trasversal.dta",replace
export delimited using "2_trasversal/final_dataset_trasversal.csv", replace nolabel



