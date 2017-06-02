umask 0002 
eval "$(hub alias -s)" # bash

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

#alias vim='/usr/local/bin/vim'
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

function gi() { curl https://www.gitignore.io/api/$@ ;}

function rails_new() {

    while read -p "Please enter project name: " railsName ; do
        if [ -n "$railsName" ] ; then
            break
        fi
    done

    while read -p "Whether use Test::Unit[y/n] " skipTest ; do
        case $skipTest in
            [Yy]* ) 
                skipTest=''
                break
                ;; 
            [Nn]* ) 
                skipTest='-T'
                break
                ;;
            *)        
            echo "Please answer yes or no."
            ;;
        esac
    done

    read -p "Please enter rails version: " version 

    if [ -n "$version" ] ; then
        version=", \"$version\""
    fi

    cat << EOS > Gemfile
source "http://rubygems.org"
gem "rails"$version
EOS

    bundle install --path vendor/bundle
    bundle exec rails new $railsName --skip-bundle $skipTest 

    rm -f Gemfile
    rm -f Gemfile.lock
    rm -rf .bundle
    rm -rf vendor
    cd $railsName

    if [ "$skipTest" != "" ] ; then
    cat << EOS >> Gemfile
gem 'rspec-rails', group: [:development, :test]
gem 'factory_girl_rails', group: [:development, :test]
EOS
    fi
    bundle install --path vendor/bundle
    
    if [ "$skipTest" != "" ] ; then
        bundle exec rails g rspec:install
    fi

    gi rails > .gitignore

}

