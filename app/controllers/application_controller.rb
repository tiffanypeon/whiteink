class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authentication_required

  def index
  end

  private
  def authentication_required
    if !logged_in?
      if request.xhr?
        flash.now[:notice] = "Please login."
      else
        flash[:notice] = "Please login."
      end
    end
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user

  def logout(user)
    reset_session
  end

  def login(user)
    session[:user_id] = user.id
  end

end
