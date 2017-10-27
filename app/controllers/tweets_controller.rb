class TweetsController < ApplicationController

before_action :authenticate_user!

  def home
    @tweet = Tweet.new
    @tweets = Tweet.all
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
      render :home
    end
  end

  def destroy
      @tweet.destroy
      redirect_to root_url
  end

private

def tweet_params
  params.require(:tweet).permit(:message)
end

end
