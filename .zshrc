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
plugins=(git django gem git-flow github heroku node npm pip redis-cli ruby terminitor knife)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin

export PIP_LOG_FILE="/tmp/pip-log.txt"
export DJANGO_COLORS="dark;http_success=black,bold;http_redirect=white"
export DJANGO_CONF="dev"

if [[ ! -z "`command -v choc_wait`" ]] ; then
    export EDITOR="`which choc_wait`"
elif [[ ! -z "`command -v mate_wait`" ]] ; then
    export EDITOR="`which mate_wait`"
elif [[ ! -z "`command -v joe`" ]] ; then
    export EDITOR="`which joe`"
elif [[ ! -z "`command -v nano`" ]] ; then
    export EDITOR="`which nano`"
fi

export LESSEDIT="$EDITOR %f"

# autoenv (https://github.com/kennethreitz/autoenv)
source ~/.autoenv/activate.sh
function cd() {
    emulate -LR zsh
    if builtin cd "$@"
    then
        l
        autoenv_init
        return 0
    else
        return $?
    fi
}

# Locale
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US.UTF-8

# Aliases
alias l="ls -aloG"
alias rm="rm -i"
alias less="less -R"
alias virtualenv="virtualenv --distribute"
alias ipaddr="dig +short myip.opendns.com @resolver1.opendns.com"
function pygrep() { find . -type f -name \*.py -exec grep -H $@ \{\} \; }
function hs() { heroku $@ --remote staging }
function hp() { heroku $@ --remote production }

# OSX-specific aliases
if [ ! "$SSH_TTY" ] && [[ "$OSTYPE" =~ "darwin" ]] ; then
    alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
    alias flush="dscacheutil -flushcache"
    alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
    alias imageoptim="open -a /Applications/ImageOptim.app"
fi

# Python
export PYTHONSTARTUP=$HOME/.python/startup.py

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Put customizations into .zshrc.local. They will be included here if the file exists.
if [[ -e .zshrc.local ]] ; then
    source .zshrc.local
fi
