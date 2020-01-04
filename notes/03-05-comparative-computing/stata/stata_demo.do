
* this is a comment in Stata
set more off
log using testlog , replace

* cd to the /stata folder on your local machine
cd "/Users/simonheuberger/Insync/Google Drive/data_science_center/winter_inst/winter-inst/03-pm-computing/comparative/stata"
use auto
describe
summarize
tabulate mpg
list make price mpg

log close
