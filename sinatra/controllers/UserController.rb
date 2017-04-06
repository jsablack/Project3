class UserController < ApplicationController

  get '/' do
    @users = User.all
    @comments.to_json
  end

  get '/:user_id' do
    user_id = params[:user_id]
    @user = User.find(user_id)
    
    @users.to_json
    
    erb :user
  end

  patch '/:id' do
    content_type :json

    user = JSON.parse(request.body.read)
    @user = user.find(id)

    @user.save

    @users = User.all
    @users.to_json
    redirect '/home'
  end

  delete '/:id' do
    content_type :json

    user = JSON.parse(request.body.read)
    @user = User.find(id)
    @user.destroy

    @users = User.all
    @users.to_json
  end
end