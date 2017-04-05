class CommentController < ApplicationController
  get '/' do
    @comments = Comment.all
    @comments.to_json
  end

  get '/:user_id' do
    user_id = params[:user_id]
    @user = User.find(user_id)
    @comments = @user.comments
    erb :user_comments
  end

  post '/' do
    @comment = Comment.new
    @comment.content = params["content"]
    @comment.user_id = session[:user_id]

    @comment.save
    redirect '/home'
  end

  patch '/:id' do

  end

  delete '/:id' do

  end
end