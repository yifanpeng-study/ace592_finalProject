clear all

import delimited "/Users/mandy/Box Sync/ACE592Project/final_all_data.csv"

gen t=_n //generate time order variable

tsset t //set time variable

**create log value of price and stock**
gen lnzx50=ln(nzx50_index)
gen lbit=ln(bitcoin_usd)
gen leth=ln(ethereum_usd)
gen ldoge=ln(doge_usd)


**ADF test**
dfuller sentiment_score
dfuller lnzx50
dfuller lbit
dfuller leth
dfuller ldoge

**Take difference to not stable variable**
gen d_lnzx50=D.lnzx50 
gen d_lbit=D.lbit
gen d_leth=D.leth
gen d_ldoge=D.ldoge

**ADF test**
dfuller d_lnzx50
dfuller d_lbit
dfuller d_leth
dfuller d_ldoge


****VAR*****

*decide lag value
varsoc d_lbit sentiment_score d_lnzx50 d_leth d_ldoge, maxlag(10) // choose 2 according to LR statistics

*var coefficient*
var d_lbit sentiment_score d_lnzx50 d_leth d_ldoge, lags(1/2) 

matlist e(Sigma) 

*Check for stability*
varstable, graph

*----save graph------*
*graph export "stability.png", replace


**Granger Test**
quietly var d_lbit sentiment_score d_lnzx50 d_leth d_ldoge, lags(1/2) 

vargranger 


**Impulse esponse analysis**

*response_sentiment*
quietly var d_lbit sentiment_score d_lnzx50 d_leth d_ldoge, lags(1/2) 

irf create sentiment, step(10) set(senti) replace // impulse 8 period

irf graph oirf, impulse(d_ldoge)   /// impulsed variables
                response(sentiment_score)  /// responsed variables
                yline(0,lcolor(black)) ///
                xlabel(0(2)10) ///
                byopts(yrescale)

*-----save graph-----*
graph export "irf_sentiment.png", replace

*response_doge*
quietly var d_lbit sentiment_score d_lnzx50 d_leth d_ldoge, lags(1/2) 

irf create doge, step(10) set(doge) replace // impulse 8 period

irf graph oirf, impulse(d_leth)   /// impulsed variables
                response(d_ldoge)  /// responsed variables
                yline(0,lcolor(black)) ///
                xlabel(0(2)10) ///
                byopts(yrescale)
			   
*-----save graph-----*			   
graph export "irf_doge.png", replace
