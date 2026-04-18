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

cols_for_matrix = [
    "log_Body_Mass",
    "log_Flipper_Length",
    "log_Culmen_Length",
    "log_Culmen_Depth",
    "Species",
]
df_matrix = df[cols_for_matrix]

sns.set_theme(style="ticks")

pair_plot = sns.pairplot(
    df_matrix,
    hue="Species",
    palette="deep",
    plot_kws={"alpha": 1, "s": 40, "edgecolor": "w"},
    diag_kind="kde",
    height=2.5,
)

pair_plot._legend.remove()

pair_plot.figure.suptitle(
    "Scatterplot Matrix of Log-Transformed Morphological Traits",
    x=0.375,
    y=1.02,
    fontsize=16,
)

plt.savefig("./plots/model-analysis/splom.pdf", format="pdf", bbox_inches="tight")
