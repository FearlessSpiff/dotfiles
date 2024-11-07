# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep nomatch
unsetopt autocd extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/steph/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias ll='ls -alh --color'
alias grep='grep --color=auto'
# NCA stuff
#
# don't need this here: 
source /usr/share/nvm/init-nvm.sh
#
# but instead this
#export PATH=$PATH:/opt/javascript/ncanode/20.10.0/node/bin:/Users/sdick/Library/Python/3.9/bin

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^[[1;5D"  backward-word
bindkey  "^[[1;5C"  forward-word

source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
