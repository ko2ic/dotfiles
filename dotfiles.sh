#!/bin/sh
for dotfile in .??* 
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.DS_Store' ]
    then
        if [ $dotfile == '.rbenv' ]
        then
            echo "$dotfile/default-gems"
           ln -fis "$PWD/.rbenv/default-gems" "$HOME/.rbenv/default-gems"
           break
        fi
        echo $dotfile
        ln -fis "$PWD/$dotfile" $HOME
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
           ln -fis "$PWD/$vimfile" $HOME
        fi   
done
rm -f $HOME/.vim/.vim

echo '.screenrc'
ln -fis "$PWD/.screenrc" $HOME

echo '.tmux.conf'
ln -fis "$PWD/.tmux.conf" $HOME

if [ ! -e ~/.screens ]
then
    (mkdir ~/.screens>/dev/null 2>&1 && chmod 700 ~/.screens) || (echo "fail in settings of screen atachment after restarting" && rm -d ~/.screens>/dev/null 2>&1)
fi

echo '.zprofile' 
ln -fis "$PWD/.zprofile" $HOME

echo '.zshrc'
ln -fis "$PWD/.zshrc" $HOME

echo '.claude/settings.json'
mkdir -p "$HOME/.claude"
ln -fis "$PWD/.claude/settings.json" "$HOME/.claude/settings.json"

echo '.claude/statusline.sh'
ln -fis "$PWD/.claude/statusline.sh" "$HOME/.claude/statusline.sh"

echo '.claude/notify.sh'
ln -fis "$PWD/.claude/notify.sh" "$HOME/.claude/notify.sh"

echo '.claude/reset-highlight.sh'
ln -fis "$PWD/.claude/reset-highlight.sh" "$HOME/.claude/reset-highlight.sh"

echo '.claude/input-highlight.sh'
ln -fis "$PWD/.claude/input-highlight.sh" "$HOME/.claude/input-highlight.sh"
