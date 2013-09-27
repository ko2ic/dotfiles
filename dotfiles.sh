#!/bin/sh
for dotfile in .?*
do
echo $dotfile
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.DS_Store' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
