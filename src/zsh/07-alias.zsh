# 記得放在 plugin 後載入避免被覆蓋

### User Preference
alias vv=nvim
alias lg=lazygit
alias act-mac='act -P macos-latest=-self-hosted --container-architecture linux/amd64'

### System
alias reload!=". ~/.zshrc"

alias "cls"="clear"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "cd-"="cd -"
alias "cd.."="cd .."
alias "cd..."="cd ../.."
alias "cd...."="cd ../../.."

alias l="ls -lAGh"
alias ll="ls -FG"
alias lll="ls -lA"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias gpg_test='echo test | gpg --clear-sign'
alias gpg_reload='gpgconf --kill gpg-agent'

### Git
alias g=git
alias gc='git commit'
alias 'gc!'='git commit --amend --no-verify'
alias 'gcn!'='git commit --amend --no-verify --no-edit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gcp='git cherry-pick'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rbi'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias ga='git add'
alias gb='git branch'
alias gs='git status -sb'
alias ge='git-edit-new'

alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias gloga="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias gp='git push'
alias 'gp!'='git push --force-with-lease --force-if-includes'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
