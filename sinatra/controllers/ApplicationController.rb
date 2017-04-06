class ApplicationController < Sinatra::Base
  enable :sessions

  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'freewifi'
  )

  puts File.expand_path('../../views', __FILE__)

  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  set :session_secret, 'test'
end