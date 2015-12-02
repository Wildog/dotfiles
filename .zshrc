ZSH=$HOME/.oh-my-zsh
ZSH_THEME="Soliah"
plugins=(git git-extras autojump osx tmux sudo zsh-syntax-highlighting)
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOQUIT=true
source $ZSH/oh-my-zsh.sh

alias vim='mvim'
alias cdp='popd'
alias ql='quick-look'
alias sudo='sudo '
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'
alias backupon='defaults delete com.apple.iTunes DeviceBackupsDisabled'
alias backupoff='defaults write com.apple.iTunes DeviceBackupsDisabled -bool YES'
alias vpssync='rsync -vzr --progress --delete ~/Downloads/vpssync/ root@vps.limbo.space::transfer --password-file=/Users/pro/.ssh/rsync.pass'
alias vps='mosh --ssh="ssh -p 5537 -i ~/.ssh/centos.key" root@vps.limbo.space'
alias wildog='cd ~/Projects/Repo/wildog.github.com && bundle exec jekyll serve -H 192.168.1.88'
alias centos='ssh wildog@10.211.55.4'
alias yd='/Applications/Utilities/dict'
alias mc='LANG=en_US.UTF-8 mc'
alias xiami='python /Users/pro/Projects/Repo/xiami/xiami.py'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias aria2c='open -g http://aria2c.com && aria2c'

# Environment Settings
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:~/.vim/autoload:~/algs4/algs4.jar
PATH=$PATH:$JAVA_HOME/bin

PATH=.:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin:$HOME/Library/Python/2.7/bin
PATH=$PATH:$HOME/Library/Python/2.7/bin
PATH=$PATH:/usr/local/smlnj/bin
# PATH=$PATH:/Applications/Matlab/MATLAB_R2014b.app/bin
WORKON_HOME=$HOME/.virtualenvs

export PATH JAVA_HOME CLASSPATH WORKON_HOME
# export DYLD_LIBRARY_PATH='/Applications/Matlab/MATLAB_R2014b.app/bin/maci64:/Applications/Matlab/MATLAB_R2014b.app/sys/os/maci64':$DYLD_LIBRARY_PATH
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
export LANG=zh_CN
export VARIABLE=VALUE
export CHEATCOLORS=true

# Use virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Use Tmuxinator
source ~/.tmuxinator/tmuxinator.zsh

# Use Powerline Status
. /Users/pro/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

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
