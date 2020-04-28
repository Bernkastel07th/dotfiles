#!/bin/bash

# init_settings {{{
DOT_FILES=( .config/nvim .config/coc .config/fish .hyper.js .gitconfig .tmux.conf .powerline-shell.json )

for file in ${DOT_FILES[@]}
do
  ln -sfv $HOME/dotfiles/$file $HOME/$file
done

exit 2
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

# enviroment_settings {{{
# neovim
isNvim=$(echo has('nvim'))
if [isNvim == 0]; then
  # python
  pyenv install 2.7.15
  pyenv virtualenv 2.7.15 neovim2
  pyenv activate neovim2
  pip2 install neovim
  pyenv which python

  pyenv install 3.7.3
  pyenv virtualenv 3.7.3 neovim3
  pyenv activate neovim3
  pip install neovim
  pip install jedi
  pyenv which python

  # ruby
  rbenv init
  rbenv install 2.5.1
  rbenv global 2.5.1
  gem install neovim

  # node
  nodenv init
  nodenv install 13.1.0
  nodenv global 13.1.0
  npm install --global neovim
fi
# }}}
