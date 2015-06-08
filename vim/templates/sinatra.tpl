#!/usr/bin/env ruby
# coding: UTF-8
require 'bundler/setup'

require "sinatra/base"
require "sinatra/reloader"
require 'sinatra/contrib'
require "haml"
require "json"

# PWD = File.dirname(__FILE__)
class Server < Sinatra::Application
  register Sinatra::Contrib::All
  # set :public_folder, PWD
  # set :views, PWD
  set :haml, format: :html5
  set :port, ENV['PORT'] || 4567
  enable :inline_templates
  enable :cross_origin

  configure :development do
    disable :protection
    register Sinatra::Reloader
  end

  # RACK_ENV=production ruby app.rb
  configure :production do
    use Rack::Auth::Basic do |username, password|
      username == 'admin' && password == 'secret'
    end
  end

  get '/' do
    locals = { message: 'Hello World!' }
    respond_to do |format|
      format.html { haml :index, locals: locals, layout: !request.xhr? }
      format.json { locals.to_json }
    end
  end

  run!

end

__END__

@@ layout
!!!
%html.no-js{:lang => "es"}
  %head
    %meta{:charset => "utf-8"}/
    %meta{:content => "IE=edge", "http-equiv" => "X-UA-Compatible"}/
    %title Sample App
    %meta{:content => "", :name => "description"}/
    %meta{:content => "width=device-width, initial-scale=1", :name => "viewport"}/
    %link{:href => "https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.2/normalize.css", :rel => "stylesheet"}/
    %link{:href => "app.css", :rel => "stylesheet"}/
    %script{:src => "https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"}/
    - if content_for? :head
      = yield_content :head
  %body
    /[if lt IE 8]
      <p class="browserupgrade">
      You are using an <strong>outdated</strong> browser. Please
      <a href="http://browsehappy.com/">upgrade your browser</a> to improve
      your experience.
      </p>
    = yield
    %script{:src => "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"}/
    %script{:src => "app.js"}/

@@ index

- content_for :head do
  %link{:href => "index.css", :rel => "stylesheet"}/

%div= message
