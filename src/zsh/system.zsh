# opts from holman
setopt NO_BG_NICE # don't nice background tasks
# setopt NO_HUP # 不使用這個選項，要 NO_HUP 就乖乖用 tmux
# setopt NO_LIST_BEEP
# setopt LOCAL_OPTIONS # allow functions to have local options
# setopt LOCAL_TRAPS # allow functions to have local traps
# setopt HIST_VERIFY
# setopt SHARE_HISTORY # 不使用這個選項因為運作不理想
# setopt EXTENDED_HISTORY # add timestamps to history
# setopt PROMPT_SUBST
# setopt COMPLETE_IN_WORD
# setopt IGNORE_EOF

# setopt APPEND_HISTORY # adds history
# setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
# setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
# setopt HIST_REDUCE_BLANKS

# # don't expand aliases _before_ completion has finished
# #   like: git comm-[tab]
# setopt complete_aliases   # 此功能和大多數自動補全衝突

setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
unsetopt CORRECT   # 關閉 zsh 自動修正，不準又很煩

# bindkey '^[^[[D' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '^[[5D' beginning-of-line
# bindkey '^[[5C' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
