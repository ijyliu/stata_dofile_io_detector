* analysis_national_clean_with_slidetables.do
* Performs the main high-level analysis for the paper.
* Inputs:
* "inputs/gap_dist_stats_national_month`j'.dta"
* "inputs/CLTV_national_month`j'.dta"
* "inputs/ratebins_level_national_month`j'.dta"
* "inputs/ratebins_national_month`j'.dta"
* "inputs/corelogic_national.dta"
* "inputs/ARMshare.dta"
* "inputs/cpi.dta"
* "inputs/unrate.dta"
* "inputs/indprod.dta"
* "inputs/mp_shocks_data.dta"
* "inputs/averate_national.dta"
* "inputs/national_refi_panel.dta"
* "~\Dropbox\Coupon Distribution and Macro Outcomes\empirical\Stata\output\ts_fr_by_loan_purpose_v2.dta"
* "inputs/mba_refi_index_monthly"
* "~\Dropbox\Coupon Distribution and Macro Outcomes\empirical\Stata\output\prepayment_ts_all_agg.dta"
* "inputs/ratebins_national_month`j'_includeallfirstliens.dta"
* "inputs/count_predictedr_month`j'.dta"
* "inputs/ratebins_national_month`j'_heterogeneous_reset_r.dta"
* "inputs/ratebins_national_month`j'_only_gse.dta"
* "inputs/ratebins_national_month`j'_never_delinquent.dta"
* "inputs/ratebins_dollars_national_month`j'.dta"
* "thresholds_dollars"
* Outputs:
* "mortgage_rate.csv"
* "gap_dist_stats_national.csv"
* "results/coupon_level_distribution_by_datem.csv"
* "gapdist_1992m1.csv"
* "gapdist_1997m1.csv"
* "gapdist_2002m1.csv"
* "gapdist_2007m1.csv"
* "gapdist_2012m1.csv"
* "gapdist_2017m1.csv"
* "results/coupon_distribution_by_datem.csv"
* "inputs/data_fracpos_freq.csv"
* "freq.csv"
* "results/tables/prepaymenteffects_different_thresholds)old.tex"
* "results/tables/prepaymenteffects_fracpos_LTV.tex"
* "results/tables/prepaymenteffects_controls.tex"
* "results/tables/prepaymenteffects_controls_IV.tex"
* "results/tables/tot_refi_different_thresholds.tex"
* "results/tables/tot_refi_fracpos_LTV.tex"
* "results/tables/tot_refi_controls.tex"
* "results/tables/tot_refi_controls_IV.tex"
* "results/tables/prepaymenteffects_bytype_newey.tex"
* "results/tables/prepaymenteffects_bytype_newey_short.tex"
* "results/tables/prepaymenteffects_bytype_newey_leverage.tex"
* "results/tables/fracpos_IV_mpshocks.tex"
* "results/tables/fracpos_IV_mpshocks_newey.tex"
* "results/tables/rm_interactions_with_IM.tex"
* "results/tables/rm_interactions_with_IM_newey.tex"
* "results/tables/prepaymenteffects_fracpos_LTV_all_liens.tex"
* "results/tables/prepaymenteffects_newey_wmiddleperiod_heterogeneous_reset_r.tex"
* "results/coupon_distribution_by_datem_only_gse.csv"
* "results/tables/prepaymenteffects_fracpos_LTV_onlyGSE.tex"
* "results/coupon_distribution_by_datem_never_delinquent.csv"
* "results/tables/prepaymenteffects_fracpos_LTV_never_delinquent.tex"
* "results/tables/prepaymenteffects_different_thresholds.tex"
* "inputs/gap_mean.dta"
* "results/coupon_level_distribution_by_datem"
* "results/coupon_distribution_by_datem"
* "freq.dta"
* "results/distandhazardinputs_allfirstliens.dta"
* "results/distandhazardinputs_heterogeneous_reset_r.dta"
* "results/distandhazardinputs_only_gse.dta"
* "results/coupon_distribution_by_datem_only_gse"
* "results/distandhazardinputs_never_delinquent.dta"
* "results/coupon_distribution_by_datem_never_delinquent"
* "results/distandhazardinputs_dollarbins.dta"
* "thresholds_dollars.dta"
* "results/figures/rate_time_series"
* "results/figures/share_large_gaps"
* "results/figures/ave_distandhazard"
* "results/figures/ave_distandhazard_v2"
* "results/figures/dist_2000vs2003"
* "results/figures/freq_vs_fracpos"
* "results/figures/freq_vs_fracpos_option2"
* "results/figures/freq_vs_fracpos_option3"
* "results/figures/freq_vs_fracpos_option4"
* "results/figures/freq_vs_fracpos_option5"
* "results/figures/freq_vs_fracpos_option6"
* "results/figures/freq_vs_fracpos_option7"
* "results/figures/freq_vs_fracpos_option8"
* "results/figures/freq_rate_refi"
* "results/figures/freq_casho_refi"
* "results/figures/freq_purch_refi"
* "results/figures/shares_vs_actual_decomp"
* "results/figures/refi_index_mcdash_vs_mba"
* "results/figures/refi_index_corelogic_vs_mba"
* "results/figures/predicted_averatefromstep_vs_actualaverate"
* "results/figures/IMresponsivenessindex"
* "results/figures/ave_distandhazard_allfirstliens"
* "results/figures/freq_vs_fracpos_allfirstliens"
* "results/figures/ave_distandhazard_heterogeneous_reset_r"
* "results/figures/freq_vs_fracpos_heterogeneous_reset_r."
* "results/figures/ave_distandhazard_dollarbins"
* "results/figures/dist_2000vs2003_dollarbins"
* Intermediates:
* "results/ave_distandhazard_heterogeneous_reset_r.dta"
* "results/ave_distandhazard_never_delinquent.dta"
* "results/ave_distandhazard.dta"
* "results/ave_distandhazard_only_gse.dta"
* "inputs/CLTV_national.dta"
* "thresholds_timeseries.dta"
* "results/ave_distandhazard_dollarbins.dta"
* "results/ave_distandhazard_allfirstliens.dta"
* "C:\Users\jvavra0\Dropbox\Coupon Distribution and Macro Outcomes\vavra\results\distandhazardinputs.dta"

**********************************
*Get base directory in macro
global base_dir `c(pwd)'

cap mkdir release
cd release

cap mkdir tables
cd tables
global tables_dir `c(pwd)'
cd ..

cap mkdir figures
cd figures
global figures_dir `c(pwd)'
cd ..
cd ..

**********************************

**********************************

*Get project directory in macro
global project_dir = "${base_dir}"

**********************************

*define a global for the intermediates directory
global intermediates_dir = "${project_dir}/intermediates"

set more off

set scheme david2

program save_chart

	graph save `0', replace
	gr export "`0'.pdf", replace as(pdf)
	graph export "`0'.eps", as(eps) mag(200) orientation(landscape)  replace
	!ps2pdf `0'.eps `0'.pdf
	cap rm `0'.gph
    cap rm `0'.eps

end // to use: e.g. save_chart fig1

local firstyear=1992
local lastyear=2017

use "averate_national.dta", clear
gen year=year(dofm(datem))
local lastmonth=m(2017m4)
drop if year<`firstyear' | year>`lastyear'
*Could start with some kind of simple plot like this if you think the visual point is strong enough, I think it's pretty strong although slightly subtle, basically that the blue line declines when the red line is below the blue line but the blue line doesn't rise when the red line is above the blue line.
line InterestRate MORT datem

twoway (line InterestRate datem,lpattern(dash)) (line MORT datem),  ///
legend(order(1 "Average Outstanding Mortgage Rate" 2 "Current 30 Year FRM") symx(7)) xtitle("") name(rate_time_series, replace)
save_chart ${figures_dir}/rate_time_series
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1
keep MORTGAGE30US
outsheet using mortgage_rate.csv, nonames comma replace

