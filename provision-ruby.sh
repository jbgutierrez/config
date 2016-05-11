#!/usr/bin/env bash -x

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
  pry
  redcarpet
  rerun
  scss-lint
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
