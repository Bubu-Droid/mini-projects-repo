#!/usr/bin/env bash

# Rscript ./summary-all.R
# Rscript ./summary-adelie.R
# Rscript ./summary-gentoo.R
# Rscript ./summary-chinstrap.R

# Rscript ./model-fit.R

Rscript ./raw-res-plot.R
mv Rplots.pdf raw-res-plot.pdf

Rscript ./raw-res-hist.R
mv Rplots.pdf raw-res-hist.pdf

Rscript ./log-res-plot.R
mv Rplots.pdf log-res-plot.pdf

Rscript ./log-res-hist.R
mv Rplots.pdf log-res-hist.pdf
