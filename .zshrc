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
fpath=(~/.zsh/functions $fpath)

autoload -U promptinit
promptinit
prompt skia

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

# Set title to GNU screen/byobu tab
settitle() {
    if [ "$TERM" = "screen" ];
    then
        printf "\033k$1\033\\";
    fi
}

# Set title when sshing within a tab to some host
ssh() {
    host=$(echo "$*" | sed "s/^.\+@\([^ ]\+\)[ \n]*.*/\1/")
    settitle $host
    command ssh "$@"
    settitle $(hostname)
}

AddYear() {
    mv $1 "$2 - $1"
}

FlacToOpus() {
    find -type f -name "*.flac" -print0 | while read -d $'\0' a; do
        opusenc --bitrate 192 "$a" "${a[@]/%flac/opus}"
    done
}

darkvador() {
    A="440"
    Ab="415.3"
    F="349.2"
    C="523.2"
    E="659.3"
    HF="698.5"

    beep -f $A -l 600; sleep 0.1
    beep -f $A -l 600; sleep 0.1
    beep -f $A -l 600; sleep 0.1
    beep -f $F -l 450; sleep 0.1
    beep -f $C -l 150; sleep 0.1
    beep -f $A -l 600; sleep 0.1
    beep -f $F -l 450; sleep 0.1
    beep -f $C -l 150; sleep 0.1
    beep -f $A -l 1200; sleep 0.1

    beep -f $E -l 600; sleep 0.1
    beep -f $E -l 600; sleep 0.1
    beep -f $E -l 600; sleep 0.1
    beep -f $HF -l 450; sleep 0.1
    beep -f $C -l 150; sleep 0.1
    beep -f $Ab -l 600; sleep 0.1
    beep -f $F -l 450; sleep 0.1
    beep -f $C -l 150; sleep 0.1
    beep -f $A -l 1200; sleep 0.1
}

lock () {
    scrot /tmp/screenshot.png
    convert /tmp/screenshot.png -blur 5x5 /tmp/lock.png
    i3lock -i /tmp/lock.png
}

source ~/.aliases
