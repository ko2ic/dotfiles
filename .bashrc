alias mvn3='/usr/local/apache-maven-3.0.4/bin/mvn'
alias svn16='/usr/bin/svn'
alias svn17='/opt/local/bin/svn'
alias svn='/usr/bin/svn'


if [ "$TERM" = "screen-bce" ]; then
    # ディレクトリ名を表示する場合
    PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@$(hostname):$(pwd)\007"'
    #PS1='\033k\W\033\134[\[\033[33m\]Screen\[\033[0m\]][\u@\[\033[36m\]\h\[\033[0m\] \W]\\$ '
    #PS1='\[\ek\e\\\][\u@\h \W]\$ '
    PS1='\[\ek\e\\\]s$WINDOW [\u@ \W]\$ '
else
    # 通常のプロンプト
    PROMPT_COMMAND='echo -ne "\033]0;KTerm on ${USER}@${HOSTNAME%%.*} :${PWD/#$HOME/~}\007"'
    #PROMPT_COMMAND='echo -ne "\033]0;KTerm on ${USER} :${PWD/#$HOME/~}\007"'
    PS1='[\u \W]\\$ '
    #PS1='[\u@\h \W]\\$ '
fi

