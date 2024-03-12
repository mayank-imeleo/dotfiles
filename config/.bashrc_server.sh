#!/bin/bash

# TERMINAL ----------------------------------------------------------

#ls
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias ls="ls --color=always"

# less
alias less="less -R"


#HSTR
alias hh=hstr
# store b~/.hstr_blacklist
export HSTR_CONFIG=hicolor,no-confirm,blacklist
shopt -s histappend             # append new history items to .bash_history
export HISTCONTROL=ignorespace  # leading space hides commands from history
export HISTFILESIZE=10000       # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE} # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# autojump
source /usr/share/autojump/autojump.sh
alias jl="j --s | fzf"

# ------------------------------------------------------------------
# Starship
function banner(){
    figlet "$FIGLET_BANNER"|lolcat
}
starship_precmd_user_func="banner"
eval "$(starship init bash)"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# ------------------------------------------------------------------
#ssh
alias ssh-config="vim ~/.ssh/config"
alias sc="ssh-config"

# alias p=pwd
alias c=clear
alias g=git
alias h=head
alias md=mkdir
alias t=tail
alias t=touch
alias w=which
alias x=exit
alias s=sudo

alias less="less -R" # always display colors
alias tree="tree -C" # always display colors

# bashrc
alias bashrc_reload="source ~/.bashrc"
alias rl=bashrc_reload
alias bashrc_edit="vim ~/.bashrc"
#alias ed=edit_bashrc

# open a random file in vim
alias tvim="mktemp | vim -"

# ------------------------------------------------------------------
# CELERY

alias celeryworker-daemon-reload="sudo systemctl daemon-reload && sudo systemctl restart celeryworker"
alias celerybeat-daemon-reload="sudo systemctl daemon-reload && sudo systemctl restart celerybeat"

# ------------------------------------------------------------------
# Environment Variables
export DOTFILES_DIR="$HOME/dotfiles"

# ------------------------------------------------------------------
# GIT

# run gl --all to view graph of all branches
alias gl="git log --oneline --graph --decorate"

alias gs="git status"

alias gpl="git pull"
alias gph="git push"

export GIT_EDITOR=vim
# PYTHON ------------------------------------------------------------

#alias p="python"
alias va="source venv/bin/activate"
alias da="deactivate"

# GENERAL
export APP_GIT_REPO_SSH_URL=""
export APP_ALIAS="General-Dev"

export SERVER_NAME="Local-Ubuntu-Env"

# ------------------------------------------------------------------
# GUNICORN
export GUNICORN_PROJECT_DIR="/home/ubuntu/gunicorn-project"


# ------------------------------------------------------------------
# NGINX
# change this to your domain name. Eg: abc.com
export NGINX_SERVER_NAME="localhost"
alias nginx-restart="sudo systemctl restart nginx.service"
alias nginx-status="sudo systemctl restart nginx.service"

# ------------------------------------------------------------------
# POSTGRES

export PG_VERSION="12"
export PG_ALLOWED_IP_ADDRESS=""

# ------------------------------------------------------------------
# Journalctl
alias journalctl-gunicorn="sudo journalctl -u gunicorn -f"
alias journalctl-gunicorn-socket="sudo journalctl -u gunicorn.socket -f"
alias journalctl-nginx="sudo journalctl -u nginx -f"
alias journalctl-celeryworker="sudo journalctl -u celeryworker -f"
alias journalctl-celerybeat="sudo journalctl -u celerybeat -f"

# Path --------------------------------------------------------------
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

echo "$HOME/.bashrc_server loaded...."
