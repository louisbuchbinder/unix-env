bindkey -v
bindkey '^R' history-incremental-search-backward
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

if test -f ~/.bashrc; then;
  source ~/.bashrc
fi
