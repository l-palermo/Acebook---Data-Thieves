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

  def show
    return redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
  end

  def all
    return redirect_to '/' if session[:user_id] == nil
    @user = User.find(session[:user_id])
    @posts = Post.all.order("created_at DESC")
  end

  def destroy
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
    if @post.user_id != session[:user_id]
      flash[:danger] = "Error: you can\'t delete other users messages"
      redirect_to user_post_url(@user, @post)
    else
      Post.where(user_id: session[:user_id]).delete(params[:id])
      redirect_to user_posts_url(@user)
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
    if @post.user_id != session[:user_id]
      flash[:danger] = "Error: you can\'t update other users messages"
      redirect_to edit_user_post_url(@user, @post)
    elsif Time.now.utc - @post.created_at >= 600
      flash[:danger] = "Error: you can\'t update a post since it has been 10 minutes since it was created"
      redirect_to edit_user_post_url(@user, @post)
    else
      @post.update(post_params)
      redirect_to user_posts_url(@user)
    end
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
