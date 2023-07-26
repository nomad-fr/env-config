# SET PATH

PATH=$PATH:~/bin

# # start the agent automatically and make sure that only one ssh-agent
# # process runs at a time

# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent > ~/.ssh-agent-thing
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#     eval "$(<~/.ssh-agent-thing)"
# fi

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
# __conda_setup="$('/localstorage/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/localstorage/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/localstorage/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/localstorage/anaconda3/bin:$PATH"

# __conda_setup="$('/localstorage/nomad/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/localstorage/nomad/conda/etc/profile.d/conda.sh" ]; then
#         . "/localstorage/nomad/conda/etc/profile.d/conda.sh"
#     else
#         export PATH="/localstorage/nomad/conda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<


