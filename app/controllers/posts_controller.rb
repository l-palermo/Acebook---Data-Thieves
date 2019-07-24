class PostsController < ApplicationController
  def new
    redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @post = User.find(session[:user_id]).posts.new
  end

  def create
    redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @post = User.find(session[:user_id]).posts.create(post_params)
    redirect_to user_posts_url(@user)
  end

  def index
    redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    @posts = Post.all.order("created_at DESC")
  end

  def show
    redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @posts = Post.where(user_id: session[:user_id]).order("created_at DESC")
  end



  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
