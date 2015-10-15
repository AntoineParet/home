# Created by newuser for 4.3.9
autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches found%b'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' menu select=2
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                           /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

autoload -U promptinit
promptinit
prompt adam2

autoload -U bashcompinit
bashcompinit

export HISTSIZE=2000
export HISTFILE=$HOME/.history
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt extendedglob
setopt clobber

# Binkeys
typeset -A key
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[2~" beep
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# Aliases
alias ll='ls --color=auto -alh'
alias ls='ls --color=auto -h'
alias grep='grep --color=auto'
alias update='sudo aptitude update'
alias upgrade='sudo aptitude upgrade'
alias full-update='update && upgrade'
alias i="sudo aptitude install"
alias purge="sudo aptitude purge"
alias s='aptitude search'
alias less='less -r'
alias unzip-all="7z x -y '*.zip'"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# System aliases
alias dodo="sudo shutdown now -h"
alias goodnight="sudo shutdown -h +90"
alias reboot="sudo reboot"
alias byebye="sudo lock && sudo pm-suspend"
alias SX="startx &; disown startx; exit"
alias VPN="sudo service openvpn"

# Misc
alias commit='curl -s http://whatthecommit.com/index.txt'
alias compil="gcc -Wall -Werror -ansi -g"
alias report="pandoc -V geometry:margin=1in -V fontsize:11pt"
alias latexclean="rm *.aux; rm *.log; rm *.out; rm *.toc; rm *.snm; rm *.nav"
alias poogle="ping google.com"
alias moc="mocp -T transparent-background"
alias MEMODUALSCREEN="echo 'xrandr --output VGA1 --mode 1440x900 --right-of LVDS1'"
alias starwars="telnet towel.blinkenlights.nl"

# Shortcut aliases
alias RADARE="cd /home/skia/Prog/radare2"
alias GI02="cd /home/skia/Documents/UTBM/GI02"

# SSH aliases
alias Tatooine="ssh skia@skia.mooo.com"
alias Dagobah="ssh skia@10.20.0.102"
alias DagobahLAN="Dagobah"
alias DagobahWAN="ssh skia@dagobah.libskia.so"
alias Alderaan="ssh skia@10.20.0.101"
alias Libskia.so="ssh skia@libskia.so"

# ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi


case $TERM in
   xterm*)
       precmd () {print -Pn "\e]0;%n@%m: %~\a"}
       ;;
esac

srv(){
   sudo /etc/init.d/$1 $2
}
compdef _service srv

export SDL_NOMOUSE=1

