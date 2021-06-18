#!/bin/sh
DOT_FILES=( .gitconfig .tmux.conf .vimrc )
for file in ${DOT_FILES[@]}
do
  ln -sfv ~/dotfiles/$file ~/$file
done

CONFIG_DIRS=( coc fish nvim )
for dir in ${CONFIG_DIRS[@]}
do
  ln -sfv ~/dotfiles/.config/$dir ~/.config
done
