export TERMINAL=alacritty
export ZSH=/home/kriyss/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git autojump)

source $HOME/.zshrc.d/env.sh
source $HOME/.zshrc.d/func.sh
source $HOME/.zshrc.d/alias.sh
source $HOME/.zshrc.d/keymap.sh
source $HOME/.zshrc.d/credentials.sh

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_OPTS=" --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"