*What does this mean?
*average coupon rate (InterestRate) strongly declines when the current market 30 year interest rate (MORTGAGE30US) is below the current average coupon rate, but the coupon rate is flat when current market rate rises above current average coupon (this also kind of show the path dependence visually
*in that the blue line doesn't decline with the red line after local peaks in the red line.
*I think this is probably the most model free motivating picture, but one can also do similar types of things instead doing stuff with like fracpos or the avegap and show the coupon rate declines when the avegap is positive but doesn't rise when it's negative  

clear
forvalues j=109/456{
append using "gap_dist_stats_national_month`j'.dta" 
drop if gap_mean==.
}
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1
sort datem
preserve
keep gap_mean datem
save "gap_mean.dta", replace
restore
drop datem
outsheet using gap_dist_stats_national.csv, nonames comma replace



clear
forvalues j=109/456{
append using "CLTV_national_month`j'.dta" 
keep if CLTVmean!=.
}
save CLTV_national.dta, replace



clear
forvalues j=109/456{
append using "ratebins_level_national_month`j'.dta" 
}

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1

collapse (sum) refi_ind=prepay_count num=loan_count, by(ratebin datem)
bys datem: egen tot=sum(num)
gen dist_variable=num/tot
gen rateactual=.2*(ratebin-1)
keep dist_variable datem ratebin rateactual
duplicates drop
sort datem rateactual
save "coupon_level_distribution_by_datem.dta", replace
outsheet using "coupon_level_distribution_by_datem.csv", comma replace


********************************************************************************
*analyze prepay shares across time:
********************************************************************************
*produced by mcdash_monthly_refi.do
clear
forvalues j=109/456{
append using "ratebins_national_month`j'.dta" 
}

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-5+.2*gap-0.1

preserve
keep if m(1992m1)==datem
egen tot=sum(loan_count)
gen dist=loan_count/tot
keep gapactual dist loan_count
duplicates drop
outsheet using gapdist_1992m1.csv, nonames comma replace
restore
preserve
keep if m(1997m1)==datem
egen tot=sum(loan_count)
gen dist=loan_count/tot
keep gapactual dist loan_count
duplicates drop
outsheet using gapdist_1997m1.csv, nonames comma replace
restore
preserve
keep if m(2002m1)==datem
egen tot=sum(loan_count)
gen dist=loan_count/tot
keep gapactual dist loan_count
duplicates drop
outsheet using gapdist_2002m1.csv, nonames comma replace
restore
preserve
keep if m(2007m1)==datem
egen tot=sum(loan_count)
gen dist=loan_count/tot
keep gapactual dist loan_count
duplicates drop
outsheet using gapdist_2007m1.csv, nonames comma replace
restore
preserve
keep if m(2012m1)==datem
egen tot=sum(loan_count)
gen dist=loan_count/tot
keep gapactual dist loan_count
duplicates drop
outsheet using gapdist_2012m1.csv, nonames comma replace
restore
preserve
keep if m(2017m1)==datem
egen tot=sum(loan_count)
gen dist=loan_count/tot
keep gapactual dist loan_count
duplicates drop
outsheet using gapdist_2017m1.csv, nonames comma replace
restore

drop if abs(gapactual)>4
preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
gen cummass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

gen freq_prepay_by_sign=hazardcalvo_ave*mass
gen share_prepay_neg=.0020182/(.0109408+.0020182)
*multiplying by the share of prepayment with neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_neg=share_prepay_neg*.2535815
*multiplying by the share of prepayment without neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_pos=(1-share_prepay_neg)*.4087
gen share_refi_neg_gap=numrefi_neg/(numrefi_neg+numrefi_pos)

gen ltp25=1 if gapactual<-0.25
replace ltp25=0 if gapactual>=-0.25
bys ltp25: egen hazard_25=sum(contrib)
bys ltp25: egen mass_25=sum(dist_ave)
replace hazard_25=hazard_25/mass_25
gen freq_prepay_by_sign_25=hazard_25*mass_25
gen share_prepay_lt25=.0014925/(.0014925+.0114666)
gen numrefi_lt25=share_prepay_lt25*.239357
gen numrefi_gt25=(1-share_prepay_lt25)*.395244
gen share_refi_lt25=numrefi_lt25/(numrefi_lt25+numrefi_gt25)


*replace hazardcalvo_ave=.034/100 if gapactual<=0
*replace hazardcalvo_ave=(.034+2.054942)/100 if gapactual>0

sort gapactual

keep gapbin gapactual hazard* dist
duplicates drop
save "ave_distandhazard.dta", replace 

restore

*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "ave_distandhazard.dta", nogen
save "distandhazardinputs.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

preserve
keep dist_variable datem gapactual hazard
duplicates drop
sort datem gapactual
save "coupon_distribution_by_datem.dta", replace
outsheet using "coupon_distribution_by_datem.csv", comma replace
restore


lpoly dist_variable gapactual if datem==m(2000m1), noscatter bwidth(.25) generate(dist_2000m12) at(gapactual)
lpoly dist_variable gapactual if datem==m(2003m1), noscatter bwidth(.25) generate(dist_2003m12) at(gapactual)

sort datem gapactual
twoway (line dist_2000m12 gapactual if gapactual>-3.5 & gapactual<5.5 & datem==m(2000m12)) (line dist_2003m12 gapactual if gapactual>-5.5 & gapactual<5.5 & datem==m(2003m12), lpattern(dash)), ///
xtitle("Gap (in %)") legend(order(1 "Gap Distribution in 2000m12" 2 "Gap Distribution in 2003m12") symx(7)) ytitle("") name(ave_distandhazard, replace)
save_chart ${figures_dir}/dist_2000vs2003



gen mean_tmp=dist_variable*gapactual
gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac50bp_tmp=dist_variable if gapactual>=0.5
gen frac100bp_tmp=dist_variable if gapactual>=1
bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac50bp=sum(frac50bp_tmp)
bys datem: egen frac100bp=sum(frac100bp_tmp)
bys datem: egen meangap=sum(mean_tmp)



forvalues j=1/39{
gen fraction_`j'_tmp=dist_variable if abs(gapactual-(-4.1+`j'*.2))<.0001
bys datem: egen fr_`j'=sum(fraction_`j'_tmp)
drop fraction_`j'_tmp
}


gen fracm100bp_tmp=dist_variable if gapactual<=-1
gen fracm100_50bp_tmp=dist_variable if gapactual>-1 & gapactual<=-0.5
gen fracm50_0bp_tmp=dist_variable if gapactual>-0.5 & gapactual<=0
gen frac0_50bp_tmp=dist_variable if gapactual>0 & gapactual<=0.5
gen frac50_100bp_tmp=dist_variable if gapactual>0.5 & gapactual<=1
gen frac100_150bp_tmp=dist_variable if gapactual>1 & gapactual<=1.5
gen frac150_200bp_tmp=dist_variable if gapactual>1.5 & gapactual<=2
gen frac200_300bp_tmp=dist_variable if gapactual>2 & gapactual<=3
gen frac300bp_tmp=dist_variable if gapactual>3 

bys datem: egen frac_m100bp=sum(fracm100bp_tmp)
bys datem: egen frac_m100_50bp=sum(fracm100_50bp_tmp)
bys datem: egen frac_m50_0bp=sum(fracm50_0bp_tmp)
bys datem: egen frac_0_50bp=sum(frac0_50bp_tmp)
bys datem: egen frac_50_100bp=sum(frac50_100bp_tmp)
bys datem: egen frac_100_150bp=sum(frac100_150bp_tmp)
bys datem: egen frac_150_200bp=sum(frac150_200bp_tmp)
bys datem: egen frac_200_300bp=sum(frac200_300bp_tmp)
bys datem: egen frac_300bp=sum(frac300bp_tmp)

gen refim100bp_tmp=refi_ind if gapactual<=-1
gen refim100_50bp_tmp=refi_ind if gapactual>-1 & gapactual<=-0.5
gen refim50_0bp_tmp=refi_ind if gapactual>-0.5 & gapactual<=0
gen refi0_50bp_tmp=refi_ind if gapactual>0 & gapactual<=0.5
gen refi50_100bp_tmp=refi_ind if gapactual>0.5 & gapactual<=1
gen refi100_150bp_tmp=refi_ind if gapactual>1 & gapactual<=1.5
gen refi150_200bp_tmp=refi_ind if gapactual>1.5 & gapactual<=2
gen refi200_300bp_tmp=refi_ind if gapactual>2 & gapactual<=3
gen refi300bp_tmp=refi_ind if gapactual>3 


gen numm100bp_tmp=num if gapactual<=-1
gen numm100_50bp_tmp=num if gapactual>-1 & gapactual<=-0.5
gen numm50_0bp_tmp=num if gapactual>-0.5 & gapactual<=0
gen num0_50bp_tmp=num if gapactual>0 & gapactual<=0.5
gen num50_100bp_tmp=num if gapactual>0.5 & gapactual<=1
gen num100_150bp_tmp=num if gapactual>1 & gapactual<=1.5
gen num150_200bp_tmp=num if gapactual>1.5 & gapactual<=2
gen num200_300bp_tmp=num if gapactual>2 & gapactual<=3
gen num300bp_tmp=num if gapactual>3 


bys datem: egen refi_m100bp=sum(refim100bp_tmp)
bys datem: egen refi_m100_50bp=sum(refim100_50bp_tmp)
bys datem: egen refi_m50_0bp=sum(refim50_0bp_tmp)
bys datem: egen refi_0_50bp=sum(refi0_50bp_tmp)
bys datem: egen refi_50_100bp=sum(refi50_100bp_tmp)
bys datem: egen refi_100_150bp=sum(refi100_150bp_tmp)
bys datem: egen refi_150_200bp=sum(refi150_200bp_tmp)
bys datem: egen refi_200_300bp=sum(refi200_300bp_tmp)
bys datem: egen refi_300bp=sum(refi300bp_tmp)

bys datem: egen num_m100bp=sum(numm100bp_tmp)
bys datem: egen num_m100_50bp=sum(numm100_50bp_tmp)
bys datem: egen num_m50_0bp=sum(numm50_0bp_tmp)
bys datem: egen num_0_50bp=sum(num0_50bp_tmp)
bys datem: egen num_50_100bp=sum(num50_100bp_tmp)
bys datem: egen num_100_150bp=sum(num100_150bp_tmp)
bys datem: egen num_150_200bp=sum(num150_200bp_tmp)
bys datem: egen num_200_300bp=sum(num200_300bp_tmp)
bys datem: egen num_300bp=sum(num300bp_tmp)




drop *tmp

keep frac* fr_* freq* datem meangap
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)



*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "corelogic_national.dta",  nogen 
merge 1:1 datem using "ARMshare.dta", nogen
merge 1:1 datem using "cpi.dta", nogen
merge 1:1 datem using "unrate.dta", nogen
merge 1:1 datem using "indprod.dta", nogen
merge 1:1 datem using "CLTV_national.dta", nogen
merge 1:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
merge 1:m datem using "averate_national.dta", keepusing(MO) nogen
*merge 1:1 datem using "gap_mean.dta", nogen
sort datem
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
gen dm=MORT-l.MORT
gen dm_3=dm^3
gen dm6=MORT-l6.MORT
gen dm6_3=dm6^3
gen dm6_2=dm6^2
gen dm12=MORT-l12.MORT
gen dm12_3=dm12^3
gen dm3=MORT-l3.MORT
gen dm3_3=dm3^3
gen dm3_2=dm3^2

*quadratic in dm3 finds some effects

gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)


preserve
keep freq fracpos datem
outsheet using data_fracpos_freq.csv, comma replace
restore

preserve
gen f_freq=f.freq
keep f_freq datem
duplicates drop
save freq.dta, replace
keep f_freq
outsheet using freq.csv, comma replace nonames
restore

preserve
drop if f.freq==.

tw || line f.freq datem, yaxis(1) lpattern(shortdash)  || line fracpos datem, yaxis(2) || , yscale(range(0 6) axis(1)) ylabel(0(0.5)1, axis(2))  yscale(range(0 1.38) axis(2)) ///
 legend(order(1 "Prepayment Rate (in %)" 2 "Fraction w/ Positive Rate Gap (0-1)"))    xtitle("") ytitle("Monthly Fraction Prepaying (in %)") ytitle("Fraction of Loans with Positive Gap", axis(2))  text(4.7 555 "{&rho}=0.53", place(e))
 *ylabel(#6,axis(2))
save_chart ${figures_dir}/freq_vs_fracpos

restore

gen prepay=f.freq/100
gen annualprepay=1-(1-prepay)^12
sum annualprepay if year==2003
*https://www.federalreserve.gov/releases/z1/20191212/z1.pdf L.217 residential mortggaes 11072.6+1565.1
gen currentincome_flow_2003=r(mean)*(11072.6+1565.1)*.01
gen PV_2003=currentincome_flow_2003
forvalues j=1/29{
replace PV_2003=PV_2003+currentincome_flow_2003/(1+.15)^`j'
}

sum annualprepay if year==2000
gen currentincome_flow_2000=r(mean)*(11072.6+1565.1)*.01
gen PV_2000=currentincome_flow_2000
forvalues j=1/29{
replace PV_2000=PV_2000+currentincome_flow_2000/(1+.15)^`j'
}

sum PV*


sort datem
   

save ${intermediates_dir}/prepaymenteffects_data.dta, replace 
*Now do same things but decomposed into types of prepayment:
*crism:
merge 1:1 datem using "national_refi_panel.dta", nogen
rename datem mdate
merge 1:1 mdate using "ts_fr_by_loan_purpose_v2.dta", nogen
rename mdate datem

*start 1 year later since initial LLM coverage not good
drop if datem<m(1993m1)
drop if datem>`lastmonth'+1


gen total=numloanscash+numloansno_c+numloanspurchase+numloansrefi_u+numloansno_info
gen frac_cash=numloanscash/(numloanscash+numloansno_c)
replace numloanscash=numloanscash+numloansrefi_u*frac_cash
replace numloansno_c=numloansno_c+numloansrefi_u*(1-frac_cash)
gen share_purch=numloanspurchase/total
gen share_rate=numloansno_c/total
gen share_cashout=numloanscash/total



*using mcdash and corelogic info but no crism info yet
gen rate_fromshare=freq*share_rate
gen casho_fromshare=freq*share_cashout
gen purch_fromshare=freq*share_purch

*use crism shares when available:
gen freq_rate=rate_refi_prop_bw*100
gen freq_casho=casho_af_refi_share_bw*refi_prop*100
gen freq_purch=freq-freq_rate-freq_casho

gen freq_rate_crism=freq_rate
gen freq_casho_crism=freq_casho
gen freq_purch_crism=freq_purch

*compare results infered from share with those directly from crism:

twoway (line freq_rate datem) (line rate_fromshare datem,lpattern(dash)),  ///
legend(order(2 "Rate Propensity From Origination" 1 "Actual Rate Propensity from CRISM") symx(7)) xtitle("") name(freq_rate_refi, replace)
save_chart ${figures_dir}/freq_rate_refi

twoway (line freq_casho datem) (line casho_fromshare datem,lpattern(dash)),  ///
legend(order(2 "Cashout Propensity From Origination" 1 "Actual Cashout Propensity from CRISM") symx(7)) xtitle("") name(freq_casho_refi, replace)
save_chart ${figures_dir}/freq_casho_refi

twoway (line freq_purch datem) (line purch_fromshare datem,lpattern(dash)),  ///
legend(order(2 "Purchase Propensity From Origination" 1 "Actual Purchase Propensity from CRISM") symx(7)) xtitle("") name(freq_purch_refi, replace)
save_chart ${figures_dir}/freq_purch_refi


twoway (line freq_rate datem) (line rate_fromshare datem,lpattern(dash)),  ///
legend(order(2 "Predicted from Orig Share" 1 "Actual") symx(7)) xtitle("") title(Rate Refi) name(freq_rate_refi, replace)

twoway (line freq_casho datem) (line casho_fromshare datem,lpattern(dash)),  ///
legend(order(2 "Predicted from Orig Share" 1 "Actual") symx(7)) xtitle("") title(Cash Out Refi) name(freq_casho_refi, replace)

twoway (line freq_purch datem) (line purch_fromshare datem,lpattern(dash)),  ///
legend(order(2 "Predicted from Orig Share" 1 "Actual") symx(7)) xtitle("") title(Purchase Prepayment) name(freq_purch_refi, replace)

graph combine freq_rate_refi freq_casho_refi freq_purch_refi
save_chart ${figures_dir}/shares_vs_actual_decomp

*assume that this imputation works, then use it when crism not available but otherwise use crism:
replace freq_rate=rate_fromshare if freq_rate==.
replace freq_casho=casho_fromshare if freq_casho==.
replace freq_purch=purch_fromshare if freq_purch==.

sort datem

gen tot_refi=freq_rate+freq_casho
merge 1:1 datem using mba_refi_index_monthly.dta, nogen keep(1 3)
gen date=datem
merge 1:1 date using "prepayment_ts_all_agg.dta", nogen keep(1 3)
drop date
sort datem
sum f.tot_refi if datem==m(2005m4)
gen tot_refi_index=100*tot_refi/r(mean)
sum mbamr if datem==m(2005m4)
replace mbamr=100*mbamr/r(mean)
replace refi_shr=refi_shr*(share_rate+share_cashout)
sum f.refi_shr if datem==m(2005m4)
gen tot_refi_index_corelogic=100*refi_shr/r(mean)
line f.tot_refi_index mbamr datem

twoway (line f.tot_refi_index datem) (line mbamr datem,lpattern(dash)),  ///
legend(order(1 "Refi (Originations) Index" "Derived from Loan Data" "(2005=100)" 2 "Refi (Applications) Index" "From Mortgage Bankers Association" "(2005=100)") symx(7)) xtitle("") name(refi_index_mcdash_vs_mba, replace)
save_chart ${figures_dir}/refi_index_mcdash_vs_mba

save totrefi_data.dta, replace

	
********************************************************************************
********************************************************************************
*Now look at results looking at average outstanding coupon rates as the outcome instead of refinancing rates
********************************************************************************
********************************************************************************

local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)




use "distandhazardinputs.dta", replace

collapse (sum) refi_ind num, by(gapbin gapactual datem)

merge m:1 datem using "corelogic_national.dta",  nogen 
merge m:1 datem using "cpi.dta", nogen
merge m:1 datem using "CLTV_national.dta", nogen
merge m:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
tsset gapbin datem
gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1
drop if CLTVmean==.
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)


