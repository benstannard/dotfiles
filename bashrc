# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# ctrl-s probably won't work by defaul for most terminals
stty -ixon

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
    *)
	;;
esac

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    fi
fi


# GOPATH
export EDITOR=emacs
export GIT_EDITOR=emacs
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/flaskapps/hotel/bin


# Alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias l='ls -1 --color=auto'
alias ll='ls -lah --color=auto'
alias ls='ls --color=auto -h --group-directories-first --ignore="*.pyc"'
alias ja='fg 1'
alias js='fg 2'
alias jd='fg 3'
alias jf='fg 4'
alias pst='pstree -p'
alias v='vim '
alias i='ipython'
alias ping='ping -c 5'
alias df='df -h'
alias du='du -h -c'

#  emacs --daemon
alias e='emacsclient -t'
alias ec='emacsclient -c'


# Find your IP
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# Git
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'

# Copy / Paste. Pipe data to your system clipboard/pasteboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'


### FUNCTIONS ###
# Function to update OS & Libraries.
function uu {
    date
    echo "Performing updates & upgrades to base OS"
    echo "sudo apt-get update"
    sudo apt-get update
    echo "sudo apt-get upgrade"
    sudo apt-get upgrade
    echo "base OS is up-to-date with most recent patches."
}

# Function to uncompress file. https://github.com/xvoland/Extract
# $ extract <compressed_file>
function extract {
    if [ -z "$1" ]; then
	# display usage if no parameters given
	echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
	if [ -f "$1" ] ; then
	    NAME=${1%.*}
	    #mkdir $NAME && cd $NAME
	    case "$1" in
		*.tar.bz2)   tar xvjf ./"$1"    ;;
		*.tar.gz)    tar xvzf ./"$1"    ;;
		*.tar.xz)    tar xvJf ./"$1"    ;;
		*.lzma)      unlzma ./"$1"      ;;
		*.bz2)       bunzip2 ./"$1"     ;;
		*.rar)       unrar x -ad ./"$1" ;;
		*.gz)        gunzip ./"$1"      ;;
		*.tar)       tar xvf ./"$1"     ;;
		*.tbz2)      tar xvjf ./"$1"    ;;
		*.tgz)       tar xvzf ./"$1"    ;;
		*.zip)       unzip ./"$1"       ;;
		*.Z)         uncompress ./"$1"  ;;
		*.7z)        7z x ./"$1"        ;;
		*.xz)        unxz ./"$1"        ;;
		*.exe)       cabextract ./"$1"  ;;
		*)           echo "extract: '$1' - unknown archive method" ;;
	    esac
	else
	    echo "'$1' - file does not exist"
	fi
    fi
    }


### PROMPT ###
# https://gist.github.com/wolever/6525437
# prompt examples
#   [3 jobs master virtualenv] ~/code/myproject/foo
#   [1 job my-branch virtualenv] ~/code/bar/
#   [virtualenv] ~/code/
#   ~
# Very, very fast, only requiring a couple of fork()s (and no forking at all to determine the current git branch)
# I changed PS1 colors for better readability


# then you can add \`jobs_count\` to the end of your PS1 like this
function jobs_count {
    cnt=$(jobs -l | wc -l)
    if [ $cnt -gt 0 ]; then
	echo -ne " \e[93m${cnt}\e[m"
    fi
}


if [[ "$USER" == "root" ]]
then
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
