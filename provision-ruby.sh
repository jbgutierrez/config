#!/usr/bin/env bash -x

rbenv install 2.4.1
rbenv global 2.4.1

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
  scss_lint
  sinatra
  sinatra-contrib
  sinatra-partial
  sinatra-reloader
  tmuxinator
)

for package in "${packages[@]}"; do
  gem install $package;
done
rbenv rehash
