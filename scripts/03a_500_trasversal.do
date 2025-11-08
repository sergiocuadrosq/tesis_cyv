cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global trasversal "$raw/2_trasversal"
global processed "$data/processed"
set maxvar 10000


///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo 500     /////////////////////////////
///////////////////////////////////////////////////////////////////////

//////////////////////////   2011   ///////////////////////////////////

cd "$trasversal/2011"
clear
use "enaho01a-2011-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a
	 
rename p510a p510a1
/// Ante missing de transferencia Pension 65
gen p5569a=.

save "$processed/2_trasversal/2011/2011_500.dta", replace

//////////////////////////   2012   ///////////////////////////////////
cd "$trasversal/2012"
clear
use "enaho01a-2012-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a
	 
/// Ante missing de transferencia Pension 65
gen p5569a=.

save "$processed/2_trasversal/2012/2012_500.dta", replace

//////////////////////////   2013   ///////////////////////////////////
cd "$trasversal/2013"
clear
use "enaho01a-2013-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a
	 
/// Ante missing de transferencia Pension 65
gen p5569a=.

save "$processed/2_trasversal/2013/2013_500.dta", replace


//////////////////////////   2014   ///////////////////////////////////

cd "$trasversal/2014"
clear
use "enaho01a-2014-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2014/2014_500.dta", replace

//////////////////////////   2015   ///////////////////////////////////

cd "$trasversal/2015"
clear
use "enaho01a-2015-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2015/2015_500.dta", replace

//////////////////////////   2016  ///////////////////////////////////

cd "$trasversal/2016"
clear
use "enaho01a-2016-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2016/2016_500.dta", replace

//////////////////////////   2017  ///////////////////////////////////

cd "$trasversal/2017"
clear
use "enaho01a-2017-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2017/2017_500.dta", replace


//////////////////////////   2018  ///////////////////////////////////

cd "$trasversal/2018"
clear
use "enaho01a-2018-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2018/2018_500.dta", replace

//////////////////////////   2019  ///////////////////////////////////

cd "$trasversal/2019"
clear
use "enaho01a-2019-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2019/2019_500.dta", replace

//////////////////////////   2020  ///////////////////////////////////

cd "$trasversal/2020"
clear
use "enaho01a-2020-500.dta"

keep ubigeo estrato ocupinf conglome vivienda dominio hogar codperso p207 p208a ///
     p209 p501 p505 p506r4 p507 p509 p510 p510a1 p510b p511a ///
	 p5111 p5112 p5113 p5114 p5115 p5116 p5117 p5118 p5119 p51110 p51111 p51112 ///
	 p512a p513t ///
     p513a1 p513a2 p514 p518 p519 p520 p521  ///
	 p5561a p5562a p5563a p5564a p5565a p5566a p5567a p5568a p5569a ///
	 p5571a p5572a p5573a p5574a p5575a p5576a p5577a p5578a ///
	 p558a1 p558a2 p558a5 ///
	 i524a1 d529t i530a d536 i538a1 d540t i541a d543 d544t i538a1 d538a1 fac500a

save "$processed/2_trasversal/2020/2020_500.dta", replace
