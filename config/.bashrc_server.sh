

# TERMINAL ---------------------------------------------------------


#ls
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias ls="ls --color=always"

# less
alias less="less -R"

#git
export GIT_EDITOR=vim

#HSTR
alias hh=hstr                    
export HSTR_CONFIG=hicolor,no-confirm
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=-1	        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# autojump
source  /usr/share/autojump/autojump.sh 
alias jl="j --s | fzf"

# Starship
eval "$(starship init bash)"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"


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

alias less="less -R" 			# always display colors
alias tree="tree -C"			# always display colors

# bashrc
alias bashrc_reload="source ~/.bashrc"
alias rl=reload_bashrc
alias bashrc_edit="vim ~/.bashrc"
#alias ed=edit_bashrc

# open a random file in vim
alias tvim="mktemp | vim -"

# PYTHON ---------------------------------------------------------

alias p="python"
alias va="source venv/bin/activate"
alias da="deactivate"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


echo "~/.bashrc_server loaded...."