cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global trasversal "$raw/2_trasversal"
set maxvar 10000


///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo 300     /////////////////////////////
///////////////////////////////////////////////////////////////////////


//////////////////////////   2011   ///////////////////////////////////

cd "$trasversal/2011"
clear
use "enaho01a-2011-300.dta"

keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	  
save "$processed/2_trasversal/2011/2011_300.dta", replace


//////////////////////////   2012   ///////////////////////////////////
cd "$trasversal/2012"
clear
use "enaho01a-2012-300.dta"

keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	  
save "$processed/2_trasversal/2012/2012_300.dta", replace
//////////////////////////   2013   ///////////////////////////////////

cd "$trasversal/2013"
clear
use "enaho01a-2013-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2013/2013_300.dta", replace

//////////////////////////   2014   ///////////////////////////////////

cd "$trasversal/2014"
clear
use "enaho01a-2014-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2014/2014_300.dta", replace

//////////////////////////   2015   ///////////////////////////////////

cd "$trasversal/2015"
clear
use "enaho01a-2015-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2015/2015_300.dta", replace

//////////////////////////   2016   ///////////////////////////////////

cd "$trasversal/2016"
clear
use "enaho01a-2016-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2016/2016_300.dta", replace


//////////////////////////   2017   ///////////////////////////////////

cd "$trasversal/2017"
clear
use "enaho01a-2017-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2017/2017_300.dta", replace

//////////////////////////   2018   ///////////////////////////////////

cd "$trasversal/2018"
clear
use "enaho01a-2018-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2018/2018_300.dta", replace

//////////////////////////   2019   ///////////////////////////////////

cd "$trasversal/2019"
clear
use "enaho01a-2019-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2019/2019_300.dta", replace

//////////////////////////   2020   ///////////////////////////////////

cd "$trasversal/2020"
clear
use "enaho01a-2020-300.dta"
keep conglome vivienda hogar codperso p300a p301a p306 ///
      p314a
	
save "$processed/2_trasversal/2020/2020_300.dta", replace
