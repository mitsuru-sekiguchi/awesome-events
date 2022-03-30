class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])
    # userinfo = UserInformation.where(user_id: user.id)※この記述でもOK
    userinfo = UserInformation.find_by(user_id: user.id)
    if user && userinfo.blank?
      session[:user_id] = user.id
      user.update(login_times: 1)
      redirect_to new_user_information_path, notice: "続いてユーザー情報の登録をして下さい"
    elsif userinfo.present? && (user.delete_flag === 0)
      session[:user_id] = user.id
      user.update(login_times: user.login_times += 1)
      redirect_to root_path, notice: "ログインしました"
    elsif (user.delete_flag === 1)
      redirect_to root_path, alert: "削除済みのユーザーです"
    else
      redirect_to root_path, alert: "失敗しました"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end