*these come from earlier regressions of f.freq on fracpos, potentially with other interactions

gen hazard_flat=.0140506

gen hazard_step=.000347 if gapactual<=0
replace hazard_step=.000347+.0205494 if gapactual>0

gen hazard_step_adjusted=max(-.0008628+hpgrowth_1yr*.0093075+post2008ind*.0006541+ind2003*-.0371478,0)
*don't want zero bound on hazard to affect estimated average freq:
gen negadj=min(-.0008628+hpgrowth_1yr*.0093075+post2008ind*.0006541+ind2003*-.0371478,0)
replace hazard_step_adjusted=max(hazard_step_adjusted+.023738+.0699452*ind2003-.0083693*post2008ind+.0109892*hpgrowth_1yr+negadj,0) if gapactual>0


gen hazard_variable=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

gen pos=dist_variable if gapactual>0
bys datem: egen fracpos=sum(pos)


*gen freq_contrib_tmp=hazard_variable*dist_variable
*gen freq_contrib_calvo_tmp=hazardcalvo_ave*dist_variable
*gen freq_contrib_nostepcalvo_tmp=hazard_nostepcalvo_ave*dist_variable
*bys datem: egen freq=sum(freq_contrib_tmp)
*bys datem: egen freq_nostepcalvo=sum(freq_contrib_nostepcalvo_tmp)
*bys datem: egen freq_hazardcalvo=sum(freq_contrib_calvo_tmp)

