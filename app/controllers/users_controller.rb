class UsersController < ApplicationController

before_action :authenticate_user!, except: [:show]

  def home
    @user = current_user.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @users = User.all
  end


  def new
  end

  def create
  end

  def destroy
  end

end
