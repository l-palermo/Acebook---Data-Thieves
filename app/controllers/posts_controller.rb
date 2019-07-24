class PostsController < ApplicationController
  def new
    return redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @post = User.find(session[:user_id]).posts.new
  end

  def create
    return redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @post = User.find(session[:user_id]).posts.create(post_params)
    redirect_to user_posts_url(@user)
  end

  def index
    return redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    @posts = Post.where(user_id: session[:user_id]).order("created_at DESC")
  end

  def all
    return redirect_to '/' if session[:user_id] == nil
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
