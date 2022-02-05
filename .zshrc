# Initialize zplug via brew
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Load configuration framework
zplug "sorin-ionescu/prezto"

# Load pachages
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

# Load theme file
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
zplug load --verbose

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#$ zplug install
#$ ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
#$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
JDK_6="$SDKMAN_DIR/candidates/java/6u65-apple"
JDK_7="$SDKMAN_DIR/candidates/java/7u141-zulu"
JDK_8="$SDKMAN_DIR/candidates/java/8.0.181-zulu"
JDK_12="$SDKMAN_DIR/candidates/java/12.ea.12-open"

JAVA_HOME="$SDKMAN_DIR/candidates/java/8.0.181-zulu"
export JAVA_HOME

umask 0002 
eval "$(hub alias -s)" # bash

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

