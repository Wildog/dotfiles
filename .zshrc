ZSH=$HOME/.oh-my-zsh
ZSH_THEME="Soliah"
plugins=(git git-extras autojump osx sudo zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias vim='mvim'
alias cdp='popd'
alias sudo='sudo '
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'
alias runftp='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
alias stopftp='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
alias backupon='defaults delete com.apple.iTunes DeviceBackupsDisabled'
alias backupoff='defaults write com.apple.iTunes DeviceBackupsDisabled -bool YES'

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:~/.vim/autoload
PATH=.:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin:$HOME/Library/Python/2.7/bin
PATH=$PATH:/usr/local/smlnj/bin
PATH="$PATH:$JAVA_HOME/bin"
export PATH JAVA_HOME CLASSPATH
export EDITOR='vim'
export LANG=zh_CN
export VARIABLE=VALUE

# Use Powerline Status
. /Users/pro/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# Autocorrection
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# No Autocorrection
#if [ -f ~/.zsh_nocorrect ]; then while read -r COMMAND; do
#        alias $COMMAND="nocorrect $COMMAND"
#    done < ~/.zsh_nocorrect
#fi

