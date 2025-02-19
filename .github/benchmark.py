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
FONT_SIZE_LABEL = 16
FONT_SIZE_LEGEND = 16
FONT_SIZE_TICK = 16

bench_data = {
    "Oh-My-ZSH": {
        "mean_time_ms": 154.7,
        "first_prompt_lag_ms": 30.448,
        "first_command_lag_ms": 281.011,
        "command_lag_ms": 26.284,
        "input_lag_ms": 20.760,
        "exit_time_ms": 664.233,
    },
    "Zinit": {
        "mean_time_ms": 69.3,
        "first_prompt_lag_ms": 32.772,
        "first_command_lag_ms": 126.897,
        "command_lag_ms": 22.626,
        "input_lag_ms": 20.554,
        "exit_time_ms": 67.867,
    },
    # "zcomet": {
    #     "mean_time_ms": 50.7,
    #     "first_prompt_lag_ms": 30.572,
    #     "first_command_lag_ms": 102.524,
    #     "command_lag_ms": 22.392,
    #     "input_lag_ms": 19.663,
    #     "exit_time_ms": 49.854,
    # },
    "No Plugin Manager": {
        "mean_time_ms": 43.9,
        "first_prompt_lag_ms": 31.999,
        "first_command_lag_ms": 97.347,
        "command_lag_ms": 21.838,
        "input_lag_ms": 22.432,
        "exit_time_ms": 41.402,
    },
    "Zim (This dotfile)": {
        "mean_time_ms": 42.1,
        "first_prompt_lag_ms": 34.035,
        "first_command_lag_ms": 101.787,
        "command_lag_ms": 23.496,
        "input_lag_ms": 20.453,
        "exit_time_ms": 41.789,
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
fig, axs = plt.subplots(1, 2, figsize=(16, 8))
colors = ["b", "g", "r", "c", "m", "y", "k", "w"]
bar_width = 0.15

metrics_bench_large = [
    ("First Prompt Lag", [bench_data[f]["first_prompt_lag_ms"] for f in frameworks]),
    ("First Command Lag", [bench_data[f]["first_command_lag_ms"] for f in frameworks]),
    ("Exit Time", [bench_data[f]["exit_time_ms"] for f in frameworks]),
]
x_b_large = np.arange(len(metrics_bench_large))
for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_bench_large]
    axs[0].bar(
        x_b_large + (i - 1) * bar_width,
        values,
        bar_width,
        label=frameworks[i],
        color=colors[i],
    )
axs[0].tick_params(labelsize=FONT_SIZE_TICK)
axs[0].set_xticks(x_b_large)
axs[0].set_xticklabels(
    [m[0] for m in metrics_bench_large], ha="center", fontsize=FONT_SIZE_LABEL
)
axs[0].set_title("Startup and Exit Lag", fontsize=FONT_SIZE_TITLE, pad=12)
axs[0].set_ylabel("Time (ms)", fontsize=FONT_SIZE_LABEL)
axs[0].grid(True, linestyle="--", alpha=0.3, axis="y")
axs[0].legend(prop={"size": FONT_SIZE_LEGEND})

metrics_bench_small = [
    ("Command Lag", [bench_data[f]["command_lag_ms"] for f in frameworks]),
    ("Input Lag", [bench_data[f]["input_lag_ms"] for f in frameworks]),
]
x_b_small = np.arange(len(metrics_bench_small))
for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_bench_small]
    axs[1].bar(
        x_b_small + (i - 1) * bar_width / 1.4,
        values,
        bar_width / 1.4,
        label=frameworks[i],
        color=colors[i],
    )
axs[1].tick_params(labelsize=FONT_SIZE_TICK)
axs[1].set_xlim(-0.5, len(metrics_bench_small) - 0.5)
axs[1].set_xticks(x_b_small)
axs[1].set_xticklabels(
    [m[0] for m in metrics_bench_small], ha="center", fontsize=FONT_SIZE_LABEL
)
axs[1].set_title("Interactive Lag", fontsize=FONT_SIZE_TITLE, pad=12)
axs[1].set_ylabel("Time (ms)", fontsize=FONT_SIZE_LABEL)
axs[1].grid(True, linestyle="--", alpha=0.3, axis="y")

plt.tight_layout()
plt.savefig(FILE_NAME + ".jpg", dpi=240, bbox_inches="tight")
subprocess.run(["magick", f"{FILE_NAME}.jpg", "-quality", "60", f"{FILE_NAME}.webp"])
subprocess.run(["rm", "-f", f"{FILE_NAME}.jpg"])
plt.close()
