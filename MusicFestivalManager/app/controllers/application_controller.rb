class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      redirect_to current_user
    end
  end
end
