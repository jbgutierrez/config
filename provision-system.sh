#!/usr/bin/env bash -x

read -p "Be aware of any errors or further configuration steps. Press [Enter] key to continue..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

taps=(
  homebrew/dupes
  neovim/neovim
)

for tap in "${taps[@]}"; do
  brew tap $tap;
done

packages=(
  autoconf
  automake
  cloc
  ctags
  direnv
  fzf
  git
  gnuplot
  graphviz
  httperf
  imagemagick
  jq
  macvim
  node
  openssl
  pandoc
  rbenv
  rsync
  ruby-build
  shellcheck
  ssh-copy-id
  subversion
  the_silver_searcher
  tmux
  tree
  wget
  zsh-lovers
)

for package in "${packages[@]}"; do
  brew install $package;
done

brew install --HEAD neovim

packages=(
  appdelete
  cheatsheet
  clipmenu
  disk-inventory-x
  firefox
  freemind
  google-chrome
  handbrake
  handbrakecli
  iterm2
  spectacle
  sublime-text
  unrarx
  virtualbox
  virtualbox-extension-pack
  wireshark
)

for package in "${packages[@]}"; do
  brew cask install $package;
done
