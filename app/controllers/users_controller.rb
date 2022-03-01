class UsersController < ApplicationController
  def list
    @users = User.all
  end

  def show
  end

  def edit
  end
end
