require "sinatra/base"
require "haml"
require "sass"

class App < Sinatra::Base

  configure :development do
    require "debugger"
    require "sinatra/reloader"
    enable :show_exceptions
    register Sinatra::Reloader
    Dir[File.expand_path("../lib/**/*.rb", __FILE__)].each do |file|
      also_reload file
    end
  end

  helpers do
    def image_tag(path)
      "<img src=\"/assets/#{path}\" />"
    end
  end

  get "/" do
    haml :index
  end
end
