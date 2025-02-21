# /// script
# dependencies = [
#   "matplotlib",
#   "numpy",
# ]
# ///

import subprocess
import matplotlib.pyplot as plt
import numpy as np

FILE_NAME = ".github/benchmark"
FONT_SIZE_TITLE = 24
FONT_SIZE_LABEL = 24
FONT_SIZE_LEGEND = 20
FONT_SIZE_TICK = 16

bench_data = {
    "Oh-My-ZSH": {
        "mean_time_ms": 148.1,
        "first_prompt_lag_ms": 23.260,
        "first_command_lag_ms": 270.265,
        "command_lag_ms": 26.156,
        "input_lag_ms": 20.797,
        "exit_time_ms": 639.359,
    },
    "Zinit": {
        "mean_time_ms": 66.2,
        "first_prompt_lag_ms": 23.160,
        "first_command_lag_ms": 123.458,
        "command_lag_ms": 23.491,
        "input_lag_ms": 20.264,
        "exit_time_ms": 64.808,
    },
    "No Plugin Manager": {
        "mean_time_ms": 42.8,
        "first_prompt_lag_ms": 27.441,
        "first_command_lag_ms": 99.687,
        "command_lag_ms": 22.966,
        "input_lag_ms": 20.195,
        "exit_time_ms": 41.054,
    },
    "Zim": {
        "mean_time_ms": 40.9,
        "first_prompt_lag_ms": 23.341,
        "first_command_lag_ms": 101.787,
        "command_lag_ms": 23.417,
        "input_lag_ms": 20.083,
        "exit_time_ms": 42.571,
    },
    "zcomet (This dotfile)": {
        "mean_time_ms": 42.9,
        "first_prompt_lag_ms": 24.194,
        "first_command_lag_ms": 98.126,
        "command_lag_ms": 23.173,
        "input_lag_ms": 22.092,
        "exit_time_ms": 43.568,
    },
    "Baseline (Empty .zshrc)": {
        "mean_time_ms": 11.1,
        "first_prompt_lag_ms": 16.612,
        "first_command_lag_ms": 16.776,
        "command_lag_ms": 0.071,
        "input_lag_ms": 0.199,
        "exit_time_ms": 15.626,
    },
}

# Get frameworks list from bench_data keys to maintain order
frameworks = list(bench_data.keys())
NUM_FRAMEWORK = len(frameworks)
plt.rcParams["font.sans-serif"] = ["Arial Unicode MS"]
plt.rcParams["axes.unicode_minus"] = False
fig, axs = plt.subplots(1, 1, figsize=(16, 8))
colors = ["b", "g", "r", "c", "m", "y", "k", "w"]
bar_width = 0.10

metrics_bench_large = [
    ("First Prompt Lag", [bench_data[f]["first_prompt_lag_ms"] for f in frameworks]),
    ("First Command Lag", [bench_data[f]["first_command_lag_ms"] for f in frameworks]),
    ("Exit Time", [bench_data[f]["exit_time_ms"] for f in frameworks]),
]
x_b_large = np.arange(len(metrics_bench_large))
center_offset = (NUM_FRAMEWORK - 1) * bar_width / 2

# axs.grid(True, which='major', linestyle='--', alpha=1, axis='y', zorder=0)
# axs.grid(True, which='minor', linestyle=':', alpha=0.4, axis='y', zorder=0)

for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_bench_large]
    axs.bar(
        x_b_large + (i * bar_width - center_offset),
        values,
        bar_width,
        label=frameworks[i],
        color=colors[i],
        zorder=3
    )

axs.set_xticks(x_b_large)
axs.set_xticklabels(
    [m[0] for m in metrics_bench_large], 
    ha="center"
)

major_ticks = np.arange(0, 681, 100)
minor_ticks = np.arange(0, 681, 25)

# Set font size for both x and y axis labels
axs.tick_params(axis='both', labelsize=FONT_SIZE_TICK)
# Additional setting specifically for x-axis labels
axs.tick_params(axis='x', labelsize=FONT_SIZE_LABEL*0.95)

axs.set_yticks(major_ticks)
axs.set_yticks(minor_ticks, minor=True)

axs.tick_params(axis='y', which='major', length=6)
axs.tick_params(axis='y', which='minor', length=0)

axs.set_ylabel("Time (ms)", fontsize=FONT_SIZE_LABEL)
axs.legend(loc="upper left", prop={"size": FONT_SIZE_LEGEND})

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
plt.savefig(FILE_NAME + ".jpg", dpi=240, bbox_inches="tight")
subprocess.run(["magick", f"{FILE_NAME}.jpg", "-quality", "60", f"{FILE_NAME}.webp"])
subprocess.run(["rm", "-f", f"{FILE_NAME}.jpg"])
plt.close()
