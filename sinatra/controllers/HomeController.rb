class HomeController < ApplicationController

  options "*" do
    response.headers["Allow"] = "HEAD,GET,POST,PUT,PATCH,DELETE,OPTIONS"

    # Needed for AngularJS
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    response['Access-Control-Allow-Origin'] = '*'

    "cool"
  end

  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    p session
    if session[:logged_in]
      @username = session[:username]
      @comments = Comment.all

      erb :home
    else
      @message = "You are not logged in!"
      erb :login
    end
  end

  get '/login' do
    erb :login
  end

  get '/register' do
    erb :register
  end

  get '/logout' do
    session.destroy
    redirect '/home/login'
  end

  post '/login' do
   response['Access-Control-Allow-Origin'] = '*'

    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user && user.authenticate(password)
      session[:logged_in] = true
      session[:username] = username
      session[:user_id] = user.id

      redirect '/home'
    else
      @message = "Login Unsuccessful"
      erb :login
    end
  end

  post '/register' do
   response['Access-Control-Allow-Origin'] = '*'

    user = User.new

    user.username = params["username"]
    user.password = params["password"]
    user.save

    redirect '/home/login'
  end
end
