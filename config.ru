$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")
require "./app"
require "sprockets"

map "/assets" do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/images'
  environment.append_path "assets/javascripts"
  environment.append_path "assets/stylesheets"
  environment.append_path "lib/assets/stylesheets"
  environment.append_path "bower_components"
  environment.append_path "bower_components/foundation/scss"
  run environment
end

map "/" do
  run App
end
