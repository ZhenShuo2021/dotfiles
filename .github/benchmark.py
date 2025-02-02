# /// script
# dependencies = [
#   "matplotlib",
#   "numpy",
# ]
# ///

import matplotlib.pyplot as plt
import numpy as np

FONT_SIZE_TITLE = 24
FONT_SIZE_LABEL = 16
FONT_SIZE_LEGEND = 14
FONT_SIZE_TICK = 16

hyperfine_data = {
    'framework': ['Oh-My-ZSH', 'Manual Install', 'ZINIT (This dotfile)'],
    'mean_time_ms': [155.8, 43.2, 52.3],
    'user_time_ms': [112.9, 23.2, 31.5],
    'system_time_ms': [58.1, 16.4, 16.7]
}
bench_data = {
    'framework': ['Oh-My-ZSH', 'Manual Install', 'ZINIT (This dotfile)'],
    'first_prompt_lag_ms': [143.738, 145.080, 147.591],
    'first_command_lag_ms': [384.192, 218.459, 231.538],
    'command_lag_ms': [26.513, 24.208, 22.752],
    'input_lag_ms': [21.176, 20.682, 20.984],
    'exit_time_ms': [772.380, 163.276, 174.280]
}

plt.rcParams['font.sans-serif'] = ['Arial Unicode MS']
plt.rcParams['axes.unicode_minus'] = False

fig, axs = plt.subplots(1, 3, figsize=(20, 8))
colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'w']
bar_width = 0.15

metrics_hyper = [
    ('Startup Time', hyperfine_data['mean_time_ms']),
    ('User Time', hyperfine_data['user_time_ms']),
    ('System Time', hyperfine_data['system_time_ms'])
]
x_h = np.arange(len(metrics_hyper))
for i in range(3):
    values = [data[i] for _, data in metrics_hyper]
    axs[0].bar(x_h + (i - 1)*bar_width, values, bar_width, label=hyperfine_data['framework'][i], color=colors[i])
axs[0].tick_params(labelsize=FONT_SIZE_TICK)
axs[0].set_xticks(x_h)
axs[0].set_xticklabels([m[0] for m in metrics_hyper], ha='center', fontsize=FONT_SIZE_LABEL)
axs[0].set_title('Hyperfine Performance Test', fontsize=FONT_SIZE_TITLE)
axs[0].set_ylabel('Time (ms)', fontsize=FONT_SIZE_LABEL)
axs[0].grid(True, linestyle='--', alpha=0.3, axis='y')
axs[0].legend(prop={'size': FONT_SIZE_LEGEND})

metrics_bench_large = [
    ('First Prompt Lag', bench_data['first_prompt_lag_ms']),
    ('First Command Lag', bench_data['first_command_lag_ms']),
    ('Exit Time', bench_data['exit_time_ms'])
]
x_b_large = np.arange(len(metrics_bench_large))
for i in range(3):
    values = [data[i] for _, data in metrics_bench_large]
    axs[1].bar(x_b_large + (i - 1)*bar_width, values, bar_width, label=bench_data['framework'][i], color=colors[i])
axs[1].tick_params(labelsize=FONT_SIZE_TICK)
axs[1].set_xticks(x_b_large)
axs[1].set_xticklabels([m[0] for m in metrics_bench_large], ha='center', fontsize=FONT_SIZE_LABEL)
axs[1].set_title('Startup and Exit Lag', fontsize=FONT_SIZE_TITLE)
axs[1].set_ylabel('Time (ms)', fontsize=FONT_SIZE_LABEL)
axs[1].grid(True, linestyle='--', alpha=0.3, axis='y')
axs[1].legend(prop={'size': FONT_SIZE_LEGEND})

metrics_bench_small = [
    ('Command Lag', bench_data['command_lag_ms']),
    ('Input Lag', bench_data['input_lag_ms'])
]
x_b_small = np.arange(len(metrics_bench_small))
for i in range(3):
    values = [data[i] for _, data in metrics_bench_small]
    axs[2].bar(x_b_small + (i - 1)*bar_width/1.4, values, bar_width/1.4, label=bench_data['framework'][i], color=colors[i])
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
plt.savefig('.github/benchmark.svg', bbox_inches='tight')
plt.close()
