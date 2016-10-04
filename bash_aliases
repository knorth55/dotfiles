# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#ROS aliases
alias irteusgl="rlwrap -c -b '(){}[],&^%$#@"";|\' irteusgl"
alias roseus="rlwrap -c -b '(){}[],&^%$#@"";|\' roseus"
alias rl="roslaunch"
alias rr="rosrun"
alias rp="rostopic"
#Gvim
#alias gvim="gvim --remote-tab"
#tmux
#alias tmux="tmux new-session"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
#git alias
alias gd="git diff"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias grbm="git rebase origin/master"
alias grbmi="git rebase origin/master -i"
alias gf='git fetch --prune --verbose'
alias gft='git fetch --prune --tags --verbose'
alias gfa='git fetch --all --prune --verbose'
alias gfat='git fetch --all --prune --tags --verbose'
alias gpm="git push origin master"
alias gpm!="git push origin master -f"
