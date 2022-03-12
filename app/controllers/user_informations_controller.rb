class UserInformationsController < ApplicationController
  def list
    @userinfos = UserInformation.all
  end

  def new
    @userinfo = UserInformation.new
  end

  def create
    @userinfo = UserInformation.new(userinfo_params)
    if @userinfo.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @userinfo = UserInformation.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def userinfo_params
    params.require(:user_information).permit(:display_name, :display_name_eng, :company, :birthday, :mail_address, :position, :profile, :user_account_id).merge(user_id: current_user.id)
  end
end
