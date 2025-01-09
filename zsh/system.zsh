# ==================== fpath ==============================
#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZDOTFILES/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;
fpath=($ZDOTFILES/functions $fpath)

# ==================== config ==============================
autoload -U $ZDOTFILES/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# 關閉 zsh 自動修正
unsetopt correct

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# ==================== path and alias ==============================
export PATH="$ZDOTFILES/bin:$PATH"
export EDITOR='code'

alias reload!=". ~/.zshrc"

alias "cls"="clear"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "cd-"="cd -"
alias "cd.."="cd .."
alias "cd..."="cd ../.."
alias "cd...."="cd ../../.."

alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
