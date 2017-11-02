class UsersController < ApplicationController

before_action :authenticate_user!

  def home
    @user = current_user.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
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
