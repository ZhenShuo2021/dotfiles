# /// script
# dependencies = [
#   "matplotlib",
#   "numpy",
# ]
# ///

import subprocess
import matplotlib.pyplot as plt
import numpy as np

FILE_NAME = '.github/benchmark'
FONT_SIZE_TITLE = 24
FONT_SIZE_LABEL = 16
FONT_SIZE_LEGEND = 14
FONT_SIZE_TICK = 16

hyperfine_data = {
    'Oh-My-ZSH': {
        'mean_time_ms': 161.5,
        'user_time_ms': 113.3,
        'system_time_ms': 59.5
    },
    'Manual Install': {
        'mean_time_ms': 140.7,
        'user_time_ms': 81.2,
        'system_time_ms': 40.5
    },
    'Manual Install Optimized': {
        'mean_time_ms': 42.6,
        'user_time_ms': 22.6,
        'system_time_ms': 16.3
    },
    'Zinit (This dotfile)': {
        'mean_time_ms': 53.7,
        'user_time_ms': 33.2,
        'system_time_ms': 15.9
    },
    'Baseline (No .zshrc)': {
        'mean_time_ms': 15.5,
        'user_time_ms': 9.2,
        'system_time_ms': 4.6
    }
}

bench_data = {
    'Oh-My-ZSH': {
        'first_prompt_lag_ms': 52.903,
        'first_command_lag_ms': 292.837,
        'command_lag_ms': 26.368,
        'input_lag_ms': 20.349,
        'exit_time_ms': 683.676
    },
    'Manual Install': {
        'first_prompt_lag_ms': 52.562,
        'first_command_lag_ms': 254.041,
        'command_lag_ms': 22.101,
        'input_lag_ms': 20.617,
        'exit_time_ms': 161.114
    },
    'Manual Install Optimized': {
        'first_prompt_lag_ms': 52.250,
        'first_command_lag_ms': 125.783,
        'command_lag_ms': 24.108,
        'input_lag_ms': 19.161,
        'exit_time_ms': 72.494
    },
    'Zinit (This dotfile)': {
        'first_prompt_lag_ms': 53.949,
        'first_command_lag_ms': 136.484,
        'command_lag_ms': 21.780,
        'input_lag_ms': 19.924,
        'exit_time_ms': 80.015
    },
    'Baseline (No .zshrc)': {
        'first_prompt_lag_ms': 47.158,
        'first_command_lag_ms': 47.340,
        'command_lag_ms': 0.066,
        'input_lag_ms': 0.207,
        'exit_time_ms': 50.048
    }
}

# Get frameworks list from hyperfine_data keys to maintain order
frameworks = list(hyperfine_data.keys())
NUM_FRAMEWORK = len(frameworks)

plt.rcParams['font.sans-serif'] = ['Arial Unicode MS']
plt.rcParams['axes.unicode_minus'] = False

fig, axs = plt.subplots(1, 3, figsize=(20, 8))
colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'w']
bar_width = 0.15

metrics_hyper = [
    ('Startup Time', [hyperfine_data[f]['mean_time_ms'] for f in frameworks]),
    ('User Time', [hyperfine_data[f]['user_time_ms'] for f in frameworks]),
    ('System Time', [hyperfine_data[f]['system_time_ms'] for f in frameworks])
]
x_h = np.arange(len(metrics_hyper))
for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_hyper]
    axs[0].bar(x_h + (i - 1)*bar_width, values, bar_width, label=frameworks[i], color=colors[i])
axs[0].tick_params(labelsize=FONT_SIZE_TICK)
axs[0].set_xticks(x_h)
axs[0].set_xticklabels([m[0] for m in metrics_hyper], ha='center', fontsize=FONT_SIZE_LABEL)
axs[0].set_title('Hyperfine Performance Test', fontsize=FONT_SIZE_TITLE)
axs[0].set_ylabel('Time (ms)', fontsize=FONT_SIZE_LABEL)
axs[0].grid(True, linestyle='--', alpha=0.3, axis='y')
axs[0].legend(prop={'size': FONT_SIZE_LEGEND})

metrics_bench_large = [
    ('First Prompt Lag', [bench_data[f]['first_prompt_lag_ms'] for f in frameworks]),
    ('First Command Lag', [bench_data[f]['first_command_lag_ms'] for f in frameworks]),
    ('Exit Time', [bench_data[f]['exit_time_ms'] for f in frameworks])
]
x_b_large = np.arange(len(metrics_bench_large))
for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_bench_large]
    axs[1].bar(x_b_large + (i - 1)*bar_width, values, bar_width, label=frameworks[i], color=colors[i])
axs[1].tick_params(labelsize=FONT_SIZE_TICK)
axs[1].set_xticks(x_b_large)
axs[1].set_xticklabels([m[0] for m in metrics_bench_large], ha='center', fontsize=FONT_SIZE_LABEL)
axs[1].set_title('Startup and Exit Lag', fontsize=FONT_SIZE_TITLE)
axs[1].set_ylabel('Time (ms)', fontsize=FONT_SIZE_LABEL)
axs[1].grid(True, linestyle='--', alpha=0.3, axis='y')
axs[1].legend(prop={'size': FONT_SIZE_LEGEND})

metrics_bench_small = [
    ('Command Lag', [bench_data[f]['command_lag_ms'] for f in frameworks]),
    ('Input Lag', [bench_data[f]['input_lag_ms'] for f in frameworks])
]
x_b_small = np.arange(len(metrics_bench_small))
for i in range(NUM_FRAMEWORK):
    values = [data[i] for _, data in metrics_bench_small]
    axs[2].bar(x_b_small + (i - 1)*bar_width/1.4, values, bar_width/1.4, label=frameworks[i], color=colors[i])
axs[2].tick_params(labelsize=FONT_SIZE_TICK)
axs[2].set_xlim(-0.5, len(metrics_bench_small) - 0.5)
axs[2].set_xticks(x_b_small)
axs[2].set_xticklabels([m[0] for m in metrics_bench_small], ha='center', fontsize=FONT_SIZE_LABEL)
axs[2].set_title('Interactive Lag', fontsize=FONT_SIZE_TITLE)
axs[2].set_ylabel('Time (ms)', fontsize=FONT_SIZE_LABEL)
axs[2].grid(True, linestyle='--', alpha=0.3, axis='y')
axs[2].legend(prop={'size': FONT_SIZE_LEGEND})

# fig.suptitle('ZSH Configuration Frameworks Performance Test', fontsize=16, y=0.98)
plt.tight_layout(rect=[0, 0, 1, 0.95])
plt.savefig(FILE_NAME+'.jpg', dpi=240, bbox_inches='tight')
subprocess.run(['magick', f'{FILE_NAME}.jpg', '-quality', '60', f'{FILE_NAME}.webp'])
subprocess.run(['rm', '-f', f'{FILE_NAME}.jpg'])
plt.close()
