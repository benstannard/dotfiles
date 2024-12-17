# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


####### Ben Bash Aliases Copied Over #####
# PATH
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# VSCode now
export EDITOR=nvim
export GIT_EDITOR=nvim

# simplify bash (ls)
# alias l='ls -1'
# alias ll='ls -lah'
# alias ls='ls --group-directories-first'
alias a='algolia'
alias lsf='find . -maxdepth 10'
alias lsfm='find . -maxdepth 10 -exec du -h {} +'
alias curltime="curl -w \"@$HOME/.curl-format.txt\" -o /dev/null -s "

# simplify bash (fg = ja, jb, jc...)
alias ja='fg %1'
alias js='fg %2'
alias jd='fg %3'
alias jf='fg %4'

# one key alias
# alias m='emacs'
alias m='nvim'
alias pst='pstree -p'
alias b='bat' # r short for read, call full command  batcat on some systems
alias s='rg' # s short for search
alias f='fdfind' # f short for find

# exa
# alias e='exa -all --tree --long --header --no-user --no-time --git --level=1' # exa files as tree, depth level 1
# alias ee='exa --tree --long --header --no-user --no-time --git' # exa files as tree
# alias edd='exa --only-dirs --tree --long --header --level=1 ' # exa only directories as tree, depth level 1
# alias l='exa -all --tree --long --header --no-user --no-time --git --level=1' # exa files as tree, depth level 1
alias l='ls -alh'
alias ld='exa --only-dirs --tree --long --header --level=1 ' # exa only directories as tree, depth level 1
alias ll='exa --tree --long --header --no-user --no-time --git' # exa files as tree
#alias er='e | r' # pipe to read
alias ed='exa --only-dirs --tree --long --header' # exa only directories as tree
alias edr='ed | r' # pipe to read

# git
alias gf='git fetch'
alias gss='git status -s'
alias gs='git status'
alias gaa='git add .'
alias gd='git diff'
alias gc='git checkout'
alias gcm='git commit -m'

# git log
alias gl='git log'
alias gll="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=relative"
alias gls='git log --oneline --stat'
alias glp='git log --patch'

# git branch and git remote
alias gb='git branch'
alias gbb='git branch --all'
alias gbv='git branch -vv' # see what tracking branches you have setup
alias gv='git remote -v'
alias grso='git remote show origin'
alias gvls='git ls-remote origin'


# Kubectl
alias k=kubectl
alias k-prod-gc="kubectl config use-context gke_kencove-prod_us-central1_kencove-prod-gc"
alias k-ben="kubectl config use-context lke275735-ctx"
export kapi="api-kencove-23408405-production"
export knginx="ingress-nginx"
export kodoo="odoo-platform-22086850-production"
export kwebsite="kencove-old-19374104-production"
source <(kubectl completion zsh)
source <(helm completion zsh)

function xport {
    echo exporting .env variables to shell
    export $(grep -v '^#' .env | xargs)
}

# echopath - Split $PATH and print
function echopath {
    echo $PATH | tr : '\n' | sort
}

# ctop - Top-like interface for container metrics
function ctop {
    docker run --rm -it \
    --name=ctop \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    quay.io/vektorlab/ctop:latest
}

# gtop - System monitoring dashboard for terminal see, https://github.com/aksakalli/gtop
function gtop {
    docker run --rm -it \
    --name gtop \
    --net="host" \
    --pid="host" \
    aksakalli/gtop
}

COLOR_GIT_CLEAN='\[\033[1;30m\]'
COLOR_GIT_MODIFIED='\[\033[0;33m\]'
COLOR_GIT_STAGED='\[\033[0;36m\]'
COLOR_RESET='\[\033[0m\]'

function git_prompt() {
  if [ -e ".git" ]; then
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}

    echo -n "→ "

    if [[ $(git status 2> /dev/null | tail -n1) = *"nothing to commit"* ]]; then
      echo -n "$COLOR_GIT_CLEAN$branch_name$COLOR_RESET"
    elif [[ $(git status 2> /dev/null | head -n5) = *"Changes to be committed"* ]]; then
      echo -n "$COLOR_GIT_STAGED$branch_name$COLOR_RESET"
    else
      echo -n "$COLOR_GIT_MODIFIED$branch_name*$COLOR_RESET"
    fi

    echo -n " "
  fi
}

function prompt() {
  PS1="\u@\h [ \w $(git_prompt)] \$ "
}

PROMPT_COMMAND=prompt

[ -f ~/.docker_aliases ] && source ~/.docker_aliases
[ -f ~/.z.sh ] && source ~/.z.sh
source <(fzf --zsh)
# eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bstannard/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bstannard/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bstannard/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bstannard/google-cloud-sdk/completion.zsh.inc'; fi

export PGDATABASE=postgres
export PGHOST=localhost
export PGPORT=5432
export PGUSER=postgres


# Created by `pipx` on 2023-11-07 18:15:55
export PATH="$PATH:/Users/bstannard/.local/bin"

. "$HOME/.cargo/env"
