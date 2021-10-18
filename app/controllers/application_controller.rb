class ApplicationController < ActionController::Base
  before_action :autenticate
  helper_method :logged_in?

  private

  def logged_in?
    !!current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def autenticate
    return if loggef_in?
    redirect_to root_path, alert: "ログインして下さい"
  end
end
