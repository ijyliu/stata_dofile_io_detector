parmby "regr gpm weight foreign", lab saving(`"`tf3'"',replace) idn(3) ids(Adjusted)

parmest,format(estimate min95 max95 %8.2f p %8.1e) list(,)
parmest, label format(estimate min95 max95 p %8.2f p %8.1e) list(parm label estimate min95 max95 p,clean noobs)

parmby "logit foreign mpg, or", label eform saving(parms1.dta)
parmby "regr mpg weight displ,robust",by(foreign) label saving(myparms,replace)


 parmby "regr gpm weight", lab saving(`"`tf1'"',replace) idn(1) ids(Unadjusted)
parmby "regr gpm foreign", lab saving(`"`tf2'"',replace) idn(2) ids(Unadjusted)
                . parmby "regr gpm weight foreign", lab saving(`"`tf3'"',replace) idn(3) ids(Adjusted)

                . parmby "regr mpg `X'",by(foreign) label command format(estimate min95 max95 %8.2f p %8.1e) idn($modseq) saving(`"`tfcur'"',replace) flist(tflist)
                . }
 
                . parmest, norestore
                . tempfile tf1
                . parmest, bmat(e(b_Q_mi)) vmat(e(V_Q_mi)) dfmat(e(df_Q_mi)) saving(`"`tf1'"', replace)
                . append using `"`tf1'"', gene(parmtype)
