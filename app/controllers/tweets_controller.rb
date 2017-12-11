class TweetsController < ApplicationController
 before_action :authenticate_user!


  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: "That Tweet was Saved!"
    else
      render :new, notice: 'Sorry, couldn\'t keep that guy around'
    end

  end

  def edit
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end
