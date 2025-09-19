cls
clear
global main "C:\projects\tesis_cyv"
global data "$main/data"
global raw "$data/raw"
global processed "$data/processed"
set maxvar 10000

cd "$data/final"
use panel_final_combined_data.dta

misstable summarize, all
