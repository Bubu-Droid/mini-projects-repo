#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import statsmodels.api as sm
from matplotlib.patches import Rectangle
from scipy.stats import norm

# ============================================================
# 1. Load data and fit model
# ============================================================

df = pd.read_csv("../penguins_cleaned.csv")

df["Is_Gentoo"] = (df["Species"] == "Gentoo penguin (Pygoscelis papua)").astype(int)
df["Is_Chinstrap"] = (
    df["Species"] == "Chinstrap penguin (Pygoscelis antarctica)"
).astype(int)

df["log_Body_Mass"] = np.log(df["Body_Mass"])
df["log_Flipper_Length"] = np.log(df["Flipper_Length"])
df["log_Culmen_Length"] = np.log(df["Culmen_Length"])
df["log_Culmen_Depth"] = np.log(df["Culmen_Depth"])

X = df[
    [
        "log_Flipper_Length",
        "log_Culmen_Length",
        "log_Culmen_Depth",
        "Is_Gentoo",
        "Is_Chinstrap",
    ]
]
X = sm.add_constant(X)
y = df["log_Body_Mass"]

model = sm.OLS(y, X).fit()
residuals = model.get_influence().resid_studentized_internal
n = len(residuals)

# ============================================================
# 2. Chi-square binning
# ============================================================

cuts = norm.ppf(np.linspace(0, 1, 11))
observed, _ = np.histogram(residuals, bins=cuts)
expected = np.full(10, n / 10)

midpoints = (cuts[:-1] + cuts[1:]) / 2
bin_widths = cuts[1:] - cuts[:-1]

# ============================================================
# 3. Plot
# ============================================================

fig, ax = plt.subplots(figsize=(12, 6), facecolor="#f7f7f7")

fig.suptitle(
    "Chi-Square Goodness-of-Fit Test for Normality",
    fontsize=24,
    fontweight="bold",
    color="#1f4e79",
)

# Standard normal curve
x = np.linspace(-3.5, 3.5, 1000)
pdf = norm.pdf(x)
ax.plot(x, pdf, color="black", linewidth=2)

# Fill equal-probability regions
for i in range(10):
    x_fill = np.linspace(cuts[i], cuts[i + 1], 200)
    y_fill = norm.pdf(x_fill)
    ax.fill_between(x_fill, y_fill, 0, color="#0ea5c6", alpha=0.85, zorder=1)

# Vertical cut lines
for c in cuts:
    ax.axvline(c, linestyle="--", color="black", alpha=0.3, zorder=2)

# Add 10% labels
for i in range(10):
    xm = midpoints[i]
    ax.text(
        xm,
        0.12,
        "10%",
        ha="center",
        va="center",
        fontsize=12,
        color="white",
        fontweight="bold",
        zorder=5,
    )

# Observed + expected blocks
base_y = 0.0
scale = 0.0022

for i in range(10):
    left = cuts[i]
    width = bin_widths[i]

    obs_h = observed[i] * scale
    exp_h = expected[i] * scale * 0.4

    # Observed block
    ax.add_patch(
        Rectangle(
            (left, base_y),
            width,
            obs_h,
            facecolor="#f39c12",
            edgecolor="#a35a00",
            linewidth=1.0,
            zorder=3,
        )
    )

    # Expected block
    ax.add_patch(
        Rectangle(
            (left, base_y + obs_h),
            width,
            exp_h,
            facecolor="#f3e8c8",
            edgecolor="#8a7f66",
            linewidth=1.0,
            zorder=4,
        )
    )

    # Observed count below each bin
    ax.text(
        midpoints[i],
        -0.022,
        f"{observed[i]}",
        ha="center",
        va="center",
        fontsize=14,
        color="#0d2c45",
        fontweight="bold",
        zorder=6,
    )

# Clean axes
ax.set_xlim(-3.5, 3.5)
ax.set_ylim(-0.04, pdf.max() + 0.05)
ax.set_xticks([-2, -1, 0, 1, 2])
ax.set_xticklabels(["-2", "-1", "0", "1", "2"], fontsize=14, fontweight="bold")
ax.set_yticks([])

for spine in ["top", "right", "left"]:
    ax.spines[spine].set_visible(False)

ax.spines["bottom"].set_visible(False)

plt.tight_layout()
# plt.show()
plt.savefig(
    "./plots/model-testing/pearson-chisq.pdf", format="pdf", bbox_inches="tight"
)
