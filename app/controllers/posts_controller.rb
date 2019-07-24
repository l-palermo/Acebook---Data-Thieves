class PostsController < ApplicationController
  def new
    if session[:user_id] == nil
      redirect_to '/'
    else
      @user = User.find(session[:user_id])
      @post = User.find(session[:user_id]).posts.new
    end
  end

  def create
    if session[:user_id] == nil
      redirect_to '/'
    else
      @user = User.find(session[:user_id])
      @post = User.find(session[:user_id]).posts.create(post_params)
      redirect_to user_posts_url(@user)
    end
  end

  def index
    if session[:user_id] == nil
      redirect_to '/'
    else
      @user = User.find(session[:user_id])
      @posts = Post.where(user_id: session[:user_id]).order("created_at DESC")
    end
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
