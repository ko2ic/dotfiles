#!/bin/sh
for dotfile in .?*
do
    echo $dotfile
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.DS_Store' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

if [ ! -e ~/.screens ]
then
    (mkdir ~/.screens>/dev/null 2>&1 && chmod 700 ~/.screens) || (echo "fail in settings of screen atachment after restarting" && rm -d ~/.screens>/dev/null 2>&1)
fi

