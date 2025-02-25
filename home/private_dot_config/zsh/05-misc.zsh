autoload -Uz add-zsh-hook

# zsh hook function to remind you a time-consuming command is done
preexec_remind() {
    local LONG_RUNNING_COMMANDS=("docker build" "scp file user@host:/path")
    local PARTIAL_MATCH_COMMANDS=("rsync -a")
    local cmd=$1

    for lr_cmd in "${LONG_RUNNING_COMMANDS[@]}"; do
        if [[ $cmd == "$lr_cmd" ]]; then
            LAST_LONG_RUNNING_CMD=$cmd
            return
        fi
    done

    for pm_cmd in "${PARTIAL_MATCH_COMMANDS[@]}"; do
        if [[ $cmd == *"$pm_cmd"* ]]; then
            LAST_LONG_RUNNING_CMD=$cmd
            return
        fi
    done
}


precmd_remind() {
    if [[ -n $LAST_LONG_RUNNING_CMD ]]; then
        osascript -e "display notification \"Command completed: $LAST_LONG_RUNNING_CMD\" with title \"Reminder\" sound name \"Glass\""
        unset LAST_LONG_RUNNING_CMD
    fi
}


add-zsh-hook preexec preexec_remind
add-zsh-hook precmd precmd_remind
