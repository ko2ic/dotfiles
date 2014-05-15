After clone
======================

### First

set up dot file to .

`$ chmod 766 dotfiles.sh`

`$ ./dotfiles.sh`

`$ source ~/.bash_profile`

### For Mac

1.install homebrew

`$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

2.install cask and so on.

`$ brew bundle`

3.setup NeoBundle

`$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh`

### For Windows

1.install chocolatey

referencing the following  
https://gist.github.com/ko2ic/dba4ddd35a653080c913

2.install cygwin

referencing the following  
http://qiita.com/ko2ic/items/2574139dd095e5a31e76

3.install git on cygwin 

`$ apt-cyg install git`

3.setup NeoBundle

    $ mkdir -p ~/.vim/bundle
    $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

### Common

1.open vim.

`$ vim .`

2.install vim plugin with NeoBundle.

`:NeoBundleInstall`

3.setup git config

    $ git config --global user.name "kouji ishii"
    $ git config --global user.email ko2ic.dev@gmail.com
    $ git config --global core.excludesfile ~/.gitignore
    $ git config --global core.editor "/usr/local/bin/vim"

4.setup for js

    $ curl -L git.io/nodebrew | perl - setup
    $ nodebrew ls-all
    $ nodebrew install v0.6.0
    $ npm install -g jshint

referencing the following   
https://github.com/hokaccha/nodebrew
