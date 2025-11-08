cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global trasversal "$raw/2_trasversal"
global processed "$data/processed"

set maxvar 10000


///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo 100     /////////////////////////////
///////////////////////////////////////////////////////////////////////

//////////////////////////   2011   ///////////////////////////////////

cd "$trasversal/2011"
clear
use "enaho01-2011-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111 p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 
rename p111 p111a

save "$processed/2_trasversal/2011/2011_100.dta", replace

//////////////////////////   2012   ///////////////////////////////////

cd "$trasversal/2012"
clear
use "enaho01-2012-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2012/2012_100.dta", replace


//////////////////////////   2013   ///////////////////////////////////

cd "$trasversal/2013"
clear
use "enaho01-2013-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2013/2013_100.dta", replace

//////////////////////////   2014   ///////////////////////////////////

cd "$trasversal/2014"
clear
use "enaho01-2014-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2014/2014_100.dta", replace

//////////////////////////   2015   ///////////////////////////////////

cd "$trasversal/2015"
clear
use "enaho01-2015-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2015/2015_100.dta", replace


//////////////////////////   2016   ///////////////////////////////////

cd "$trasversal/2016"
clear
use "enaho01-2016-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2016/2016_100.dta", replace

//////////////////////////   2017   ///////////////////////////////////

cd "$trasversal/2017"
clear
use "enaho01-2017-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2017/2017_100.dta", replace

//////////////////////////   2018   ///////////////////////////////////

cd "$trasversal/2018"
clear
use "enaho01-2018-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2018/2018_100.dta", replace

//////////////////////////   2019   ///////////////////////////////////

cd "$trasversal/2019"
clear
use "enaho01-2019-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2019/2019_100.dta", replace

//////////////////////////   2020   ///////////////////////////////////

cd "$trasversal/2020"
clear
use "enaho01-2020-100.dta"

keep conglome vivienda hogar p101 p102 p103 p103a p104 p104a ///
     p105a p105b p106 p106a p110 p111a p112a p113a ///
     p1144 p1142 
	 //p107b1 p110a1
	 

save "$processed/2_trasversal/2020/2020_100.dta", replace