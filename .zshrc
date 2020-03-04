export TERMINAL=alacritty
export ZSH=/home/kriyss/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

## Environments
## ============================================================================
source $HOME/.zshrc.d/credentials.sh

export PATH=$PATH:"/home/kriyss/tools"
export PATH=$PATH:"$HOME/.yarn/bin"
export PATH=$PATH:"$HOME/.config/yarn/global/node_modules/.bin"

## Java
export JDK_HOME=/home/kriyss/tools/jdk1.8/
export JAVA_HOME=/home/kriyss/tools/jdk1.8/
export JRE_HOME=/home/kriyss/tools/jdk1.8/jre/

## Go
export PATH=$PATH:"/usr/local/go/bin"
export PATH=$PATH:"/home/kriyss/go/bin"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
#export FZF_DEFAULT_OPTS=" --ansi --preview-window 'right:60%' --preview 'bat --theme=Nord --style=numbers --color=always {}'"
export FZF_DEFAULT_OPTS=" --ansi"

## Functions
## ============================================================================

function goactivate() {
	export GOPATH=$(pwd)
}

## Aliases
## ============================================================================

# Make
alias mi='make install'
alias mr='make run'
alias mb='make build'
alias mt='make test'
alias mti='make it'
alias mte='make e2e'
alias mta='make test it e2e'

# Common mistake
alias gti='git'
alias lm='ls'

alias sl='ls'

alias vi='nvim'
alias vin='nvim'
alias vim='nvim'

# Helpers
alias vims='vim ~/.config/nvim/init.vim'
alias rs="sudo systemctl start mongodb.service && sudo systemctl start rabbitmq.service "
alias last_installed="rg -i installed /var/log/pacman.log"

# Overrides
alias cat='bat'
alias ping='prettyping --nolegend'
alias top='htop'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
