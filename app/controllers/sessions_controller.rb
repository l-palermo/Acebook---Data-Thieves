class SessionsController < ApplicationController

  def new
  end

  def create
    p login_params
    user = User.find_by(login_params)
    if user
      redirect_to '/posts'
    else
      flash[:danger] = 'Invalid email/password combination'
    end
  end

  private

    def login_params
      params.require(:session).permit(:email, :password)
    end

end
