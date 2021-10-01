# 
# https://geoff.greer.fm/lscolors/

# enable color support of ls and also add handy aliases
if [[ "$OSTYPE" == "linux-gnu" ]]
then
	if [ "$TERM" != "dumb" ]; then
    	   eval "`dircolors -b`"
    	   alias ls='ls --color=auto -F'
	fi

	# notes : http://linux-sxs.org/housekeeping/lscolors.html
	# The available color codes are:
	#
	# 0   = default colour
	# 1   = bold
	# 4   = underlined
	# 5   = flashing text
	# 7   = reverse field
	# 31  = red
	# 32  = green
	# 33  = orange
	# 34  = blue
	# 35  = purple
	# 36  = cyan
	# 37  = grey
	# 40  = black background
	# 41  = red background
	# 42  = green background
	# 43  = orange background
	# 44  = blue background
	# 45  = purple background
	# 46  = cyan background
	# 47  = grey background
	# 90  = dark grey
	# 91  = light red
	# 92  = light green
	# 93  = yellow
	# 94  = light blue
	# 95  = light purple
	# 96  = turquoise
	# 100 = dark grey background
	# 101 = light red background
	# 102 = light green background
	# 103 = yellow background
	# 104 = light blue background
	# 105 = light purple background
	# 106 = turquoise background
	#
	# These can even be combined, so that a parameter like:
	# di=5;31;42
	# in your LS_COLORS variable would make directories appear
	# in flashing red text with a green background!

	# di = directory
	# fi = file
	# ln = symbolic link
	# pi = fifo file
	# so = socket file
	# bd = block (buffered) special file
	# cd = character (unbuffered) special file
	# or = symbolic link pointing to a non-existent file (orphan)
	# mi = non-existent file pointed to by a symbolic link
	#      (visible when you type ls -l)
	# ex = file which is executable (ie. has 'x' set in permissions).
	# ow=34;42 OTHER_WRITABLE 34;42 # dir that is other-writable (o+w) and not sticky
	# STICKY_OTHER_WRITABLE 30;42 # dir that is sticky and other-writable (+t,o+w)
	# st STICKY 37;44 # dir with the sticky bit set (+t) and not other-writable
	
	# See : `dircolor -p`
	
	# alias ls='ls --color'
	LS_COLORS='di=33:fi=0:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=92:ow=0;41'
 	export LS_COLORS
	
	# some more ls aliases
	alias ll='ls -l'
	alias la='ls -A'
	
elif [[ "$OSTYPE" == "freebsd"* ]]
then
     	alias ls='ls -G -F'

	# notes : http://plug-and-pray.blogspot.fr/2008/02/lscolors.html
	# The available color codes are: see man ls \LSCOLORS

	# pairs for each file type to suitable color
	 
	DIR=Dx            # directory
	SYM_LINK=Gx       # symbolic link
	SOCKET=Fx         # socket
	PIPE=dx           # pipe
	EXE=Cx            # executable
	BLOCK_SP=Dx       # block special
	CHAR_SP=Dx        # character special
	EXE_SUID=hb       # executable with setuid bit set
	EXE_GUID=ad       # executable with setgid bit set

	DIR_STICKY=xe     # directory writable to others, with sticky bit

	DIR_WO_STICKY=eb  # directory writable to others, without sticky bit
	
	export LSCOLORS="$DIR$SYM_LINK$SOCKET$PIPE$EXE$BLOCK_SP$CHAR_SP$EXE_SUID$EXE_GUID$DIR_STICKY$DIR_WO_STICKY"
	export CLICOLOR="YES"
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
<lias emacs='/usr/bin/emacs -mm'  
alias emacsclient='emacsclient -c'
>