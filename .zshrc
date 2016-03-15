# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="ys"
ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# end

# Dosen't work now! chinese input method in gvim
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=xim
export GTK_IM_MODULE=xim
# end

# tmux
alias tmux="tmux -2"
# end

# For Vim
alias vi="/home/lafwind/local/apps/Laf_gVim/bin/vim"
# end


# For jvm || jdk
# export JAVA_HOME=/usr/local/lib/jvm/jdk1.8.0_31
export JAVA_HOME=/home/lafwind/local/lib/jvm/jdk1.8.0_31
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
# end

# For Android Studio
export Android_Studio_Path=/home/lafwind/local/apps/android-studio
export PATH=$Android_Studio_Path/bin:$PATH
# end

# For Android
export ANDROID_HOME=/home/lafwind/local/lib/Android/Sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH
# end

# For Node
export PATH=/home/lafwind/local/bin/node/bin:$PATH
export NODE_PATH=/home/lafwind/local/bin/node:/home/lafwind/local/bin/node/lib/node_modules
# end

# For Haskell
PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH
PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH
# end

# For dircolors
eval `dircolors ~/local/software_src/dircolors/dircolors-solarized/dircolors.ansi-light`
# end

# For redis
PATH=/home/lafwind/local/bin/redis-3.0.0/src:$PATH
# end

# For emacs
export XLIB_SKIP_ARGB_VISUALS=1
export NO_AT_BRIDGE=1
alias emacs="export LC_CTYPE=zh_CN.UTF-8;emacs";
export PATH=/home/lafwind/local/share/applications:$PATH
PATH=/home/lafwind/local/bin:$PATH
PATH=/home/lafwind/local/share/applications:$PATH
#

# For NDK
export PATH=/home/lafwind/local/lib/Android/android-ndk-r10d:$PATH
#

# For nvm
# export PATH=/home/lafwind/.nvm/versions/io.js/v2.4.0/bin:$PATH
. /home/lafwind/.nvm/nvm.sh
#

# For racket
export PATH=/home/lafwind/local/bin/racket-6.2.1/bin:$PATH
#

# For exercism
export PATH=$HOME/local/bin:$PATH
#

# For emacs 24.5 (compiled by myself)
# export PATH=$HOME/local/apps/emacs:$PATH
# alias emacs="export LC_CTYPE=zh_CN.UTF-8;/home/lafwind/local/apps/emacs/bin/emacs &";
