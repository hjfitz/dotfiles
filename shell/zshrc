#########################################################################
#                                                                       #
#    _____    __ _____    _____ _____ _____    _____     _              #
#   |  |  |__|  |   __|  |__   |   __|  |  |  |   __|___| |_ _ _ ___    #
#   |     |  |  |   __|  |   __|__   |     |  |__   | -_|  _| | | . |   #
#   |__|__|_____|__|     |_____|_____|__|__|  |_____|___|_| |___|  _|   #
#                                                               |_|     #
#                                                                       #
#########################################################################


# ENVIRONMENT
export PATH=$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH
export ZSH=/Users/hjf/.oh-my-zsh
export GOPATH=$HOME/code/go
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# ZSH Config
ZSH_THEME="avit"
source $ZSH/oh-my-zsh.sh
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git osx node github jsontools npm zsh-vi-mode)

function checkArgs() {
  echo "arg: \$1: $1"
}

function makeChecklist() {
	grep -e '^#' $1 | sed 's/^###/- \[ \]/' | tee tasks.md
}

# ALIAS'
alias dsrm="find . -name '.DS_Store' -type f -delete"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias v="vim"
alias sv="screen vim -S vim"
alias mdpdf="md-to-pdf"
alias r="sudo -i"
alias sude="sudo -E"
alias pip=pip3
alias py=python3
alias gs='git status'
alias ga='git add'
alias gb='git checkout -b'
alias gc='git checkout'
alias gcl="git stash save && git stash clear"
alias tf=terraform
alias mdl="mdless -I"
alias vim=nvim
alias temp='sudo powermetrics 2>/dev/null | grep -i "temperature"'
alias rgr=ranger
alias rimraf='rm -rf'

# Syntax highlighting
source /Users/hjf/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor pattern)
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_PATTERNS+=('rm*-rf*' 'fg=red,bold')
ZSH_HIGHLIGHT_PATTERNS+=('sudo rm*-rf*' 'fg=white,bold,bg=red')


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/Users/hjf/.zfunctions")

# Spaceship config
#autoload -Uz promptinit
#  promptinit
#  prompt "spaceship"
# SPACESHIP_BATTERY_THRESHOLD=75
# SPACESHIP_PROMPT_ORDER=(time user dir host git node docker line_sep battery jobs exit_code char)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/hjf/.local/bin/terraform terraform

export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.config/less/termcap ]] && . ~/.config/less/termcap

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
