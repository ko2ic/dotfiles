# brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# the order of priority 
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=$HOME/.nodebrew/current/bin:$PATH

JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME
PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH
STUDIO_JDK=${JAVA_HOME}

TOMCAT_HOME=/usr/local/Cellar/tomcat/home
export TOMCAT_HOME

#PLAY_HOME=/usr/local/play
#export PLAY_HOME
#PATH=${PLAY_HOME}:$PATH

#AWS_AUTO_SCALING_HOME=/usr/local/AutoScaling
#export AWS_AUTO_SCALING_HOME 
#PATH=${AWS_AUTO_SCALING_HOME}/bin:$PATH

#export MANPATH=/opt/local/man:$MANPATH
export DISPLAY=:0.0

if [ -e ~/.rbenv ] ; then
#  PATH=${HOME}/.rbenv/shims:$PATH 
  eval "$(rbenv init -)"
fi

export SCREENDIR=~/.screens
export SVN_EDITOR=/usr/local/bin/vim

export LIBCURL_CFLAGS=-I/usr/local/opt/curl/include
export LIBCURL_LIBS=-L/usr/local/opt/curl/lib

if [ -f ~/.bashrc ] ; then
    source ~/.bashrc
fi

