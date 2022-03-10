class UsersController < ApplicationController
#   def list
#     @users = User.all
#   end

#   def new
#     @user = User.new
#     @userinfo = UserInformation.new
#   end

#   def create
#     if current_user
#       @user = User.new(user_params)
#       @userinfo = UserInformation.new(userinfo_params[:user_information])
#       if @user.save && @userinfo.save
#         redirect_to users_list_path
#       else
#         render 'new'
#       end
#     end
#   end

#   def show
#     @user = User.find(params[:id])
#   end

#   def edit
#   end

#   private

#   def user_params
#     params.require(:user)
#   end

#   def userinfo_params
#      params.require(:user).permit(user_information: [:nickname, :email, :content])
#   end
# end
