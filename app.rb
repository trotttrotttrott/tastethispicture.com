require 'sinatra/base'
require 'sinatra/content_for'
require 'sinatra/reloader'
require 'haml'
require 'sass'

class App < Sinatra::Base

  configure :development do
    require "debugger"
    enable :show_exceptions
    register Sinatra::Reloader
    Dir[File.expand_path("../lib/**/*.rb", __FILE__)].each do |file|
      also_reload file
    end
  end

  helpers Sinatra::ContentFor

  get "/" do
    haml :index
  end
end
