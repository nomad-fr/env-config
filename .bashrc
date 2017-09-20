
# start the agent automatically and make sure that only one ssh-agent
# process runs at a time

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi


# this below for a color prompt


PS1='\[\033[01;34m\]\u\[\033[1;31m\]@\[\033[1;31m\]\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[00m\]\$ '

if [ "$USER" = 'root' ]
then
    PS1='\[\033[01;31m\]\u\[\033[1;31m\]@\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[00m\]\$ '
fi
    
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR='emacs -nw'
#export PATH='/usr/bin:'$PATH

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

export NO_AT_BRIDGE=1

# added by Anaconda2 4.1.1 installer
#export PATH="/local/anaconda/bin:$PATH"

# git
#GIT_PROMPT_ONLY_IN_REPO=1
#source /home/nomad/VersionControl/GitHub/bash-git-prompt/gitprompt.sh