gen avegap_tmp=dist_variable*gapactual
bys datem: egen avegap=sum(avegap_tmp)

gen d_averate_tmp=-gapactual*hazard_variable*dist_variable
gen d_averate_flat_tmp=-gapactual*hazard_flat*dist_variable
gen d_averate_step_tmp=-gapactual*hazard_step*dist_variable
gen d_averate_step_adjusted_tmp=-gapactual*hazard_step_adjusted*dist_variable
bys datem: egen d_averate=sum(d_averate_tmp)
bys datem: egen d_averate_flat=sum(d_averate_flat_tmp)
bys datem: egen d_averate_step=sum(d_averate_step_tmp)
bys datem: egen d_averate_step_adjusted=sum(d_averate_step_adjusted_tmp)
drop *tmp
*line d_averate* datem

*would maybe just show this:
*line d_averate d_averate_step datem

replace d_averate=d_averate*100
replace d_averate_step=d_averate_step*100

replace d_averate=d_averate/100
replace d_averate_step=d_averate_step/100

gen IM_tmp=hazard_variable*dist_variable
gen IM_flat_tmp=hazard_flat*dist_variable
gen IM_step_tmp=hazard_step*dist_variable
gen IM_step_adjusted_tmp=hazard_step_adjusted*dist_variable
bys datem: egen IM=sum(IM_tmp)
bys datem: egen IM_flat=sum(IM_flat_tmp)
bys datem: egen IM_step=sum(IM_step_tmp)
bys datem: egen IM_step_adjusted=sum(IM_step_adjusted_tmp)
drop *tmp

keep datem IM* d_averate* fracpos ind2003 post2008ind hp* avegap ff4
duplicates drop
tsset datem
replace IM=l.IM if datem==m(1999m8) | datem==m(1997m2)
replace IM_flat=l.IM_flat if datem==m(1999m8) | datem==m(1997m2)
replace IM_step=l.IM_step if datem==m(1999m8) | datem==m(1997m2)
replace IM_step_adjusted=l.IM_step_adjusted if datem==m(1999m8) | datem==m(1997m2)

*drop if _n==_N

*line IM* datem

*would probably just show this, just focusing on the pure fracpos effects and not benchmarking them vs. other alternative models like the non-parametric hazard like the previous figure implicitly does:
*line IM_step datem

*merge 1:1 datem using "averate_national.dta", keep(3) nogen


merge 1:1 datem using "averate_national.dta", keepusing(MO InterestRate)
merge 1:1 datem using "CLTV_national.dta", nogen

save rm_interactions_data, replace
	
*********************************************************************************
*********************************************************************************
*robustness to including all mortgages rather than just FRM:

********************************************************************************
*analyze prepay shares across time:
********************************************************************************
clear

