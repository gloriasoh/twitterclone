class UsersController < ApplicationController

before_action :authenticate_user!

  def edit
    @user = User.find[params[:id]]
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
