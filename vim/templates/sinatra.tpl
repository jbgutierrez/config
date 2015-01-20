#!/usr/bin/env ruby
# coding: UTF-8
require 'bundler/setup'

require "sinatra/base"
require "sinatra/reloader"
require "haml"
require "json"

# PWD = File.dirname(__FILE__)
class Server < Sinatra::Application
  # set :public_folder, PWD
  # set :views, PWD
  set :haml, format: :html5
  enable :inline_templates

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

  helpers do
    def json object
      logger.info object.to_json
      content_type :json
      object.to_json
    end
  end

  get '/' do
    locals = { message: 'Hello World!' }
    if request.xhr?
      json locals
    else
      haml :index, locals: locals
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
    %link{:href => "main.css", :rel => "stylesheet"}/
    %script{:src => "https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"}
  %body
    /[if lt IE 8]
      <p class="browserupgrade">
      You are using an <strong>outdated</strong> browser. Please
      <a href="http://browsehappy.com/">upgrade your browser</a> to improve
      your experience.
      </p>
    = yield
    %script{:src => "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"}
    %script{:src => "main.js"}

@@ index
%div= message