local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)

forvalues j=109/456{
append using "ratebins_national_month`j'_includeallfirstliens.dta" 
}



gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-5+.2*gap-0.1
drop if abs(gapactual)>4

preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

*replace hazardcalvo_ave=.034/100 if gapactual<=0
*replace hazardcalvo_ave=(.034+2.054942)/100 if gapactual>0

sort gapactual

keep gapbin gapactual hazard* dist
duplicates drop
save "ave_distandhazard_allfirstliens.dta", replace 
restore

*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "ave_distandhazard_allfirstliens.dta", nogen
save "distandhazardinputs_allfirstliens.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac50bp_tmp=dist_variable if gapactual>=0.5
gen frac100bp_tmp=dist_variable if gapactual>=1
bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac50bp=sum(frac50bp_tmp)
bys datem: egen frac100bp=sum(frac100bp_tmp)

gen fracm100bp_tmp=dist_variable if gapactual<=-1
gen fracm100_50bp_tmp=dist_variable if gapactual>-1 & gapactual<=-0.5
gen fracm50_0bp_tmp=dist_variable if gapactual>-0.5 & gapactual<=0
gen frac0_50bp_tmp=dist_variable if gapactual>0 & gapactual<=0.5
gen frac50_100bp_tmp=dist_variable if gapactual>0.5 & gapactual<=1
gen frac100_150bp_tmp=dist_variable if gapactual>1 & gapactual<=1.5
gen frac150_200bp_tmp=dist_variable if gapactual>1.5 & gapactual<=2
gen frac200_300bp_tmp=dist_variable if gapactual>2 & gapactual<=3
gen frac300bp_tmp=dist_variable if gapactual>3 

bys datem: egen frac_m100bp=sum(fracm100bp_tmp)
bys datem: egen frac_m100_50bp=sum(fracm100_50bp_tmp)
bys datem: egen frac_m50_0bp=sum(fracm50_0bp_tmp)
bys datem: egen frac_0_50bp=sum(frac0_50bp_tmp)
bys datem: egen frac_50_100bp=sum(frac50_100bp_tmp)
bys datem: egen frac_100_150bp=sum(frac100_150bp_tmp)
bys datem: egen frac_150_200bp=sum(frac150_200bp_tmp)
bys datem: egen frac_200_300bp=sum(frac200_300bp_tmp)
bys datem: egen frac_300bp=sum(frac300bp_tmp)




drop *tmp

keep frac* freq* datem 
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)



*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "corelogic_national.dta",  nogen 
merge 1:1 datem using "ARMshare.dta", nogen
merge 1:1 datem using "cpi.dta", nogen
merge 1:1 datem using "unrate.dta", nogen
merge 1:1 datem using "indprod.dta", nogen
merge 1:1 datem using "CLTV_national.dta", nogen
merge 1:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
merge 1:m datem using "averate_national.dta", keepusing(MO) nogen
sort datem
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)

*Note, below when doing d_averate results will calculate CE formula.  In a calvo/step Calvo world with step at 0, this will be equal to IM which will just be the frequency of adjustment
*This could be calculated most easily by just plotting predicted freq from the below regressions
*However, using those adjustments to match the predicted values from those linear regressions can sometimes results in a negative implied adjustment hazard, which doesn't make economic sense
*So if you do an additional restriction to match as closely the predicted values from the linear predictions of frequency using a step calvo with an additional restriction that H>=0, then this will give
*a slightly different series.  So that's why I do it below. 
	   
 
 save prepayment_effects_all_liens, replace
	
*********************************************************************************
*********************************************************************************
*robustness to heterogeneous reset target:

*how many can construct gaps for?
clear
local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)

gen datem=.
forvalues j=109/456{
append using "count_predictedr_month`j'.dta" 
replace datem=`j' if datem==.
}
replace datem=datem+239
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1

gen nopredicted_either=InterestRate-InterestRate_forgap2
gen nopredicted_full=InterestRate-InterestRate_pred3
gen nopredicted_credit=InterestRate-InterestRate_pred
egen total_nopredicted_either=sum(nopredicted_either)
egen total_nopredicted_full=sum(nopredicted_full)
egen total_nopredicted_credit=sum(nopredicted_credit)
egen total_obs=sum(InterestRate)
gen share_nopredicted_either=total_nopredicted_either/total_obs
gen share_nopredicted_full=total_nopredicted_full/total_obs
gen share_nopredicted_credit=total_nopredicted_credit/total_obs

gen share_nopredicted_either_bymonth=1-InterestRate_forgap2/InterestRate

********************************************************************************
*analyze prepay shares across time:
********************************************************************************
clear

local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)


forvalues j=109/456{
append using "ratebins_national_month`j'_heterogeneous_reset_r.dta" 
}

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-5+.2*gap-0.1
drop if abs(gapactual)>4
preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

*replace hazardcalvo_ave=.034/100 if gapactual<=0
*replace hazardcalvo_ave=(.034+2.054942)/100 if gapactual>0

sort gapactual

keep gapbin gapactual hazard* dist
duplicates drop
save "results/ave_distandhazard_heterogeneous_reset_r.dta", replace 
restore

*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "ave_distandhazard_heterogeneous_reset_r.dta", nogen
save "distandhazardinputs_heterogeneous_reset_r.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac50bp_tmp=dist_variable if gapactual>=0.5
gen frac100bp_tmp=dist_variable if gapactual>=1
bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac50bp=sum(frac50bp_tmp)
bys datem: egen frac100bp=sum(frac100bp_tmp)

gen fracm100bp_tmp=dist_variable if gapactual<=-1
gen fracm100_50bp_tmp=dist_variable if gapactual>-1 & gapactual<=-0.5
gen fracm50_0bp_tmp=dist_variable if gapactual>-0.5 & gapactual<=0
gen frac0_50bp_tmp=dist_variable if gapactual>0 & gapactual<=0.5
gen frac50_100bp_tmp=dist_variable if gapactual>0.5 & gapactual<=1
gen frac100_150bp_tmp=dist_variable if gapactual>1 & gapactual<=1.5
gen frac150_200bp_tmp=dist_variable if gapactual>1.5 & gapactual<=2
gen frac200_300bp_tmp=dist_variable if gapactual>2 & gapactual<=3
gen frac300bp_tmp=dist_variable if gapactual>3 

bys datem: egen frac_m100bp=sum(fracm100bp_tmp)
bys datem: egen frac_m100_50bp=sum(fracm100_50bp_tmp)
bys datem: egen frac_m50_0bp=sum(fracm50_0bp_tmp)
bys datem: egen frac_0_50bp=sum(frac0_50bp_tmp)
bys datem: egen frac_50_100bp=sum(frac50_100bp_tmp)
bys datem: egen frac_100_150bp=sum(frac100_150bp_tmp)
bys datem: egen frac_150_200bp=sum(frac150_200bp_tmp)
bys datem: egen frac_200_300bp=sum(frac200_300bp_tmp)
bys datem: egen frac_300bp=sum(frac300bp_tmp)




drop *tmp

keep frac* freq* datem 
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)



*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "corelogic_national.dta",  nogen 
merge 1:1 datem using "cpi.dta", nogen
merge 1:1 datem using "CLTV_national.dta", nogen
merge 1:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
sort datem
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)

*Note, below when doing d_averate results will calculate CE formula.  In a calvo/step Calvo world with step at 0, this will be equal to IM which will just be the frequency of adjustment
*This could be calculated most easily by just plotting predicted freq from the below regressions
*However, using those adjustments to match the predicted values from those linear regressions can sometimes results in a negative implied adjustment hazard, which doesn't make economic sense
*So if you do an additional restriction to match as closely the predicted values from the linear predictions of frequency using a step calvo with an additional restriction that H>=0, then this will give
*a slightly different series.  So that's why I do it below. 


