#!/usr/bin/env bash

Rscript ./r-codes/summary-all.R
Rscript ./r-codes/summary-adelie.R
Rscript ./r-codes/summary-gentoo.R
Rscript ./r-codes/summary-chinstrap.R
Rscript ./r-codes/model-fit.R

python3 ./plots/model-formulation/raw-res-plot.py
python3 ./plots/model-formulation/raw-res-hist.py
python3 ./plots/model-formulation/log-res-plot.py
python3 ./plots/model-formulation/log-res-hist.py

python3 ./plots/model-analysis/splom.py
python3 ./plots/model-analysis/corr-matrix.py

Rscript ./r-codes/conf-intervals.R
Rscript ./r-codes/hypo-test.R

python3 ./plots/model-testing/res-vs-fit.py
python3 ./plots/model-testing/qq-plot.py
python3 ./plots/model-testing/pearson-chisq.py
