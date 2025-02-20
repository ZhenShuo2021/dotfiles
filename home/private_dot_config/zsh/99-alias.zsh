# 記得放在 plugin 後載入避免被覆蓋

### User Preference
alias vv=nvim
alias lg=lazygit
alias dc=docker-compose
alias act-mac='act -P macos-latest=-self-hosted --container-architecture linux/amd64'

### System
alias ee="exit 0"
alias reload!=". ~/.zshrc"
alias switch_en="export LC_ALL='en_US.UTF-8'; export LANG='en_US.UTF-8'"
alias switch_tw="export LC_ALL='zh_TW.UTF-8'; export LANG='zh_TW.UTF-8'"

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
alias gpg_reload='gpgconf --kill gpg-agent; gpgconf --reload gpg-agent'
alias gpg_list_keys='gpg --list-keys'
alias gpg_list_config='gpgconf --list-options gpg-agent'
alias gpg_delete_key='gpg --delete-secret-and-public-keys'

### Git
alias g=git
alias gc='git commit'
alias 'gcn'='git commit --no-verify'
alias 'gcn!'='git commit --no-verify --amend'
alias 'gcnn!'='git commit --no-verify --amend --no-edit'
alias 'gtll'='gtll(){ git tag --sort=-v:refname -n10 --format="[%(refname:short)] %(contents:lines=10)%0a" --list "${1}*" }; noglob gtll'

alias 'gtlll'='gtlll(){ git tag --sort=-v:refname -n999 --format="[%(objectname:short) %(refname:short)] %(contents:lines=999)%0a" --list "${1}*" }; noglob gtlll'
# alias 'gtll'='gtll(){ git tag --sort=-v:refname -n10 --format="[%(refname:short)] %(subject)" --list "${1}*" }; noglob gtll'
# alias 'gtlll'='gtlll(){ git tag --sort=-v:refname -n10 --format="[%(objectname:short) %(refname:short)] %(subject)" --list "${1}*" }; noglob gtlll'
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
abbr gdabc="git diff --name-only --diff-filter=U"
# alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
