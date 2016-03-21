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
  reattach-to-user-namespace
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
  cheatsheet
  clipmenu
  firefox
  freemind
  google-chrome
  handbrake
  handbrakecli
  spectacle
  sublime-text
  unrarx
  virtualbox
  virtualbox-extension-pack
  wireshark
  iterm2
)

for package in "${packages[@]}"; do
  brew cask install $package;
done

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.0/install.sh | bash
nvm install stable
nvm use stable
nvm alias default stable

packages=(
  coffee
  express
  meanjs
  webpack
)

for package in "${packages[@]}"; do
  npm install $package -g;
done

packages=(
  activesupport
  awesome_print
  bundler
  compass
  haml
  mechanize
  middleman
  mongoid
  nokogiri
  redcarpet
  rerun
  sinatra
  sinatra-contrib
  sinatra-partial
  sinatra-reloader
)

rbenv install 2.2.3
rbenv global 2.2.3
for package in "${packages[@]}"; do
  gem install $package;
done
rbenv rehash
