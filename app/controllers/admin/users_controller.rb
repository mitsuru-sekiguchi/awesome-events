class Admin::UsersController < ApplicationController
  before_action :user_admin, only: [:index]
  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_index_url
  end

  private
    def user_admin
      @users = User.all
      if current_user.admin == false
        redirect_to root_path
      else
        render action: "index"
      end
    end
end
