# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]
    then
	[ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    elif [[ "$OSTYPE" == "freebsd"* ]]
    then
	clear
    fi
fi
