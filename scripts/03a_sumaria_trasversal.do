cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global processed "$data/processed"
global raw "$data/raw"
global trasversal "$raw/2_trasversal"
set maxvar 10000


///////////////////////////////////////////////////////////////////////
///////////////////////    Módulo 100     /////////////////////////////
///////////////////////////////////////////////////////////////////////

//////////////////////////   2011   ///////////////////////////////////

cd "$trasversal/2011"
clear
use "sumaria-2011.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2011/2011_sumaria.dta", replace

//////////////////////////   2012   ///////////////////////////////////

cd "$trasversal/2012"
clear
use "sumaria-2012.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2012/2012_sumaria.dta", replace

//////////////////////////   2013   ///////////////////////////////////

cd "$trasversal/2013"
clear
use "sumaria-2013.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2013/2013_sumaria.dta", replace

//////////////////////////   2014   ///////////////////////////////////

cd "$trasversal/2014"
clear
use "sumaria-2014.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2014/2014_sumaria.dta", replace

//////////////////////////   2015   ///////////////////////////////////

cd "$trasversal/2015"
clear
use "sumaria-2015.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2015/2015_sumaria.dta", replace

//////////////////////////   2016   ///////////////////////////////////

cd "$trasversal/2016"
clear
use "sumaria-2016.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2016/2016_sumaria.dta", replace

//////////////////////////   2017   ///////////////////////////////////

cd "$trasversal/2017"
clear
use "sumaria-2017.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2017/2017_sumaria.dta", replace

//////////////////////////   2018   ///////////////////////////////////

cd "$trasversal/2018"
clear
use "sumaria-2018.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2018/2018_sumaria.dta", replace


//////////////////////////   2019   ///////////////////////////////////

cd "$trasversal/2019"
clear
use "sumaria-2019.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2019/2019_sumaria.dta", replace

//////////////////////////   2020   ///////////////////////////////////

cd "$trasversal/2020"
clear
use "sumaria-2020.dta"

keep conglome vivienda hogar mieperho percepho pobreza

save "$processed/2_trasversal/2020/2020_sumaria.dta", replace