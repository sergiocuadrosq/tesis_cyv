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
use "enaho01a-2011-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2011/2011_400.dta", replace

//////////////////////////   2012   ///////////////////////////////////

cd "$trasversal/2012"
clear
use "enaho01a-2012-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2012/2012_400.dta", replace

//////////////////////////   2013   ///////////////////////////////////

cd "$trasversal/2013"
clear
use "enaho01a-2013-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2013/2013_400.dta", replace

//////////////////////////   2014   ///////////////////////////////////

cd "$trasversal/2014"
clear
use "enaho01a-2014-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2014/2014_400.dta", replace


//////////////////////////   2014   ///////////////////////////////////

cd "$trasversal/2014"
clear
use "enaho01a-2014-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2014/2014_400.dta", replace

//////////////////////////   2015   ///////////////////////////////////

cd "$trasversal/2015"
clear
use "enaho01a-2015-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2015/2015_400.dta", replace

//////////////////////////   2016   ///////////////////////////////////

cd "$trasversal/2016"
clear
use "enaho01a-2016-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2016/2016_400.dta", replace

//////////////////////////   2017   ///////////////////////////////////

cd "$trasversal/2017"
clear
use "enaho01a-2017-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2017/2017_400.dta", replace

//////////////////////////   2018   ///////////////////////////////////

cd "$trasversal/2018"
clear
use "enaho01a-2018-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2018/2018_400.dta", replace

//////////////////////////   2019   ///////////////////////////////////

cd "$trasversal/2019"
clear
use "enaho01a-2019-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2019/2019_400.dta", replace


//////////////////////////   2020   ///////////////////////////////////

cd "$trasversal/2020"
clear
use "enaho01a-2020-400.dta"


keep conglome vivienda hogar codperso ///
     p401 p4021 p4022 p4023 p4024 p4025 ///
     p4191 p4192 p4193 p4194 p4195 ///
     p4031 p4032 p4033 p4034 p4035 p4036 p4037 p4038 p4039 ///
     p40310 p40311 p40313 p40314 ///
     p4091 p4092 p4093 p4094 p4095 p4096 ///
     p4097 p4098 p4099 p40910 p40911
	 /// p4196 p4197 p4198
	 
save "$processed/2_trasversal/2020/2020_400.dta", replace