save prepayment_effects_het_reset, replace
	   
*more robustness
*******************************************************************************
*Only GSE
*******************************************************************************

clear
forvalues j=109/456{
append using "ratebins_national_month`j'_only_gse.dta" 
}
local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-5+.2*gap-0.1


drop if abs(gapactual)>4
preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
gen cummass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

gen freq_prepay_by_sign=hazardcalvo_ave*mass
gen share_prepay_neg=.0020182/(.0109408+.0020182)
*multiplying by the share of prepayment with neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_neg=share_prepay_neg*.2535815
*multiplying by the share of prepayment without neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_pos=(1-share_prepay_neg)*.4087
gen share_refi_neg_gap=numrefi_neg/(numrefi_neg+numrefi_pos)

gen ltp25=1 if gapactual<-0.25
replace ltp25=0 if gapactual>=-0.25
bys ltp25: egen hazard_25=sum(contrib)
bys ltp25: egen mass_25=sum(dist_ave)
replace hazard_25=hazard_25/mass_25
gen freq_prepay_by_sign_25=hazard_25*mass_25
gen share_prepay_lt25=.0014925/(.0014925+.0114666)
gen numrefi_lt25=share_prepay_lt25*.239357
gen numrefi_gt25=(1-share_prepay_lt25)*.395244
gen share_refi_lt25=numrefi_lt25/(numrefi_lt25+numrefi_gt25)


*replace hazardcalvo_ave=.034/100 if gapactual<=0
*replace hazardcalvo_ave=(.034+2.054942)/100 if gapactual>0

sort gapactual

keep gapbin gapactual hazard* dist
duplicates drop
save "results/ave_distandhazard_only_gse.dta", replace 

replace gapactual=0 if abs(gapactual-(-0.1))<.001
replace gapactual=0.001 if abs(gapactual-(0.1))<.001
replace hazardcalvo=hazardcalvo+.004 if gapactual>0



restore

*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "ave_distandhazard_only_gse.dta", nogen
save "distandhazardinputs_only_gse.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

preserve
keep dist_variable datem gapactual hazard
duplicates drop
sort datem gapactual
save "coupon_distribution_by_datem_only_gse.dta", replace
outsheet using "coupon_distribution_by_datem_only_gse.csv", comma replace
restore


lpoly dist_variable gapactual if datem==m(2000m1), noscatter bwidth(.25) generate(dist_2000m12) at(gapactual)
lpoly dist_variable gapactual if datem==m(2003m1), noscatter bwidth(.25) generate(dist_2003m12) at(gapactual)



gen mean_tmp=dist_variable*gapactual
gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac50bp_tmp=dist_variable if gapactual>=0.5
gen frac100bp_tmp=dist_variable if gapactual>=1
bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac50bp=sum(frac50bp_tmp)
bys datem: egen frac100bp=sum(frac100bp_tmp)
bys datem: egen meangap=sum(mean_tmp)



forvalues j=1/39{
gen fraction_`j'_tmp=dist_variable if abs(gapactual-(-4.1+`j'*.2))<.0001
bys datem: egen fr_`j'=sum(fraction_`j'_tmp)
drop fraction_`j'_tmp
}


gen fracm100bp_tmp=dist_variable if gapactual<=-1
gen fracm100_50bp_tmp=dist_variable if gapactual>-1 & gapactual<=-0.5
gen fracm50_0bp_tmp=dist_variable if gapactual>-0.5 & gapactual<=0
gen frac0_50bp_tmp=dist_variable if gapactual>0 & gapactual<=0.5
gen frac50_100bp_tmp=dist_variable if gapactual>0.5 & gapactual<=1
gen frac100_150bp_tmp=dist_variable if gapactual>1 & gapactual<=1.5
gen frac150_200bp_tmp=dist_variable if gapactual>1.5 & gapactual<=2
gen frac200_300bp_tmp=dist_variable if gapactual>2 & gapactual<=3
gen frac300bp_tmp=dist_variable if gapactual>3 

bys datem: egen frac_m100bp=sum(fracm100bp_tmp)
bys datem: egen frac_m100_50bp=sum(fracm100_50bp_tmp)
bys datem: egen frac_m50_0bp=sum(fracm50_0bp_tmp)
bys datem: egen frac_0_50bp=sum(frac0_50bp_tmp)
bys datem: egen frac_50_100bp=sum(frac50_100bp_tmp)
bys datem: egen frac_100_150bp=sum(frac100_150bp_tmp)
bys datem: egen frac_150_200bp=sum(frac150_200bp_tmp)
bys datem: egen frac_200_300bp=sum(frac200_300bp_tmp)
bys datem: egen frac_300bp=sum(frac300bp_tmp)





drop *tmp

keep frac* fr_* freq* datem meangap
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)




*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "corelogic_national.dta",  nogen 
merge 1:1 datem using "ARMshare.dta", nogen
merge 1:1 datem using "cpi.dta", nogen
merge 1:1 datem using "unrate.dta", nogen
merge 1:1 datem using "indprod.dta", nogen
merge 1:1 datem using "CLTV_national.dta", nogen
merge 1:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
merge 1:m datem using "averate_national.dta", keepusing(MO) nogen
*merge 1:1 datem using "gap_mean.dta", nogen
sort datem
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
gen dm=MORT-l.MORT
gen dm_3=dm^3
gen dm6=MORT-l6.MORT
gen dm6_3=dm6^3
gen dm6_2=dm6^2
gen dm12=MORT-l12.MORT
gen dm12_3=dm12^3
gen dm3=MORT-l3.MORT
gen dm3_3=dm3^3
gen dm3_2=dm3^2

*quadratic in dm3 finds some effects

gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)

*Note, below when doing d_averate results will calculate CE formula.  In a calvo/step Calvo world with step at 0, this will be equal to IM which will just be the frequency of adjustment
*This could be calculated most easily by just plotting predicted freq from the below regressions
*However, using those adjustments to match the predicted values from those linear regressions can sometimes results in a negative implied adjustment hazard, which doesn't make economic sense
*So if you do an additional restriction to match as closely the predicted values from the linear predictions of frequency using a step calvo with an additional restriction that H>=0, then this will give
*a slightly different series.  So that's why I do it below. 

*drop if f.freq==.

save prepayment_effects_only_gse, replace
	   
*******************************************************************************	   
*No GSE*
*******************************************************************************

clear
forvalues j=109/456{
append using "inputs/ratebins_national_month`j'_no_gse.dta" 
}

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-5+.2*gap-0.1


drop if abs(gapactual)>4
preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
gen cummass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

gen freq_prepay_by_sign=hazardcalvo_ave*mass
gen share_prepay_neg=.0020182/(.0109408+.0020182)
*multiplying by the share of prepayment with neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_neg=share_prepay_neg*.2535815
*multiplying by the share of prepayment without neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_pos=(1-share_prepay_neg)*.4087
gen share_refi_neg_gap=numrefi_neg/(numrefi_neg+numrefi_pos)

gen ltp25=1 if gapactual<-0.25
replace ltp25=0 if gapactual>=-0.25
bys ltp25: egen hazard_25=sum(contrib)
bys ltp25: egen mass_25=sum(dist_ave)
replace hazard_25=hazard_25/mass_25
gen freq_prepay_by_sign_25=hazard_25*mass_25
gen share_prepay_lt25=.0014925/(.0014925+.0114666)
gen numrefi_lt25=share_prepay_lt25*.239357
gen numrefi_gt25=(1-share_prepay_lt25)*.395244
gen share_refi_lt25=numrefi_lt25/(numrefi_lt25+numrefi_gt25)


