class UserInformationsController < ApplicationController
  def list
  end

  def new
    @userinfo = UserInformation.new
    @userinfo.build_user
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

end
