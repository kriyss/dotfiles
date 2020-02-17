export TERMINAL=alacritty
export ZSH=/home/kriyss/.oh-my-zsh

source $HOME/.zshrc.d/credentials.sh
source $ZSH/oh-my-zsh.sh

ZSH_THEME="agnoster"

plugins=(git autojump)


export PATH=$PATH:/home/kriyss/tools
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

## Java
export JDK_HOME=/home/kriyss/tools/jdk1.8/
export JAVA_HOME=/home/kriyss/tools/jdk1.8/
export JRE_HOME=/home/kriyss/tools/jdk1.8/jre/

## Go
export PATH=$PATH:"/usr/local/go/bin"
export PATH=$PATH:"/home/kriyss/go/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
#export FZF_DEFAULT_OPTS=" --ansi --preview-window 'right:60%' --preview 'bat --theme=Nord --style=numbers --color=always {}'"
export FZF_DEFAULT_OPTS=" --ansi"


function goactivate() {
	export GOPATH=$(pwd)
}

## Make
alias mi='make install'
alias mr='make run'
alias mb='make build'
alias mt='make test'
alias mti='make it'
alias mte='make e2e'
alias mta='make test it e2e'

## Common mistake
alias gti='git'
alias lm='ls'

alias sl='ls'

alias vi='nvim'
alias vin='nvim'
alias vim='nvim'

alias vims='vim ~/.config/nvim/init.vim'

alias cat='bat'
alias ping='prettyping --nolegend'


# add support for ctrl+o to open selected file in VS Code
alias top='htop'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'

alias rs="sudo systemctl start mongodb.service && sudo systemctl start rabbitmq.service "

alias last_installed="rg -i installed /var/log/pacman.log"
