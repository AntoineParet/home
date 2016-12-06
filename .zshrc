# Created by newuser for 2.2.9
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
alias starwars="telnet towel.blinkenlights.nl"
alias ll='ls --color=auto -alhF'
alias ls='ls --color=auto -h'
alias grep='grep --color=auto'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias full-update='update && upgrade'
alias s='apt search'
alias i="sudo apt install"
alias less='less -r'
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias poogle="ping google.com"
alias moc="mocp -T transparent-background"
alias rasp="ssh skip@Argenta"
alias raspco=" ssh-add && rasp"

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

source ~/.aliases
