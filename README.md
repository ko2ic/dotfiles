dotfiles
======================


after clone
------
1.add repository url of submodule which is written in .gitmodules to .git/config and checkout sources.

`$ git submodule update --init`

2.open vim.

`$ vim .`

3.install vim plugin with vundle.

`:BundleInstall`

4.set up dot file to .

`$ chmod 766 dotfiles.sh`

`$ ./dotfiles.sh`

5.append global gitignore to .gitconfig

`$ git config --global core.excludesfile ~/.gitignore`
