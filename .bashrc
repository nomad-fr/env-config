# SET PATH

PATH=$PATH:~/bin

# necessaire pour ssh via foot
if [ "$TERM" = "foot" ]
then
TERM=xterm-256color
fi


# eval `keychain --eval --agents ssh ~/.ssh/id_rsa_ipgp ~/.ssh/id_rsa_neuronfarm`

# # start the agent automatically and make sure that only one ssh-agent
# # process runs at a time
ssh_pid_file="$HOME/.config/ssh-agent.pid"
SSH_AUTH_SOCK="$HOME/.config/ssh-agent.sock"
if [ -z "$SSH_AGENT_PID" ]
then
	# no PID exported, try to get it from pidfile
	SSH_AGENT_PID=$(cat "$ssh_pid_file")
fi

if ! kill -0 $SSH_AGENT_PID &> /dev/null
then
	# the agent is not running, start it
	rm "$SSH_AUTH_SOCK" &> /dev/null
	>&2 echo "Starting SSH agent, since it's not running; this can take a moment"
	eval "$(ssh-agent -s -a "$SSH_AUTH_SOCK")"
	echo "$SSH_AGENT_PID" > "$ssh_pid_file"
	ssh-add -A 2>/dev/null

	>&2 echo "Started ssh-agent with '$SSH_AUTH_SOCK'"
# else
# 	>&2 echo "ssh-agent on '$SSH_AUTH_SOCK' ($SSH_AGENT_PID)"
fi
export SSH_AGENT_PID
export SSH_AUTH_SOCK



# if [ ! -f "${HOME}/.gpg-agent-info" ] && [ -S "${HOME}/.gnupg/S.gpg-agent" ] && [ -S "${HOME}/.gnupg/S.gpg-agent.ssh" ]; then
#     echo "GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent" >> "${HOME}/.gpg-agent-info";
#     echo "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh" >> "${HOME}/.gpg-agent-info";
# fi

# if [ -f "${HOME}/.gpg-agent-info" ]; then
#     . "${HOME}/.gpg-agent-info"
#     export GPG_AGENT_INFO
#     export SSH_AUTH_SOCK=
#     export GPG_TTY="$(tty)"
#     gpg-connect-agent updatestartuptty /bye >& /dev/null
# fi



# # Start the gpg-agent if not already running
# if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
#   gpg-connect-agent /bye >/dev/null 2>&1
# fi

# # Set SSH to use gpg-agent
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
# fi

# # Set GPG TTY
# export GPG_TTY=$(tty)

# # Refresh gpg-agent tty in case user switches into an X session
# gpg-connect-agent updatestartuptty /bye >/dev/null



# this below for a color prompt


PS1='\[\033[01;94m\]\u\[\033[1;31m\]@\[\033[1;96m\]\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[00m\]\$ '

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

export NO_AT_BRIDGE=1

# git
GIT_PROMPT_ONLY_IN_REPO=1
source /home/nomad/VersionControl/GitHub/bash-git-prompt/gitprompt.sh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/local/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/local/miniconda/etc/profile.d/conda.sh" ]; then
        . "/local/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/local/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


