#!/bin/sh
for dotfile in \.?* 
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.DS_Store' ]
    then
        if [ $dotfile == '.rbenv' ]
        then
            echo "$dotfile/default-gems"
           ln -Fis "$PWD/.rbenv/default-gems" "$HOME/.rbenv/default-gems"
           break
        fi
        echo $dotfile
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
for vimfile in \.vim?* \.vim
do
        echo $vimfile
        if [ $vimfile == '.vim' ]
        then
           ln -Fis "$PWD/.vim/" "$HOME/.vim"
           break
        else 
           ln -Fis "$PWD/$vimfile" $HOME
        fi   
done
rm -f $HOME/.vim/.vim

echo '.screenrc' 
ln -Fis "$PWD/.screenrc" $HOME

if [ ! -e ~/.screens ]
then
    (mkdir ~/.screens>/dev/null 2>&1 && chmod 700 ~/.screens) || (echo "fail in settings of screen atachment after restarting" && rm -d ~/.screens>/dev/null 2>&1)
fi

