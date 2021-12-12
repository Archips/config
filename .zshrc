if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

#   vim
export DOTVIM=$HOME/.vim
bindkey -v                                                          # enable vim keybinding ( $ bindkey -l )
export EDITOR=vim
export KEYTIMEOUT=1                                                 # 10ms vi MODES transition
autoload -U history-search-end                                      # navigate history with NORMAL 'j' and 'k'
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -M vicmd 'k' history-beginning-search-backward-end
bindkey -M vicmd 'j' history-beginning-search-forward-end
#   completion
autoload -Uz compinit && compinit                                   # commands completion
zstyle ':completion:*' menu select                                  # highlight suggestion
zmodload zsh/complist                                               # <S-Tab> reverse navigation
bindkey -M menuselect '^[[Z' reverse-menu-complete
#   history
bindkey "^R" history-incremental-search-backward                    # enable Ctrl-R i-search-bck
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE
export HISTFILE=$HOME/.zsh_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

#   aliases
if [[ "$OSTYPE" == "darwin"* ]]; then       # enable ls colors
    alias ls="ls -G"
    alias la="ls -G -lah"
elif [[ "$OSTYPE" == "linux"* ]]; then
    alias ls="ls --color=auto"
    alias la="ls --color=auto -lah"
    if type setxkbmap &> /dev/null; then    # swap Ctrl and Capslock
        setxkbmap -option 'ctrl:swapcaps'
    fi
fi

alias grep='grep --color=auto'              # enable grep colors
alias vi='vim'

#   git aliases
alias gs="git status"
alias ga="git add"
alias gap="git add -p"
alias gcm="git commit -m"
alias gcv="git commit -v"
alias gcp="git commit -p"
alias gca="git commit --amend"
alias gr="git reset"
alias gl="git log"
alias gd="git diff"
alias gp="git push"
