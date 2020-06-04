#!/bin/bash

# init_settings {{{
DOT_FILES=( .config/nvim .config/coc .config/fish .hyper.js .gitconfig .tmux.conf .powerline-shell.json )

for file in ${DOT_FILES[@]}
do
  ln -sfv $HOME/dotfiles/$file $HOME/$file
done

sh ./brew.sh
# }}}

# fish_settings {{{
echo "export LANG=ja_JP.UTF-8" >> ~/.config/fish/config.fish

fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# }}}

# powerline_settings {{{
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh
rm -rf fonts
# }}}
