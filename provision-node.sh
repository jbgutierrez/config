#!/usr/bin/env bash -x

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.0/install.sh | bash
nvm install stable
nvm use stable
nvm alias default stable

packages=(
  coffee
  coffeelint
  eslint
  express
  js2coffee
  jshint
  jslint
  meanjs
  uglifyjs
  webpack
)

for package in "${packages[@]}"; do
  npm install $package -g;
done
