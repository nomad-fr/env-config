

# enable color support of ls and also add handy aliases
if [[ "$OSTYPE" == "linux-gnu" ]]
then
	if [ "$TERM" != "dumb" ]; then
    	   eval "`dircolors -b`"
    	   alias ls='ls --color=auto'
	fi

	# some more ls aliases
	alias ll='ls -l'
	alias la='ls -A'
elif [[ "$OSTYPE" == "freebsd"* ]]
then
     	alias ls='ls -G'
	export CLICOLOR='true'
	export LSCOLORS='GxfxcxdxBxegedabagacad'
fi

alias grep='grep --color'
#alias grep='grep --color=always'
alias emacs='emacs -nw'
alias tmux='tmux -u'
alias watch='watch --color'
alias less='less -r'
alias grep='grep --color'


# # anaconda
# alias conda_activate='source /localstorage/Anaconda/bin/activate /localstorage/Anaconda'
# alias conda_deactivate='source /localstorage/Anaconda/bin/deactivate'
# 
# # anaconda
# alias conda_activate='source /local/anaconda/bin/activate /local/anaconda'
# alias conda_deactivate='source /local/anaconda/bin/deactivate'

# emacs
alias emacs='/usr/local/bin/emacs -mm'  
#emacs() { emacs-25.1.50 -mm -bg black "$@" ;}>>>>>>> .r122
