# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# allow execution of ruby gems
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem

# add gam to the path
PATH="$PATH:$HOME/bin/gam"

# Path to your oh-my-zsh installation.
export ZSH=/home/jim/.oh-my-zsh

# Set nano as default editor
export EDITOR=nano

# ssh-agent - https://eklitzke.org/using-ssh-agent-and-ed25519-keys-on-gnome
eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
export SSH_AUTH_SOCK

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# zsh-syntax-highlighting must be last!
plugins=(git npm aws zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export EDITOR=nano

# Powerline
# . /home/jim/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

MXDIR=~/Documents/code/maritimexchange/
MXBDIR=~/Documents/code/maritimexchange-backend/
MXADIR=~/Documents/code/maritimexchange-analytics/

alias dotfiles="~/dotfiles-manjaro-i3/scripts/dotfiles"
alias cdmxb="cd $MXBDIR"
alias cdmxa="cd $MXBDIR"
alias cdmx="cd $MXDIR"
# alias mx="terminator --layout mx"
alias mx="cd $MXBDIR && source ./python/venv/bin/activate && npm start & termite --hold -e \"zsh -c 'cd $MXDIR && npm start'\""
alias mxa="cd "$MXADIR/python/mx" && . ../../venv/bin/activate && python ./api.py"
alias c="tput reset"
alias disconnectWiFi="nmcli d disconnect wlp2s0"
alias screenSingle1080="sh ~/.screenlayout/single-1080.sh"
alias screenDual1080="sh ~/.screenlayout/dual-1080.sh"
alias naturalScrolling="sh ~/dotfiles-manjaro-i3/scripts/natural-scrolling.sh"
alias vpnMXup="nmcli con up jim-mx-vpn"
alias vpnMXdown="nmcli con down jim-mx-vpn"
alias vpnMXrecon="nmcli con down jim-mx-vpn && nmcli con up jim-mx-vpn"
alias vpnSup="nmcli con up sangwinenet"
alias vpnSdown="nmcli con down sangwinenet"
alias dconfUpdate="cat ~/.config/dconf/user.d/*.dconf | dconf load /"
# fun aliases
alias starwarsascii="telnet towel.blinkenlights.nl"
alias cmatrix="cmatrix -C cyan"

# MOTD
if [[ -d ~/.motd.d ]]; then
    for motd in ~/.motd.d/*; do
      if [ ! -d "$motd" ]; then
        zsh $motd
      fi
    done
fi

# Script to allow opening terminator with continuous commands
# Enter custom commands in ~/.config/terminator/config like this:
# env INIT_CMD="cd bla; npm start" zsh
echo $INIT_CMD
if [ ! -z "$INIT_CMD" ]; then
    OLD_IFS=$IFS
    setopt shwordsplit
    IFS=';'
    for cmd in $INIT_CMD; do
        print -s "$cmd"  # add to history
        eval $cmd
    done
    unset INIT_CMD
    IFS=$OLD_IFS
fi
