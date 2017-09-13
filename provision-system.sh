#!/usr/bin/env bash -x

read -p "Be aware of any errors or further configuration steps. Press [Enter] key to continue..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

taps=(
  homebrew/dupes
)

for tap in "${taps[@]}"; do
  brew tap $tap;
done

packages=(
  autoconf
  automake
  cairo
  cloc
  coreutils
  ctags
  direnv
  dssim
  editorconfig
  ffmpeg
  figlet
  fortune
  fzf
  git
  git-flow
  gnuplot
  graphviz
  htop
  httperf
  imagemagick
  irssi
  jpegoptim
  jq
  lynx
  macvim
  neovim
  nginx
  openssl
  pandoc
  pup
  rbenv
  rsync
  shellcheck
  ssh-copy-id
  subversion
  the_silver_searcher
  tmux
  tree
  unrar
  vim
  webp
  wget
  wordnet
  zsh-lovers
)

for package in "${packages[@]}"; do
  brew install $package;
done

# Search casks at https://caskroom.github.io/search
packages=(
  appdelete
  cheatsheet
  clipmenu
  cloudapp
  dash
  disk-inventory-x
  docker
  dropbox
  firefox
  flux
  freemind
  google-chrome
  handbrake
  iterm2
  java
  # karabiner
  karabiner-elements
  kitematic
  macdown
  mactex
  microsoft-teams
  pixelstick
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  quicklook-json
  slack
  sourcetree
  spectacle
  unrarx
  visual-studio-code
  wireshark
  xmind
)

for package in "${packages[@]}"; do
  brew cask install $package --force;
done

read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rm -rf $(brew --cache)
  brew cask cleanup
fi
