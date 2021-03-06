ZSH=$HOME/.oh-my-zsh
ZSH_THEME="Soliah"
plugins=(git git-extras autojump osx sudo zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias vim='mvim'
alias cdp='popd'
alias ql='quick-look'
alias sudo='sudo '
alias yd='/Applications/Utilities/dict'
alias mc='LANG=en_US.UTF-8 mc'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias mux='export FROMSESSION=$(tmux display-message -p "#S") && mux'
alias pipua='pip list --outdated | cut -d ' ' -f1 | xargs -n1 sudo pip install -U'
alias q='exit'
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'
alias backupon='defaults delete com.apple.iTunes DeviceBackupsDisabled'
alias backupoff='defaults write com.apple.iTunes DeviceBackupsDisabled -bool YES'
alias aliyun='ssh -p 5537 -i ~/.ssh/aliyun root@121.42.176.74'
alias wildog='cd ~/Projects/Repo/wildog.github.com && bundle exec jekyll serve -H 192.168.2.106'
alias checkstyle='checkstyle -c ~/algs4/google_checks.xml'

# Disable Ctrl-s to map it in Vim
stty stop undef

# Environment Settings
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:~/.vim/autoload:~/algs4/algs4.jar:~/algs4/mysql.jar:~/algs4/servlet-api.jar
export CATALINA_HOME=/usr/local/Cellar/tomcat/8.5.11/libexec
PATH=$PATH:$JAVA_HOME/bin:$HOME/.fastline/bin

PATH=.:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin:$HOME/Library/Python/2.7/bin
PATH=$PATH:$HOME/Library/Python/2.7/bin
PATH=$PATH:/usr/local/smlnj/bin
# PATH=$PATH:/Applications/Matlab/MATLAB_R2014b.app/bin
WORKON_HOME=$HOME/.virtualenvs

export PATH JAVA_HOME CLASSPATH WORKON_HOME
# export DYLD_LIBRARY_PATH='/Applications/Matlab/MATLAB_R2014b.app/bin/maci64:/Applications/Matlab/MATLAB_R2014b.app/sys/os/maci64':$DYLD_LIBRARY_PATH
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
export XDG_CONFIG_DIRS=$HOME/.config
export LANG="zh_CN.UTF-8"
export VARIABLE=VALUE
export CHEATCOLORS=true
export HOMEBREW_GITHUB_API_TOKEN=b98f0f2b3b485a6269622877d8e67b92cbe0750e

# Use virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Tmux related
if [ $TERM = "xterm-256color" ]; then
    export ZSH_TMUX_AUTOSTART=true
    export ZSH_TMUX_AUTOSTART_ONCE=true
    export ZSH_TMUX_AUTOQUIT=true
fi
source $HOME/.tmuxinator/tmux.plugin.zsh
source ~/.tmuxinator/tmuxinator.zsh
source ~/.tmuxinator/default.zsh # default mux on tty1

# Use Powerline Status
. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Autocorrection
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Copy/Paste Func
copy(){
    test -z $1 && echo "No file input!" && return
    test ! -e $1 && echo "File not exist!" && return
    export orig_path="$PWD/$1"
    export orig_name="$1"
}
paste(){
    test -z $orig_path && echo "No copied file!" && return
    if [ "$#" -lt 1 ];then
        dist_name="$PWD/$orig_name"
        if [ -d $orig_path ];then
            cp -r $orig_path $dist_name
        else
            cp $orig_path $dist_name
        fi
        echo "$orig_name pasted."
    else
        dist_name="$PWD/$1"
        if [ -d $orig_path ];then
            cp -r $orig_path $dist_name
        else
            cp $orig_path $dist_name
        fi
        echo "\"$1\" pasted."
    fi
}

# No Autocorrection
#if [ -f ~/.zsh_nocorrect ]; then while read -r COMMAND; do
#        alias $COMMAND="nocorrect $COMMAND"
#    done < ~/.zsh_nocorrect
#fi
