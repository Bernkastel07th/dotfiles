#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    fish
    git
    wget
    curl
    openssl
    z
    cask
    lua
    markdown
    yarn
    neovim
    jq
    ripgrep
    imagemagick
    boost
    tig
    tmux
    nodenv
    the_silver_searcher
    gibo
)

"brew tap..."
# brew tap homebrew/dupes
# brew tap homebrew/versions
# brew tap homebrew/homebrew-php
# brew tap homebrew/apache
# brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

brew cleanup

cat << END
**************************************************
HOMEBREW INSTALLED! bye.
**************************************************
END
