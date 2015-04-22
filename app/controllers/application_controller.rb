class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def log_in(user)
    session[:user_id] = user.id
    current_user = @user
    new_remember_token = User.digest(User.new_token)
    user.update_attribute(:remember_token, new_remember_token)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def logged_in?
    !current_user.nil?
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token]) 
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    session.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url
      flash[:danger] = 'Please log in.'
    end
  end
end
