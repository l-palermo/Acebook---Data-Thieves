class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login_params)
    if user
      session[:user_id] = user.id
      redirect_to user_posts_url(user)
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end

  private

    def login_params
      params.require(:session).permit(:email, :password)
    end
end