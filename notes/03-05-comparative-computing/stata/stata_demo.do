
* this is a comment in Stata
* cd to the /Stata folder on your local machine
cd "/Users/simonheuberger/Insync/Google Drive/data_science_center/winter_inst/winter-inst-2020/notes/03-05-comparative-computing/stata"
set more off
log using testlog , replace

* cd to the /data folder on your local machine
cd "/Users/simonheuberger/Insync/Google Drive/data_science_center/winter_inst/winter-inst-2020/data"
use auto
describe
summarize
tabulate mpg
list make price mpg

log close
