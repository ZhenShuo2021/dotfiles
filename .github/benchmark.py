# /// script
# dependencies = [
#   "matplotlib",
#   "tomlkit",
#   "numpy",
# ]
# ///

import subprocess
import matplotlib.pyplot as plt
import numpy as np
from tomlkit import parse

INPUT_DATA = ".github/data-defer.toml"
OUTPUT_IMAGE = ".github/benchmark-defer.svg"

LEGEND_LOC = "upper right"
FONT_SIZE_TITLE = 24
FONT_SIZE_LABEL = 24
FONT_SIZE_LEGEND = 20
FONT_SIZE_TICK = 16

with open(INPUT_DATA, "r", encoding="utf-8") as f:
    bench_data = parse(f.read())["bench_data"]

frameworks = list(bench_data.keys())
NUM_FRAMEWORK = len(frameworks)
plt.rcParams["font.sans-serif"] = ["Arial Unicode MS"]
plt.rcParams["axes.unicode_minus"] = False
fig, axs = plt.subplots(1, 1, figsize=(16, 8))
colors = ["b", "g", "r", "c", "m", "y", "k", "w"]
bar_width = 0.10

metrics_bench_large = [
    ('zsh -lic "exit"', [bench_data[f]["exit_time_ms"] for f in frameworks]),
    ("First Command Lag", [bench_data[f]["first_command_lag_ms"] for f in frameworks]),
    ("First Prompt Lag", [bench_data[f]["first_prompt_lag_ms"] for f in frameworks]),
]
x_b_large = np.arange(len(metrics_bench_large))
center_offset = (NUM_FRAMEWORK - 1) * bar_width / 2

axs.grid(True, which="major", linestyle="-", alpha=0.5, axis="y", zorder=0)
# axs.grid(True, which='minor', linestyle=':', alpha=0.4, axis='y', zorder=0)

for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_bench_large]
    axs.bar(
        x_b_large + (i * bar_width - center_offset),
        values,
        bar_width,
        label=frameworks[i],
        color=colors[i],
        zorder=3,
    )

axs.set_xticks(x_b_large)
axs.set_xticklabels([m[0] for m in metrics_bench_large], ha="center")

# major_ticks = np.arange(0, 300, 50)
# minor_ticks = np.arange(0, 301, 25)

# Set font size for both x and y axis labels
axs.tick_params(axis="both", labelsize=FONT_SIZE_TICK)
# Additional setting specifically for x-axis labels
axs.tick_params(axis="x", labelsize=FONT_SIZE_LABEL * 0.95)

# axs.set_yticks(major_ticks)
# axs.set_yticks(minor_ticks, minor=True)

axs.tick_params(axis="y", which="major", length=6)
axs.tick_params(axis="y", which="minor", length=0)

axs.set_ylabel("Time (ms)", fontsize=FONT_SIZE_LABEL)
axs.legend(loc=LEGEND_LOC, prop={"size": FONT_SIZE_LEGEND})

# metrics_bench_small = [
#     ("Command Lag", [bench_data[f]["command_lag_ms"] for f in frameworks]),
#     ("Input Lag", [bench_data[f]["input_lag_ms"] for f in frameworks]),
# ]
# x_b_small = np.arange(len(metrics_bench_small))
# for i in range(NUM_FRAMEWORK):
#     values = [data[i] for _, data in metrics_bench_small]
#     axs[1].bar(
#         x_b_small + (i - 1) * bar_width / 1.4,
#         values,
#         bar_width / 1.4,
#         label=frameworks[i],
#         color=colors[i],
#     )
# axs[1].tick_params(labelsize=FONT_SIZE_TICK)
# axs[1].set_xlim(-0.5, len(metrics_bench_small) - 0.5)
# axs[1].set_xticks(x_b_small)
# axs[1].set_xticklabels(
#     [m[0] for m in metrics_bench_small], ha="center", fontsize=FONT_SIZE_LABEL
# )
# axs[1].set_title("Interactive Lag", fontsize=FONT_SIZE_TITLE, pad=12)
# axs[1].set_ylabel("Time (ms)", fontsize=FONT_SIZE_LABEL)
# axs[1].grid(True, linestyle="--", alpha=0.3, axis="y")

plt.tight_layout()
plt.savefig(OUTPUT_IMAGE, dpi=240, bbox_inches="tight")
# subprocess.run(["magick", f"{OUTPUT_IMAGE}.jpg", "-quality", "60", f"{OUTPUT_IMAGE}.webp"])
# subprocess.run(["rm", "-f", f"{OUTPUT_IMAGE}.jpg"])
plt.close()
