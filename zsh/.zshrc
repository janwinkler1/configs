# Set up the prompt

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=209'
source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias ll="ls -la"
alias mountskynet="sudo mount -t cifs //skynet.wuestundpartner.com/Projekte /mnt/skynet -o credentials=/home/jwi/.smbcredentials"
alias unmountskynet="sudo umount /mnt/skynet"
alias backup="./backup.sh"
alias black-docker="docker run --rm -v \$(pwd):/data cytopia/black:latest"
alias prettier-check="docker run --rm -v \$(pwd):/app tmknom/prettier:latest@sha256:8809a179395bc38f305dab67aa16d9d94d84348309fba87442548485fd7c71ee prettier --check /app"
alias prettier-write="docker run --rm -v \$(pwd):/app tmknom/prettier:latest@sha256:8809a179395bc38f305dab67aa16d9d94d84348309fba87442548485fd7c71ee prettier --write /app"
alias gitka="gitk --all"

# autoload -Uz promptinit
# promptinit
# prompt adam1

# setopt histignorealldups sharehistory

# # Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# # Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
# HISTSIZE=1000
# SAVEHIST=1000
# HISTFILE=~/.zsh_history

# # Use modern completion system
# autoload -Uz compinit
# compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

