class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      current_user = @user
      flash.now[:success] = "Logged in!"
      render 'sessions/new'
    else
      flash.now[:danger] = 'Invalid email or password.'
      render 'sessions/new'
    end
  end

  def delete
    sign_out
    redirect_to login_url
  end
end 
