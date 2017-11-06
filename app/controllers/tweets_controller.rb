class TweetsController < ApplicationController

before_action :authenticate_user!

  def home
    @tweet = Tweet.new
    @user = current_user
    @tweets = @user.tweets
    @users =  User.all.where("id != ?", current_user.id)
    @hashtags = SimpleHashtag::Hashtag.all
  end


  def new
    @tweet = Tweet.new
  end

  def create
    @user = current_user
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to home_path
    else
      @tweets = Tweet.all
      redirect_to home_path
      flash[:error] = 'cant be blank'
    end
  end

  def destroy
    @user = current_user
    @tweet = Tweet.find(params[:id])
      @tweet.destroy
      redirect_to root_url
  end

private

def tweet_params
  params.require(:tweet).permit(:message)
end

end
