# environment vars
export ZSH=/Users/harry/.oh-my-zsh
export GOPATH=$HOME/git:$HOME/.go:$GOPATH
export PATH=$HOME/bin:/usr/local/bin:$GOPATH.bin:$PATH
export HEROKU_ORGANIZATION=elilillyco

# omzsh config
ZSH_THEME="aussiegeek"
HYPHEN_INSENSITIVE="true"

plugins=(
  git
  yarn
  node
  osx
  brew
  npm
)

# setup zsh functions
source $ZSH/oh-my-zsh.sh
source /Users/harry/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias'
alias zshc="vim ~/.zshrc"
alias gcl="git stash save && git stash clear"
alias g=git
alias "git fetch"="git fetch --verbose"
alias gs='git status'
alias pg=postgres
alias 'hl'='heroku login --sso'
alias h=heroku
alias c="code-insiders"

# larger functions
function gp() {
  git add .
  git commit -m "$@"
  git push
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"

# nvm setup
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

