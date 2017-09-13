# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

### START-Keychain ###
# Let  re-use ssh-agent and/or gpg-agent between logins
#/usr/bin/keychain $HOME/.ssh/id_dsa_lsv
#source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###

if [ `uname -s` = "FreeBSD" ]
then
    set LC_CTYPE=en_US.UTF-8
fi

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -L ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

