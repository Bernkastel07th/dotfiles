export PATH="/usr/local/Cellar/git/2.10.2/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.yarn/bin:$PATH"

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

