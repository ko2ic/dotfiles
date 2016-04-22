# Make sure using latest Homebrew
brew update 

# Update already-installed formula
#brew upgrade --all

# Add Repository
brew tap homebrew/versions
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap thoughtbot/formulae
brew tap aspnet/dnx
#brew tap homebrew/boneyard

#brew tap caskroom/homebrew-cask
brew tap caskroom/versions
brew tap caskroom/cask

# Packages

## Utils
brew install autoconf
brew install automake
brew install boehmgc
brew install cmake
brew install curl
brew install wget
brew install tree
brew install openssl
brew install nkf
brew install nmap
brew link autoconf automake
brew install ag
brew install lua
brew install ctags
#brew install wireshark --with-qt
brew install sqlite
brew install tika
brew install libjpeg zlib
brew install jq

## db
#brew install mysql

## Java
brew cask install java
#brew install tomcat
#brew install maven
brew install gradle
#brew install groovy
brew install android-sdk
brew cask install android-studio

## Scala
#ibrew install scala
#brew install sbt
#brew install typesafe-activator

## ruby
brew link autoconf
brew install readline
brew install ruby-build
brew install rbenv
brew install rbenv-gemset
# for ruby-filemagic
#brew install libmagic
# for rmagic
#brew install imagemagick

## JavaScript
brew install nodebrew

## Python
brew install pyenv-virtualenv

## C#
#brew install dnvm 
#brew install xsp

## Swift
brew install xctool 
brew install swiftlint

## Editor
brew install vim --with-lua
brew install macvim --with-cscope --with-lua --HEAD

## Git
brew install git
brew install gitsh
#brew install tig
brew install gibo

## Gist/Github
brew install gist
brew install hub

## Heroku
#brew install heroku-toolbelt

## DevOpt
brew cask install vagrant
brew cask install virtualbox
#brew install docker
#brew install packer

## private
#brew install exiftool

# Casks
brew cask install google-chrome
brew cask install iterm2
brew cask install dropbox
brew cask install kobito
brew cask install divvy
brew cask install skype
brew cask install atom
brew cask install alfred

brew linkapps
# Remove outdated versions
brew cleanup
brew cask cleanup