*replace hazardcalvo_ave=.034/100 if gapactual<=0
*replace hazardcalvo_ave=(.034+2.054942)/100 if gapactual>0

sort gapactual


line hazard_ave hazardcalvo dist gapactual if gapactual>-2 & gapactual<3
keep gapbin gapactual hazard* dist
duplicates drop
save "results/ave_distandhazard_no_gse.dta", replace 

replace gapactual=0 if abs(gapactual-(-0.1))<.001
replace gapactual=0.001 if abs(gapactual-(0.1))<.001
replace hazardcalvo=hazardcalvo+.004 if gapactual>0



restore

*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "results/ave_distandhazard_no_gse.dta", nogen
save "results/distandhazardinputs_no_gse.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

preserve
keep dist_variable datem gapactual hazard
duplicates drop
sort datem gapactual
save "results/coupon_distribution_by_datem_no_gse.dta", replace
outsheet using "results/coupon_distribution_by_datem_no_gse.csv", comma replace
restore


lpoly dist_variable gapactual if datem==m(2000m1), noscatter bwidth(.25) generate(dist_2000m12) at(gapactual)
lpoly dist_variable gapactual if datem==m(2003m1), noscatter bwidth(.25) generate(dist_2003m12) at(gapactual)





gen mean_tmp=dist_variable*gapactual
gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac50bp_tmp=dist_variable if gapactual>=0.5
gen frac100bp_tmp=dist_variable if gapactual>=1
bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac50bp=sum(frac50bp_tmp)
bys datem: egen frac100bp=sum(frac100bp_tmp)
bys datem: egen meangap=sum(mean_tmp)



forvalues j=1/39{
gen fraction_`j'_tmp=dist_variable if abs(gapactual-(-4.1+`j'*.2))<.0001
bys datem: egen fr_`j'=sum(fraction_`j'_tmp)
drop fraction_`j'_tmp
}


gen fracm100bp_tmp=dist_variable if gapactual<=-1
gen fracm100_50bp_tmp=dist_variable if gapactual>-1 & gapactual<=-0.5
gen fracm50_0bp_tmp=dist_variable if gapactual>-0.5 & gapactual<=0
gen frac0_50bp_tmp=dist_variable if gapactual>0 & gapactual<=0.5
gen frac50_100bp_tmp=dist_variable if gapactual>0.5 & gapactual<=1
gen frac100_150bp_tmp=dist_variable if gapactual>1 & gapactual<=1.5
gen frac150_200bp_tmp=dist_variable if gapactual>1.5 & gapactual<=2
gen frac200_300bp_tmp=dist_variable if gapactual>2 & gapactual<=3
gen frac300bp_tmp=dist_variable if gapactual>3 

bys datem: egen frac_m100bp=sum(fracm100bp_tmp)
bys datem: egen frac_m100_50bp=sum(fracm100_50bp_tmp)
bys datem: egen frac_m50_0bp=sum(fracm50_0bp_tmp)
bys datem: egen frac_0_50bp=sum(frac0_50bp_tmp)
bys datem: egen frac_50_100bp=sum(frac50_100bp_tmp)
bys datem: egen frac_100_150bp=sum(frac100_150bp_tmp)
bys datem: egen frac_150_200bp=sum(frac150_200bp_tmp)
bys datem: egen frac_200_300bp=sum(frac200_300bp_tmp)
bys datem: egen frac_300bp=sum(frac300bp_tmp)





drop *tmp

keep frac* fr_* freq* datem meangap
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)



*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "inputs/corelogic_national.dta",  nogen 
merge 1:1 datem using "inputs/ARMshare.dta", nogen
merge 1:1 datem using "inputs/cpi.dta", nogen
merge 1:1 datem using "inputs/CLTV_national.dta", nogen
merge 1:1 datem using "inputs/mp_shocks_data.dta", nogen keepusing(ff4_tc)
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
sort datem
gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)

*Note, below when doing d_averate results will calculate CE formula.  In a calvo/step Calvo world with step at 0, this will be equal to IM which will just be the frequency of adjustment
*This could be calculated most easily by just plotting predicted freq from the below regressions
*However, using those adjustments to match the predicted values from those linear regressions can sometimes results in a negative implied adjustment hazard, which doesn't make economic sense
*So if you do an additional restriction to match as closely the predicted values from the linear predictions of frequency using a step calvo with an additional restriction that H>=0, then this will give
*a slightly different series.  So that's why I do it below. 

save prepayment_effects_no_gse, replace

*******************************************************************************	   
*Never delinquent*
*******************************************************************************

clear
forvalues j=109/456{
append using "ratebins_national_month`j'_never_delinquent.dta" 
}
local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-5+.2*gap-0.1


drop if abs(gapactual)>4
preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
gen cummass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

gen freq_prepay_by_sign=hazardcalvo_ave*mass
gen share_prepay_neg=.0020182/(.0109408+.0020182)
*multiplying by the share of prepayment with neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_neg=share_prepay_neg*.2535815
*multiplying by the share of prepayment without neg gaps in crism that is refi (calculated in individual_prepay_regs_by_type.do)
gen numrefi_pos=(1-share_prepay_neg)*.4087
gen share_refi_neg_gap=numrefi_neg/(numrefi_neg+numrefi_pos)

gen ltp25=1 if gapactual<-0.25
replace ltp25=0 if gapactual>=-0.25
bys ltp25: egen hazard_25=sum(contrib)
bys ltp25: egen mass_25=sum(dist_ave)
replace hazard_25=hazard_25/mass_25
gen freq_prepay_by_sign_25=hazard_25*mass_25
gen share_prepay_lt25=.0014925/(.0014925+.0114666)
gen numrefi_lt25=share_prepay_lt25*.239357
gen numrefi_gt25=(1-share_prepay_lt25)*.395244
gen share_refi_lt25=numrefi_lt25/(numrefi_lt25+numrefi_gt25)


sort gapactual



line hazard_ave hazardcalvo dist gapactual if gapactual>-2 & gapactual<3
keep gapbin gapactual hazard* dist
duplicates drop
save "ave_distandhazard_never_delinquent.dta", replace 


restore

*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "ave_distandhazard_never_delinquent.dta", nogen
save "distandhazardinputs_never_delinquent.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot

preserve
keep dist_variable datem gapactual hazard
duplicates drop
sort datem gapactual
save "coupon_distribution_by_datem_never_delinquent.dta", replace
outsheet using "coupon_distribution_by_datem_never_delinquent.csv", comma replace
restore


lpoly dist_variable gapactual if datem==m(2000m1), noscatter bwidth(.25) generate(dist_2000m12) at(gapactual)
lpoly dist_variable gapactual if datem==m(2003m1), noscatter bwidth(.25) generate(dist_2003m12) at(gapactual)





gen mean_tmp=dist_variable*gapactual
gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac50bp_tmp=dist_variable if gapactual>=0.5
gen frac100bp_tmp=dist_variable if gapactual>=1
bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac50bp=sum(frac50bp_tmp)
bys datem: egen frac100bp=sum(frac100bp_tmp)
bys datem: egen meangap=sum(mean_tmp)



