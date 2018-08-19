export PATH=$PATH:/usr/local/go/bin:/home/kriyss/.cargo/bin
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
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true" # _ and - will be interchangeable.
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="dd/mm/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source /etc/profile.d/autojump.zsh
source $HOME/.credentials.sh
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

## alias