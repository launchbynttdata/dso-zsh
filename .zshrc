function pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

function pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
zstyle ':omz:update' mode auto

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# AWS Env Vars
export AWS_ACCOUNT=${AWS_ACCOUNT:-⎈}
export AWS_PROFILE=${AWS_PROFILE:-launch-dso-awspoweruseraccess}
export AWS_DEFAULT_REGION=us-east-2
export AWS_REGION=${AWS_REGION:-$AWS_DEFAULT_REGION}

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  aws # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aws
  asdf # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
  docker # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
  docker-compose # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose
  git # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  history # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history
  repo # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/repo
  terraform # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/terraform
  themes # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/themes
  zsh-interactive-cd # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd

  # Custom
  # alias-tips # https://github.com/djui/alias-tips
  # fast-syntax-highlighting # https://github.com/zdharma-continuum/fast-syntax-highlightingAdd alias for podman so we can replace docker with podman as our local container engine
)

if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

alias src="exec zsh"
#alias docker=podman

#Disable autocorrect
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true" 

source $ZSH/oh-my-zsh.sh
