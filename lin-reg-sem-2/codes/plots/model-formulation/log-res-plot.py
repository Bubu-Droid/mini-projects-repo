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

df["log_Body_Mass"] = np.log(df["Body_Mass"])
df["log_Flipper_Length"] = np.log(df["Flipper_Length"])
df["log_Culmen_Length"] = np.log(df["Culmen_Length"])
df["log_Culmen_Depth"] = np.log(df["Culmen_Depth"])

formula = "log_Body_Mass ~ log_Flipper_Length + log_Culmen_Length + log_Culmen_Depth + Is_Gentoo + Is_Chinstrap"
model_log = smf.ols(formula=formula, data=df).fit()

residuals = model_log.resid

sns.set_theme(style="ticks")
plt.figure(figsize=(8, 6))

sns.scatterplot(
    x=residuals.index,
    y=residuals,
    color="darkorange",
    alpha=1,
    s=75,
)

plt.axhline(y=0, color="red", linestyle="--", linewidth=2)

plt.title("Residuals vs. Observation Index (Log Model)", fontsize=14, pad=15)
plt.xlabel("Observation Index", fontsize=12)
plt.ylabel("Residuals (log units)", fontsize=12)

plt.tight_layout()

plt.savefig(
    "./plots/model-formulation/log-res-plot.pdf", format="pdf", bbox_inches="tight"
)
