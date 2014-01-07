# zpython module
module_path=($module_path /usr/local/lib/zpython)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="powerline"
# ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

DISABLE_CORRECTION="true"

# Show contents of directory after cd-ing into it
# chpwd() {
#   ls -lhG
# }

# Save a ton of history
HISTSIZE=4096
HISTFILE=~/.zsh_history
SAVEHIST=4096

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(rails bundler zeus safe-paste)

source $ZSH/oh-my-zsh.sh

# source custom files
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions

# source $HOME/.dotfiles/zsh/completion/tmuxinator.zsh

export VISUAL="vim"
export EDITOR=$VISUAL

export TERM="xterm-256color"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
