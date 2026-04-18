#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import statsmodels.formula.api as smf

df = pd.read_csv("../penguins_cleaned.csv")
df["Is_Gentoo"] = np.where(df["Species"] == "Gentoo penguin (Pygoscelis papua)", 1, 0)
df["Is_Chinstrap"] = np.where(
    df["Species"] == "Chinstrap penguin (Pygoscelis antarctica)", 1, 0
)

formula_raw = "Body_Mass ~ Flipper_Length + Culmen_Length + Culmen_Depth + Is_Gentoo + Is_Chinstrap"
model_raw = smf.ols(formula=formula_raw, data=df).fit()
residuals_raw = model_raw.resid

sns.set_theme(style="whitegrid")
plt.figure(figsize=(8, 6))

sns.histplot(residuals_raw, kde=True, color="dodgerblue", bins=20)

plt.title("Raw Model: Histogram of Residuals", fontsize=14, pad=15)
plt.xlabel("Residuals (g)", fontsize=12)
plt.ylabel("Frequency", fontsize=12)

plt.tight_layout()

plt.savefig(
    "./plots/model-formulation/raw-res-hist.pdf", format="pdf", bbox_inches="tight"
)
