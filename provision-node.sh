#!/usr/bin/env bash -x

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# export NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
nvm install stable
nvm use stable
nvm alias default stable

packages=(
  bower
  coffee
  coffeelint
  eslint
  express-generator
  jest
  js2coffee
  jshint
  jslint
  meanjs
  uglifyjs
  webpack
  yarn
  bower
)

for package in "${packages[@]}"; do
  npm install $package -g
done
