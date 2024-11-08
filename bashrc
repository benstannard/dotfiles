# ~/.bashrc: executed by bash(1) for non-login shells.
# https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c <-- inspired by

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
# PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi


# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# PATH
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/bash-sql

# Editor
export EDITOR=emacs
export GIT_EDITOR=emacs

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias l='ls -lh --group-directories-first'
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# simplify fg = ja, jb, jc...
alias ja='fg 1'
alias js='fg 2'
alias jd='fg 3'
alias jf='fg 4'

# one key alias
alias m='emacs'
alias pst='pstree -p'
alias r='bat --color=never'	# r short for read, call full command  batcat on some systems
alias s='rg' 		      	# s short for search
alias f='fd' 	      		# f short for find

# exa
alias e='exa --tree --long --header --no-user --no-time --git --level=1'
alias ee='exa --only-dirs --tree --long --header  --level=1 ' 	# exa only directories as tree, depth level 1
alias er='e | r'						# pipe to read

# git
alias gf='git fetch'
alias gs='git status -s'
alias gss='git status'
alias gaa='git add .'
alias gd='git diff'
alias gc='git checkout'
alias gcm='git commit -m'

# git log
alias gl='git log --graph --abbrev-commit --pretty=oneline'
alias gll='git log | r' # git log and pipe to read
alias glp='git log --patch | r' # see patches and pipe to read
alias gls='git log --oneline --stat'

# git branch and git remote
alias gb='git branch'
alias gbb='git branch --all'
alias gbv='git branch -vv' # see what tracking branches you have setup
alias gv='git remote -v'
alias grso='git remote show origin'
alias gvls='git ls-remote origin'

# Kubectl
alias k=kubectl
alias k-review="kubectl config use-context do-nyc3-kencove-review"
alias k-prod="kubectl config use-context do-nyc3-kencove-kub-1"
alias k-staging="kubectl config use-context do-nyc3-kencove-staging"
source <(kubectl completion zsh)
source <(helm completion zsh)

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

# prompt examples:
#   [3 jobs master virtualenv] ~/code/myproject/foo
#   [1 job my-branch virtualenv] ~/code/bar/
#   [virtualenv] ~/code/
#   ~
# Very, very fast, only requiring a couple of fork()s (and no forking at all to determine the current git branch)

if [[ "$USER" == "root" ]]
then
    export PS1="\e[1;31m\]\u \[\e[1;33m\]\w\[\e[0m\] ";
else
    export PS1="\[\e[1;33m\]\w\[\e[0m\] ";
fi

# 100% pure Bash (no forking) function to determine the name of the current git branch
gitbranch() {
    export GITBRANCH=""

    local repo="${_GITBRANCH_LAST_REPO-}"
    local gitdir=""
    [[ ! -z "$repo" ]] && gitdir="$repo/.git"

    # If we don't have a last seen git repo, or we are in a different directory
    if [[ -z "$repo" || "$PWD" != "$repo"* || ! -e "$gitdir" ]]; then
        local cur="$PWD"
        while [[ ! -z "$cur" ]]; do
            if [[ -e "$cur/.git" ]]; then
                repo="$cur"
                gitdir="$cur/.git"
                break
            fi
            cur="${cur%/*}"
        done
    fi

    if [[ -z "$gitdir" ]]; then
        unset _GITBRANCH_LAST_REPO
        return 0
    fi
    export _GITBRANCH_LAST_REPO="${repo}"
    local head=""
    local branch=""
    read head < "$gitdir/HEAD"
    case "$head" in
        ref:*)
            branch="${head##*/}"
            ;;
        "")
            branch=""
            ;;
        *)
            branch="d:${head:0:7}"
            ;;
    esac
    if [[ -z "$branch" ]]; then
        return 0
    fi
    export GITBRANCH="$branch"
}

PS1_green='\[\e[32m\]'
PS1_blue='\[\e[34m\]'
PS1_reset='\[\e[0m\]'
_mk_prompt() {
    # Change the window title of X terminals
    case $TERM in
        xterm*|rxvt*|Eterm)
            echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"
           ;;
        screen)
            echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"
          ;;
    esac

    # Un-screw virtualenv stuff
    if [[ ! -z "${_OLD_VIRTUAL_PS1-}" ]]; then
        export PS1="$_OLD_VIRTUAL_PS1"
        unset _OLD_VIRTUAL_PS1
    fi

    if [[ -z "${_MK_PROMPT_ORIG_PS1-}" ]]; then
        export _MK_PROMPT_ORIG_PS1="$PS1"
    fi

    local prefix=()
    local jobcount="$(jobs -p | wc -l)"
    if [[ "$jobcount" -gt 0 ]]; then
        local job="${jobcount##* } job"
        [[ "$jobcount" -gt 1 ]] && job="${job}s"
        prefix+=("$job")
    fi

    gitbranch
    if [[ ! -z "$GITBRANCH" ]]; then
        prefix+=("${PS1_green}$GITBRANCH${PS1_reset}")
    fi

    local virtualenv="${VIRTUAL_ENV##*/}"
    if [[ ! -z "$virtualenv" ]]; then
        prefix+=("${PS1_blue}$virtualenv${PS1_reset}")
    fi

    PS1="$_MK_PROMPT_ORIG_PS1"
    if [[ ! -z "$prefix" ]]; then
        PS1="[${prefix[@]}] $PS1"
    fi

    export PS1
}
export PROMPT_COMMAND=_mk_prompt

[ -f ~/.docker_aliases ] && source ~/.docker_aliases
[ -f ~/.z.sh ] && source ~/.z.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash