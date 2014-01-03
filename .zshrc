# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#By Lafwind

#Dircolors
eval `dircolors -b ~/.dircolors`
ZLS_COLORS="${LS_COLORS}";export ZLS_COLORS
#彩色补全菜单
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:::kill::processes' list-colors '=(#b) #([0-9]#)=0=01;31'



#漂亮又实用的命令高亮界面
setopt extended_glob
 TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

 recolor-cmd() {
     region_highlight=()
     colorize=true
     start_pos=0
     for arg in ${(z)BUFFER}; do
         ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
         ((end_pos=$start_pos+${#arg}))
         if $colorize; then
             colorize=false
             res=$(LC_ALL=C builtin type $arg 2>/dev/null)
             case $res in
                 *'reserved word'*)   style="fg=magenta,bold";;
                 *'alias for'*)       style="fg=cyan,bold";;
                 *'shell builtin'*)   style="fg=yellow,bold";;
                 *'shell function'*)  style='fg=green,bold';;
                 *"$arg is"*)
                     [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                 *)                   style='none,bold';;
             esac
             region_highlight+=("$start_pos $end_pos $style")
         fi
         [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
         start_pos=$end_pos
     done
 }
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
 check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

 zle -N self-insert check-cmd-self-insert
 zle -N backward-delete-char check-cmd-backward-delete-char


### Android command line
export PATH=$PATH:~/android-sdk-linux/tools

##export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages/
##export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.3/dist-packages/
##export PYTHONPATH=$PYTHONPATH:/usr/local/app/python-2.7.4/lib/
##export PYTHONPATH=$PYTHONPATH:/usr/local/app/python-2.7.5/lib/
##export PYTHONPATH=$PYTHONPATH:/usr/local/app/python-3.3.2/lib/
##export PYTHONPATH=$PYTHONPATH:/usr/local/bin/python2.7
##export PYTHONPATH=$PYTHONPATH:/usr/local/bin/python3.3
##export PATH=$PATH:/usr/local/app/python-2.7.4/bin
##export PATH=$PATH:/usr/local/app/python-2.7.5/bin
##export PATH=$PATH:/usr/local/app/python-3.3.2/bin
##export LD_RUN_PATH=$LD_RUN_PATH:/usr/local/app/python-3.3.2
##export LD_RUN_PATH=$LD_RUN_PATH:/usr/local/app/python-2.7.4
##export LD_RUN_PATH=$LD_RUN_PATH:/usr/local/app/python-2.7.5
##export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/app/python-2.7.4/lib
##export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/app/python-2.7.5/lib
##export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/app/python-3.3.2/lib
##export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#export PYTHONPATH=/usr/local/python-2.7.5/lib/python2.7/
#export PYTHONPATH=/usr/local/python-3.3.2/lib/python3.3/
export PATH=$PATH:/usr/local/go/bin:/opt/apache-ant-1.9.0/bin
export PATH=$PATH:/home/lafwind/android-studio/bin/
export PATH=$PATH:/home/lafwind/google_appengine/
export PATH=$PATH:/home/lafwind/android-studio/sdk/platform-tools/
export PATH=$PATH:/usr/local/app/idea-IC-132.425/bin/
export PATH=$PATH:/usr/local/app/idea-IU-129.1328/bin/
#export PATH=$PATH:/home/lafwind/android-studio/gradle-1.6/bin/

export PATH=$PATH:/usr/local/app/racket/bin/
export PATH=$PATH:/usr/local/app/racket/man/

export PATH=$PATH:/usr/bin/pyflakes

export JDK_HOME="/usr/lib/jvm/java-7-oracle/"

alias vim="/home/lafwind/Laf_gVim/bin/vim"
alias vi="/home/lafwind/Laf_gVim/bin/vim"
alias vim3="/home/lafwind/Laf_gVim/bin/vim"
alias gvim3='~/Laf_gVim/bin/gvim'
alias tmux="tmux -2"
alias c="source-highlight --out-format=esc -o STDOUT -i"
alias cctags="ctags -R --exclude=.git --exclude=log * --exclude=coverage"

export EDITOR=gvim

export HISTCONTROL=erasedups

DISABLE_UPDATE_PROMPT=true
