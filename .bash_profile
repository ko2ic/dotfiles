JAVA_HOME=$(/usr/libexec/java_home)
#JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA_HOME
PATH=${JAVA_HOME}/bin:$PATH

ANT_HOME=/usr/local/apache-ant-1.8.3
export ANT_HOME
PATH=${ANT_HOME}/bin:$PATH

M2_HOME=/usr/local/apache-maven
export M2_HOME
PATH=${M2_HOME}/bin:$PATH

TOMCAT_HOME=/usr/local/apache-tomcat
export TOMCAT_HOME
PATH=${TOMCAT_HOME}/bin:$PATH

ANDROID_HOME=/usr/local/android-sdk-macosx
export ANDROID_HOME
PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH

PLAY_HOME=/usr/local/play
export PLAY_HOME
PATH=${PLAY_HOME}:$PATH

AWS_AUTO_SCALING_HOME=/usr/local/AutoScaling
export AWS_AUTO_SCALING_HOME 
PATH=${AWS_AUTO_SCALING_HOME}/bin:$PATH

PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH


export MANPATH=/opt/local/man:$MANPATH
export DISPLAY=:0.0

export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

export SVN_EDITOR=/opt/local/bin/vim

if [ -f ~/.bashrc ] ; then
    source ~/.bashrc
fi
