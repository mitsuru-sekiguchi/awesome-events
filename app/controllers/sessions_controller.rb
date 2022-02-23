class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to root_path, notice: "ログインしました"
    else
      redirect_to root_path, notice: "失敗しました"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end
