# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="philippbosch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export PIP_LOG_FILE="/tmp/pip-log.txt"
export DJANGO_COLORS="dark;http_success=black,bold;http_redirect=white"
export DJANGO_CONF="dev"

# Locale
export LC_ALL=de_DE.UTF-8
export LANG=de_DE.UTF-8

# Show list of files after each cd
function chpwd() {
    emulate -LR zsh
    l
}

# Aliases
alias l="ls -aloG"
alias rm="rm -i"
alias less="less -R"
alias virtualenv="virtualenv --no-site-packages"

# Python
export PYTHONSTARTUP=$HOME/.python/startup.py

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
