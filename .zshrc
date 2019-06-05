export PATH=$PATH:/usr/local/go/bin:/home/kriyss/.cargo/bin
export PATH=$PATH:/home/kriyss/tools
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export JDK_HOME=/home/kriyss/tools/jdk1.8/
export JAVA_HOME=/home/kriyss/tools/jdk1.8/
export JRE_HOME=/home/kriyss/tools/jdk1.8/jre/
export ZSH=/home/kriyss/.oh-my-zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function goactivate() {
	export GOPATH=$(pwd)
}

ZSH_THEME="agnoster"
ZSH_TMUX_AUTOSTART="true"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true" # _ and - will be interchangeable.
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="dd/mm/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git tmux autojump)

source $HOME/.credentials.sh
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

## alias
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
alias top='htop'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
alias start_services="sudo systemctl start mongodb.service && sudo systemctl start rabbitmq.service "
alias last_installed="grep -i installed /var/log/pacman.log"