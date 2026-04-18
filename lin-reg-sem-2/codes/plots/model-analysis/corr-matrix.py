#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

df = pd.read_csv("../penguins_cleaned.csv")

df["log_Body_Mass"] = np.log(df["Body_Mass"])
df["log_Flipper_Length"] = np.log(df["Flipper_Length"])
df["log_Culmen_Length"] = np.log(df["Culmen_Length"])
df["log_Culmen_Depth"] = np.log(df["Culmen_Depth"])

cols_for_corr = [
    "log_Body_Mass",
    "log_Flipper_Length",
    "log_Culmen_Length",
    "log_Culmen_Depth",
]

corr_matrix = df[cols_for_corr].corr()

sns.set_theme(style="white")

plt.figure(figsize=(8, 6))

sns.heatmap(
    corr_matrix,
    annot=True,
    fmt=".2f",
    cmap="vlag",
    vmin=-1,
    vmax=1,
    center=0,
    square=True,
    linewidths=0.5,
    cbar_kws={"shrink": 0.8},
)

plt.title(
    "Correlation Matrix of Log-Transformed Morphological Traits", pad=20, fontsize=14
)

plt.savefig("./plots/model-analysis/corr-matrix.pdf", format="pdf", bbox_inches="tight")
