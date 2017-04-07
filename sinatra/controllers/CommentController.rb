class CommentController < ApplicationController

  get '/' do
    @comments = Comment.all
    @comments.to_json
  end

  get '/:user_id' do
    user_id = params[:user_id]
    @user = User.find(user_id)
    
    @comments = @user.comments
    # @comments.to_json
    
    erb :user_comments
  end

  post '/' do
    # comment = JSON.parse(request.body.read)
    @comment = Comment.new
    @comment.content = params["content"]
    @comment.user_id = session[:user_id]
    @user.username = session[:username]

    @comment.save

    @comments = Comment.all
    # @comments.to_json
    redirect '/home'
  end

  patch '/:id' do
    content_type :json

    # comment = JSON.parse(request.body.read)
    @comment = Comment.find(id)
    @comment.content = params["content"]
    @comment.user.id = session[:user_id]

    @comment.save

    # @comments = Comment.all
    # @comments.to_json
    redirect '/home'
  end

  delete '/:id' do
    content_type :json

    # comment = JSON.parse(request.body.read)

    @comment = Comment.find(id)
    @comment.content = params["content"]
    @comment.user.id = session[:user_id]
    @comment.destroy

    # @comments = Comment.all
    # @comments.to_json
  end
end