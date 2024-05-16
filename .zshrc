ZSH=${HOME}/.local/share/oh-my-zsh

if [[ ! -d $ZSH ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh ${ZSH}
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH}/plugins/zsh-autosuggestions
fi

ZSH_THEME="gentoo"
HISTSIZE=200

plugins=(
  git
  zsh-navigation-tools
  zsh-autosuggestions
  fzf
  safe-paste
)


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export MOZ_ENABLE_WAYLAND=1
export DESKTOP_APP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY=1
export PAGER=less
export MANPAGER=less
export EDITOR=nvim
export DOCKER_BUILDKIT=1

alias em='emacsclient -nw'
alias dbx='TERM=xterm-256color distrobox'
alias ros='rlwrap ros'
alias ssh='TERM=xterm-256color ssh'

export PATH="$PATH:/home/${USER}/.cargo/bin:/home/${USER}/texlive/bin/x86_64-linux:/home/${USER}/.local/bin:/home/${USER}/.roswell/bin"

zstyle ':completion:*:*:-command-:*:*' ignored-patterns 'nvm_prompt_info'

source $ZSH/oh-my-zsh.sh
source "${HOME}"/.config/zsh/bindings/bindings.zsh
