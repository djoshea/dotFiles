PATH=~/bin:/usr/local/git/bin:$PATH

# add homebrew vim
PATH=/usr/local/Cellar/vim/HEAD/bin:$PATH

# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Latex path
TEXINPUTS="~/Dropbox/latex/tree"

# directory listing
alias ls='ls -FG'
alias ll='ls -lATh'

alias clc="clear"
alias p="ps -u djoshea"

alias ff="find . -name"

# vim
# alias vim="vim"
# alias v="vim"
alias gv="mvim"
alias gvim="mvim"

# matlab local
alias m="/Applications/MATLAB_R2011b.app/bin/matlab -nodesktop"
alias mx="/Applications/MATLAB_R2011b.app/bin/matlab"

# lab ssh commands
alias sk="ssh djoshea@knuckle1"
alias skx="ssh djoshea@knuckle2"
alias sk2x="ssh -Y djoshea@knuckle2"
alias sk2="ssh djoshea@knuckle2"

alias mc="mosh djoshea@cranium"
alias mi="mosh djoshea@index"

# for editing/sourcing this file
alias vb="vim ~/.bash_profile"
alias sb="source ~/.bash_profile"

# navigate to specific directories
alias q="pushd /net/data/Quincy"
alias o="pushd /net/data/Olaf"
alias c="pushd ~/npl/lab" 

alias gs="git status"
alias ga="git add"
alias gc="git commit -am"
alias gh="git push"
alias gl="git pull"

# up directory
alias u="cd .."

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=40
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='[\033]0;${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color
    local HOST="air"

    PS1="\n${EMK}[ ${UC}\u${EMK}@${UC}${HOST} ${EMB}\${NEW_PWD}${EMK} ]${UC}: ${NONE}"
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt



