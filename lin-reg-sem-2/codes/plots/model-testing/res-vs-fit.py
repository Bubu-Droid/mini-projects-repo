#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import statsmodels.formula.api as smf

df = pd.read_csv("../penguins_cleaned.csv")

df["log_Body_Mass"] = np.log(df["Body_Mass"])
df["log_Flipper_Length"] = np.log(df["Flipper_Length"])
df["log_Culmen_Length"] = np.log(df["Culmen_Length"])
df["log_Culmen_Depth"] = np.log(df["Culmen_Depth"])
df["Is_Gentoo"] = np.where(df["Species"].str.contains("Gentoo"), 1, 0)
df["Is_Chinstrap"] = np.where(df["Species"].str.contains("Chinstrap"), 1, 0)

formula = "log_Body_Mass ~ log_Flipper_Length + log_Culmen_Length + log_Culmen_Depth + Is_Gentoo + Is_Chinstrap"
model = smf.ols(formula, data=df).fit()

plt.figure(figsize=(8, 6))
plt.scatter(
    model.fittedvalues, model.resid, alpha=1, color="dodgerblue", edgecolors="k"
)
plt.axhline(0, color="red", linestyle="--", linewidth=2)
plt.title("Residuals vs. Fitted", fontsize=14, fontweight="bold")
plt.xlabel("Fitted Values", fontsize=12)
plt.ylabel("Residuals", fontsize=12)

plt.tight_layout()
plt.savefig("./plots/model-testing/res-vs-fit.pdf", format="pdf", bbox_inches="tight")
