class UserInformationsController < ApplicationController
  before_action :set_user_information, only: [:show, :edit, :update]

  def list
    @userinfos = UserInformation.all
  end

  def new
    @userinfo = UserInformation.new
  end

  def create
    @userinfo = UserInformation.new(userinfo_params)
    if @userinfo.save
      redirect_to root_path, notice: "作成しました"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @userinfo.update(userinfo_params)
      redirect_to @userinfo, notice: "更新しました"
    end
  end

  private

  def userinfo_params
    params.require(:user_information).permit(:display_name, :display_name_eng, :company, :birthday, :mail_address, :position, :profile, :user_account_id).merge(user_id: current_user.id)
  end

  def set_user_information
    @userinfo = UserInformation.find_by(params[:id])
  end
end
