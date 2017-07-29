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
  coreutils
  ctags
  direnv
  fzf
  git
  gnuplot
  graphviz
  httperf
  imagemagick
  jq
  libcairo2-dev
  macvim
  node
  openssl
  pandoc
  pup
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
  wordnet
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
  macdown
  pixelstick
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
