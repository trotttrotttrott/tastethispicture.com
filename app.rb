require "sinatra/base"
require "sinatra/json"
require "haml"
require "sass"

require "flickr"

class App < Sinatra::Base

  configure :development do
    require "debugger"
    require "sinatra/reloader"
    require "dotenv"
    Dotenv.load
    enable :show_exceptions
    register Sinatra::Reloader
    Dir[File.expand_path("../lib/**/*.rb", __FILE__)].each do |file|
      also_reload file
    end
  end

  get "/" do
    haml :index
  end

  get "/pictures" do
    json Flickr.get_stream(params[:page]).body
  end
end
