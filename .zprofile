export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# the order of priority 
PATH=/usr/local/opt/openssl/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

#JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME

ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_HOME
PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH
STUDIO_JDK=${JAVA_HOME}
ANDROID_SDK_ROOT=$ANDROID_HOME

TOMCAT_HOME=/usr/local/Cellar/tomcat/home
export TOMCAT_HOME

#PLAY_HOME=/usr/local/play
#export PLAY_HOME
#PATH=${PLAY_HOME}:$PATH

#AWS_AUTO_SCALING_HOME=/usr/local/AutoScaling
#export AWS_AUTO_SCALING_HOME 
#PATH=${AWS_AUTO_SCALING_HOME}/bin:$PATH

#export DNX_FEED=https://www.nuget.org/api/v2
#source dnvm.sh
#export MONO_MANAGED_WATCHER=false
#export MONO_GAC_PREFIX=/usr/local/opt/mono/lib/mono/gac
# gacutil /i /usr/local/opt/xsp/lib/mono/gac/Mono.WebServer2/0.2.0.0__0738eb9f132ed756/Mono.WebServer2.dll -gacdir /usr/local/opt/mono/lib/mono/gac
# gacutil /i /usr/local/opt/xsp/lib/mono/gac/xsp4/3.0.0.0__0738eb9f132ed756/xsp4.exe -gacdir /usr/local/opt/mono/lib/mono/gac

PATH=~/Sources/dart/flutter/bin:$PATH
PATH=~/.pub-cache/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if which pyenv > /dev/null; then 
  eval "$(pyenv init -)"
fi

export PATH=$HOME/.nodenv/bin:$PATH

if which nodenv > /dev/null; then 
  eval "$(nodenv init -)"
fi
export NODE_PATH="'$(npm root -g)'"

if [ -e ~/.rbenv ] ; then
  PATH=${HOME}/.rbenv/shims:$PATH
  eval "$(rbenv init -)"
fi

if which swiftenv > /dev/null; then 
  eval "$(swiftenv init -)"; 
fi

#export MANPATH=/opt/local/man:$MANPATH
export DISPLAY=:0.0

export SCREENDIR=~/.screens

export LIBCURL_CFLAGS=-I/usr/local/opt/curl/include
export LIBCURL_LIBS=-L/usr/local/opt/curl/lib


export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ko2ic/Sources/tool/google-cloud-sdk/google-cloud-sdk/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ko2ic/Sources/tool/google-cloud-sdk/google-cloud-sdk/google-cloud-sdk/path.bash.inc'; fi

