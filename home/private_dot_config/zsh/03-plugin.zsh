# Install plugin manager and source it
### Added by Zinit's installer

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-readurl \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load lazy-loading function to make it usable everywhere
zinit ice depth=1; zinit light romkatv/powerlevel10k
source $ZZ/04-p10k.zsh

zinit light romkatv/zsh-defer

zsh-defer zinit light zsh-users/zsh-autosuggestions
zsh-defer zinit light zsh-users/zsh-completions
zsh-defer zinit light zsh-users/zsh-syntax-highlighting
zsh-defer zinit light agkozak/zsh-z

docker_comp="https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/zsh/_docker"
zsh-defer zinit snippet $docker_comp
zsh-defer zinit snippet OMZP::extract
zsh-defer zinit snippet OMZP::git
zsh-defer zinit snippet OMZL::key-bindings.zsh
