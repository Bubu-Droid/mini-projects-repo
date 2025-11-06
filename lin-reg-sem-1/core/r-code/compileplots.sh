#!/usr/bin/env bash

Rscript default-biv-plot.R
mv Rplots.pdf default-biv-plot.pdf

Rscript log-biv-plot.R
mv Rplots.pdf log-biv-plot.pdf

Rscript model-fit.R
mv Rplots.pdf model-fit.pdf

Rscript summary-stat.R

Rscript residual-plot.R
mv Rplots.pdf residual-plot.pdf
