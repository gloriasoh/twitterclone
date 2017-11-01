class UsersController < ApplicationController

before_action :authenticate_user!

  def home
    @users = User.all
  end


  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
  end

  def destroy
  end

end
