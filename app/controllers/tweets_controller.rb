class TweetsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_tweet, only: [:edit, :update, :show, :destroy]


  def index
    # @tweets = Tweet.all
    if params[:search]
      # @names = User.search_by_name_or_username(params[:search])
      @tweets = Tweet.search_by_message(params[:search])
      if @tweets.empty? #&& @names.empty?
        flash.now[:notice] = "No results found for '#{params[:search]}', showing all tweets instead."
        @tweets = Tweet.all
      end
    # elsif @tweets.empty?
      # redirect_to @user.find(params[:username])

    else
      @tweets = Tweet.all
    end
  end

  def show
    # @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: "That Tweet was Saved!"
    else
      flash.now[:alert] = 'Sorry, couldn\'t keep that guy around'
      render :new
    end

  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    # @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet Twupdated!'
    else
      flash.now[:alert] = "Oops, Twuble!"
      render :edit
    end
  end

  def destroy
    # @tweet = Tweet.new(tweet_params)
    @tweet.destroy

    if @tweet.destroy
      redirect_to tweets_path, notice: 'Tweet Tweleted!'
    else
      flash.now[:alert] = "Oops, Twuble!"
    end
  end




  private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
