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
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export ZSH=/home/hjf/.oh-my-zsh
export GOPATH=$HOME/.go


# ZSH Config
source $ZSH/oh-my-zsh.sh
ZSH_THEME="avit"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git node bower github jsontools npm ubuntu nyan)


# ALIAS'
alias upd="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && notify-send \"updates complete\""
alias mdpdf="md-to-pdf"
alias r="sudo -i"
alias sude="sudo -E"
alias pip=pip3
alias py=python3
alias gs='git status'
alias ga='git add'
alias gb='git checkout -b'
alias gc='git checkout'
alias 'npm install --save'='yarn add'
alias 'npm install --save-dev'='yarn add --dev'
alias 'npm uninstall --save'='yarn remove'
alias 'npm install'='yarn add'


# Syntax highlighting
source /home/hjf/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fpath=($fpath "/home/harry/.zfunctions")

# Spaceship config
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_BATTERY_THRESHOLD=75
SPACESHIP_PROMPT_ORDER=(time user dir host git node docker line_sep battery jobs exit_code char)