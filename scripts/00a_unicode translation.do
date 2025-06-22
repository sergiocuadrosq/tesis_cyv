cls
clear
global main "C:\projects\tesis_cyv"
global dos "$main/programs"
global data "$main/data"
global raw "$main/data/raw"
set maxvar 10000
cd "$raw"

/// Unicode translating///

unicode encoding set "latin1"

///------ 2019-2023------///



//Panel 2019-2020//

cd "$raw/2019-2023"

unicode translate "enaho01-2019-2023-100-panel.dta"
unicode translate "enaho01-2019-2023-200-panel.dta"
unicode translate "enaho01a-2019-2023-300-panel.dta"
unicode translate "enaho01a-2019-2023-400-panel.dta"
unicode translate "enaho01a-2019-2023-500-panel.dta"
unicode translate "sumaria-2019-2023-12g-panel.dta"
unicode translate "sumaria-2019-2023-panel.dta"

//Panel 2018-2022//

cd "$raw/2018-2022"

unicode translate "enaho01-2018-2022-100-panel.dta"
unicode translate "enaho01-2018-2022-200-panel.dta"
unicode translate "enaho01a-2018-2022-300-panel.dta"
unicode translate "enaho01a-2018-2022-400-panel.dta"
unicode translate "enaho01a-2018-2022-400-panel.dta"
unicode translate "sumaria-2018-2022-panel.dta"

//Panel 2017-2021//

cd "$raw/2017-2021"

unicode translate "enaho01-2017-2021-100-panel.dta"
unicode translate "enaho01-2017-2021-200-panel.dta"
unicode translate "enaho01a-2017-2021-300-panel.dta"
unicode translate "enaho01a-2017-2021-400-panel.dta"
unicode translate "enaho01a-2017-2021-500-panel.dta"
unicode translate "sumaria-2017-2021-panel.dta"

//Panel 2016-2020//

cd "$raw/2016-2020"

unicode translate "enaho01-2016-2020-100-panel.dta"
unicode translate "enaho01-2016-2020-200-panel.dta"
unicode translate "enaho01a-2016-2020-300-panel.dta"
unicode translate "enaho01a-2016-2020-400-panel.dta"
unicode translate "enaho01a-2016-2020-500-panel01.dta"
unicode translate "enaho01a-2016-2020-500-panel02.dta"
unicode translate "sumaria-2016-2020-panelf.dta"

//Panel 2015-2019//

cd "$raw/2015-2019"

unicode translate "enaho01-2015-2019-100-panel.dta"
unicode translate "enaho01-2015-2019-200-panel.dta"
unicode translate "enaho01a-2015-2019-300-panel.dta"
unicode translate "enaho01a-2015-2019-400-panel.dta"
unicode translate "enaho01a-2015-2019-500-panel_01.dta"
unicode translate "enaho01a-2015-2019-500-panel_02.dta"
unicode translate "sumaria-2015-2019-panel.dta"

//Panel 2014-2018//

cd "$raw/2014-2018"

unicode translate "enaho01-2014-2018-100-panel.dta"
unicode translate "enaho01-2014-2018-200-panel.dta"
unicode translate "enaho01a-2014-2018-300-panel.dta"
unicode translate "enaho01a-2014-2018-400-panel.dta"
unicode translate "enaho01a-2014-2018-500-panel.dta"
unicode translate "sumaria-2014-2018-panel.dta"













