# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#alias vi='vimx'
#system clipboard support for vimx
#which vimx > /dev/null 2>&1
if [[ -n `which vimx` ]]; then
#if [ $? == 0 ]; then
    alias vim='vimx'
fi


if [ "`id -u`" -eq 0 ]; then
    PS1="\e[0;37m[\e[0;31m\u\e[0;32m@\[\e[0;34m\]\h \e[0;34m\e[4;35m\w\e[0m\e[0;37m:(\$(ls | wc -l))]\n\e[0;31m# \[\e[0m\]"
    # PS1="\e[0;32m|\d \t| \e[0;37m[\e[0;31m\u\e[0;32m@\[\e[0;34m\]\h \e[0;34m\e[4;35m\w\e[0m\e[0;37m:(\$(ls | wc -l))]\n\e[0;31m# \[\e[0m\]"
else
    # PS1="\e[0;36m|\d \t| \e[0;37m[\e[0;31m\u\e[0;32m@\[\e[0;34m\]\h:\e[4;35m\w\e[0m\e[0;37m:(\$(ls | wc -l))]\n$ \[\e[0m\]"
    PS1="\e[0;37m[\e[0;31m\u\e[0;32m@\[\e[0;34m\]\h:\e[4;35m\w\e[0m\e[0;37m:(\$(ls | wc -l))]\n$ \[\e[0m\]"
fi

#export TERM=xterm-256color vim
# if [[ ($COLORTERM == gnome-terminal || $(cat /proc/$PPID/cmdline) == *gnome-terminal* )
    # && $TERM != screen* ]]; then
    # export TERM=xterm-256color vim
# fi
export TERM=xterm-256color


#For ubuntu solarized color, put following line into .profile in ubuntu
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#fi
#
#alias l.='ls -d .* --color'
#alias ll='ls -l --color'
#alias ls='ls --color' 


#For tmux
export LD_LIBRARY_PATH=/usr/local/lib
alias tmux='tmux -2'
#Automatically start tmux session while gnome-terminal started 

# if [[ -n `ps -ef|grep -i gnome-terminal|grep -v grep` ]] &&
    # [[ -z `ps -ef|grep -i tmux|grep -v grep` ]]; then
# WHOAMI=$(whoami)
# tmux new -s $WHOAMI
# fi

#Automatically Attach tmux in SSH Session
# if [[ "$TMUX" == "" ]]; then
        # #[[ "$SSH_CONNECTION" != "" ]]; then   #If a tmux session is started for SSH connections, simply delete this line.
    # # Attempt to discover a detached session and attach
    # # it, else create a new session
    # WHOAMI=$(whoami)
    # if tmux has-session -t $WHOAMI 2>/dev/null; then
    # tmux attach-session -t $WHOAMI
    # else
        # tmux new-session -s $WHOAMI
    # fi
# fi
#Show IP/Hostname in tmux
#My conn script is for ssh remote server without password
#conn() {
#    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
#        tmux rename-window "$*"
#        command conn "$@"
#        tmux set-window-option automatic-rename "on" 1>/dev/null
#    else
#        command conn "$@"
#    fi
#}
#ssh() {
#    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
#        tmux rename-window "$*"
#        command ssh "$@"
#        tmux set-window-option automatic-rename "on" 1>/dev/null
#    else
#        command ssh "$@"
#    fi
#}
#
eval `dircolors ~/.dircolors`
