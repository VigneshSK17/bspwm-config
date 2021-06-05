export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/lib/cache/bin/:/usr/lib64/:$HOME/Documents/Scripts:$PATH

export CCACHE_DIR="/var/cache/ccache"

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep

bindkey -e
bindkey '^[[H'  beginning-of-line
bindkey '^[[4~'  end-of-line
bindkey "^[[3~" delete-char

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -r "^l"
bindkey -r "^j"

source ~/.zplug/init.zsh

export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "desyncr/auto-ls"
zplug "laggardkernel/zsh-thefuck"
zplug "joel-porquet/zsh-dircolors-solarized"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

# zplug "themes/robbyrussell", from:oh-my-zsh #, as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Plugin Configurations

# Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#93a1a1'

# Spaceship Theme Config

# ORDER
SPACESHIP_PROMPT_ORDER=(
  time     #
  vi_mode  # these sections will be
  user     # before prompt char
  host     #
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
  char
)

# USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

# DIR
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC='1' # show only last directory

# GIT
# Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE
SPACESHIP_NODE_PREFIX="node:("
SPACESHIP_NODE_SUFFIX=") "
SPACESHIP_NODE_SYMBOL=""

# RUBY
SPACESHIP_RUBY_PREFIX="ruby:("
SPACESHIP_RUBY_SUFFIX=") "
SPACESHIP_RUBY_SYMBOL=""

# XCODE
SPACESHIP_XCODE_PREFIX="xcode:("
SPACESHIP_XCODE_SUFFIX=") "
SPACESHIP_XCODE_SYMBOL=""

# SWIFT
SPACESHIP_SWIFT_PREFIX="swift:("
SPACESHIP_SWIFT_SUFFIX=") "
SPACESHIP_SWIFT_SYMBOL=""

# GOLANG
SPACESHIP_GOLANG_PREFIX="go:("
SPACESHIP_GOLANG_SUFFIX=") "
SPACESHIP_GOLANG_SYMBOL=""

# DOCKER
SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_DOCKER_SYMBOL=""

# VENV
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

# PYENV
SPACESHIP_PYENV_PREFIX="python:("
SPACESHIP_PYENV_SUFFIX=") "
SPACESHIP_PYENV_SYMBOL=""

# CHAR
SPACESHIP_CHAR_SUFFIX=" "

# Exports

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -f -g \"\""
export JAVA_HOME='/usr/lib/jvm/openjdk11-bin/'

# Aliases

alias ls="ls --color"
alias la="ls -a --color"
alias ll="ls -al --color"

alias vim="nvim"
alias idea="bash $HOME/Programs/idea-IC-211.7142.45/bin/idea.sh"

alias rip="fuck"

alias luc-ssh="ssh azureuser@52.170.74.23"

alias discord="$HOME/.config/Discord/Discord"

# Gentoo Aliases

autounmask() {
    command sudo emerge --autounmask=y --autounmask-write $1
    command sudo mv /etc/portage/package.accept_keywords/._cfg0000_zz-template /etc/portage/package.accept_keywords/$1
    command sudo etc-update --automode -5
}

remove() {
    command sudo emerge --deselect $1 $2 $3 $4 $5 $6 $7 $8 $9
    command sudo emerge --ask --quiet --depclean
}

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vigsk17/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

pfetch
if [ -e /home/vigsk17/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vigsk17/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