forvalues j=1/39{
gen fraction_`j'_tmp=dist_variable if abs(gapactual-(-4.1+`j'*.2))<.0001
bys datem: egen fr_`j'=sum(fraction_`j'_tmp)
drop fraction_`j'_tmp
}


gen fracm100bp_tmp=dist_variable if gapactual<=-1
gen fracm100_50bp_tmp=dist_variable if gapactual>-1 & gapactual<=-0.5
gen fracm50_0bp_tmp=dist_variable if gapactual>-0.5 & gapactual<=0
gen frac0_50bp_tmp=dist_variable if gapactual>0 & gapactual<=0.5
gen frac50_100bp_tmp=dist_variable if gapactual>0.5 & gapactual<=1
gen frac100_150bp_tmp=dist_variable if gapactual>1 & gapactual<=1.5
gen frac150_200bp_tmp=dist_variable if gapactual>1.5 & gapactual<=2
gen frac200_300bp_tmp=dist_variable if gapactual>2 & gapactual<=3
gen frac300bp_tmp=dist_variable if gapactual>3 

bys datem: egen frac_m100bp=sum(fracm100bp_tmp)
bys datem: egen frac_m100_50bp=sum(fracm100_50bp_tmp)
bys datem: egen frac_m50_0bp=sum(fracm50_0bp_tmp)
bys datem: egen frac_0_50bp=sum(frac0_50bp_tmp)
bys datem: egen frac_50_100bp=sum(frac50_100bp_tmp)
bys datem: egen frac_100_150bp=sum(frac100_150bp_tmp)
bys datem: egen frac_150_200bp=sum(frac150_200bp_tmp)
bys datem: egen frac_200_300bp=sum(frac200_300bp_tmp)
bys datem: egen frac_300bp=sum(frac300bp_tmp)





drop *tmp

keep frac* fr_* freq* datem meangap
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)




*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "corelogic_national.dta",  nogen 
merge 1:1 datem using "ARMshare.dta", nogen
merge 1:1 datem using "cpi.dta", nogen
merge 1:1 datem using "unrate.dta", nogen
merge 1:1 datem using "indprod.dta", nogen
merge 1:1 datem using "CLTV_national.dta", nogen
merge 1:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
merge 1:m datem using "averate_national.dta", keepusing(MO) nogen
*merge 1:1 datem using "gap_mean.dta", nogen
sort datem
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
gen dm=MORT-l.MORT
gen dm_3=dm^3
gen dm6=MORT-l6.MORT
gen dm6_3=dm6^3
gen dm6_2=dm6^2
gen dm12=MORT-l12.MORT
gen dm12_3=dm12^3
gen dm3=MORT-l3.MORT
gen dm3_3=dm3^3
gen dm3_2=dm3^2

*quadratic in dm3 finds some effects

gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)

*Note, below when doing d_averate results will calculate CE formula.  In a calvo/step Calvo world with step at 0, this will be equal to IM which will just be the frequency of adjustment
*This could be calculated most easily by just plotting predicted freq from the below regressions
*However, using those adjustments to match the predicted values from those linear regressions can sometimes results in a negative implied adjustment hazard, which doesn't make economic sense
*So if you do an additional restriction to match as closely the predicted values from the linear predictions of frequency using a step calvo with an additional restriction that H>=0, then this will give
*a slightly different series.  So that's why I do it below. 

*drop if f.freq==.

save prepayment_effects_never_delinquent, replace
********************************************************************************
*analyze prepay shares across time:
********************************************************************************
clear

local firstyear=1992
local lastyear=2017
local lastmonth=m(2017m4)

forvalues j=109/456{
append using "ratebins_dollars_national_month`j'.dta" 
}

gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
drop if datem>`lastmonth'+1


*add these lines if want to balance weight (note need to adjust lines 166 when using crism data to either be bw or not bw):
*replace prepay_count=prepay_bal
*replace loan_count=prin_bal_amt

*First compute overall average distribution and hazard:
*Note -.1 so computing middle of gap bin, since compute bins based on right boundary
gen gapactual=-10000+200*gap-0.1
drop if abs(gapactual)>10000

preserve
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin gapactual)
gen hazard_ave=refi_ind/num
egen tot=sum(num)
gen dist_ave=num/tot
sort gapbin
gen hazard_deriv_ave=(hazard-hazard[_n-1])/.2
gen contrib=hazard_ave*dist_ave
gen pos=1 if gapactual>0
replace pos=0 if gapactual<=0
egen hazard_nostepcalvo_ave=sum(contrib)
bys pos: egen hazardcalvo_ave=sum(contrib)
bys pos: egen mass=sum(dist_ave)
replace hazardcalvo_ave=hazardcalvo_ave/mass

*replace hazardcalvo_ave=.034/100 if gapactual<=0
*replace hazardcalvo_ave=(.034+2.054942)/100 if gapactual>0

sort gapactual

keep gapbin gapactual hazard* dist
duplicates drop
save "ave_distandhazard_dollarbins.dta", replace 
restore


*Now compute overall prepay frequency and fraction with positive gaps by month:
collapse (sum) refi_ind=prepay_count num=loan_count, by(gapbin datem)
merge m:1 gapbin using "ave_distandhazard_dollarbins.dta", nogen
save "distandhazardinputs_dollarbins.dta", replace
bys datem: egen total_refi=sum(refi_ind)
bys datem: egen total_loans=sum(num)
gen freq=total_refi/total_loans*100

gen hazard=refi_ind/num
bys datem: egen tot=sum(num)
gen dist_variable=num/tot



lpoly dist_variable gapactual if datem==m(2000m1), noscatter bwidth(300) generate(dist_2000m12) at(gapactual)
lpoly dist_variable gapactual if datem==m(2003m1), noscatter bwidth(300) generate(dist_2003m12) at(gapactual)

sort datem gapactual

gen fracpos_tmp=dist_variable if gapactual>0
gen fracmarginal_tmp=dist_variable if gapactual>0.25 & gapactual<1
gen frac250_tmp=dist_variable if gapactual>=250
gen frac500_tmp=dist_variable if gapactual>=500
gen frac1000_tmp=dist_variable if gapactual>=1000

bys datem: egen fracpos=sum(fracpos_tmp)
bys datem: egen fracmarginal=sum(fracmarginal_tmp)
bys datem: egen frac250=sum(frac250_tmp)
bys datem: egen frac500=sum(frac500_tmp)
bys datem: egen frac1000=sum(frac1000_tmp)

drop *tmp

keep frac* freq* datem 
duplicates drop
tsset datem

*can't measure decompose refi last period
*drop if _n==_N 

*smooth the two months with missing prepay data:
replace freq=l.freq if datem==m(1999m8) | datem==m(1997m2)

*can now look at how rate incentives affect total prepayment rates, with some simple controls
merge 1:1 datem using "corelogic_national.dta",  nogen 
merge 1:1 datem using "cpi.dta", nogen
merge 1:1 datem using "CLTV_national.dta", nogen
merge 1:1 datem using "mp_shocks_data.dta", nogen keepusing(ff4_tc)
sort datem
gen cumshock=l.ff4_tc+l2.ff4_tc+l3.ff4_tc+l4.ff4_tc+l5.ff4_tc+l6.ff4_tc
gen realhp=home_price/cpi
*gen hpgrowth_1yr=log(home_price)-log(l12.home_price)
*gen hpgrowth_2yr=log(home_price)-log(l24.home_price)
gen year=year(dofm(datem))
drop if year<`firstyear' | year>`lastyear'
gen post2008ind= datem>=m(2008m1)
gen boomind=datem>=m(2002m1) & datem<=(m(2005m12))
gen boomind2=datem>=m(2003m1) & datem<=(m(2004m12))
gen ind2003=datem>=m(2003m1) & datem<=(m(2003m12))
gen pre2000=datem<m(2000m1)
gen post2010=datem>m(2010m12)
gen pre2001=datem<m(2001m1)
gen post2009=datem>m(2009m12)
gen seas=mod(datem,12)


keep frac250 frac500 frac1000 datem
save thresholds_dollars.dta, replace

use thresholds_timeseries.dta, replace
merge 1:1 datem using thresholds_dollars, nogen
save prepayment_effects_diff_thresholds_end, replace	
