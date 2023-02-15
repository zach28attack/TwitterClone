class TweetsController < ApplicationController
  require 'debug'
  before_action :set_tweet, only: %i[ show edit update destroy retweet ]
  before_action :authenticate_user!, only: %i[ create destroy retweet ]
  before_action :set_new_tweet, only: %i[index new]
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def show
  end

  def create
    session[:return_to] ||= request.referer # store the requesting url in the session hash
    @tweet = Tweet.new(tweet_params)
    @tweets = Tweet.all.reverse
    @tweet.user = current_user
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to session.delete(:return_to), notice: "Tweet was successfully created." } #Then redirect to it on success
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def retweet
    retweet = current_user.tweets.new(tweet_id: @tweet.id)
    if retweet.save
      redirect_to tweets_path
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
    end
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:body, :tweet_id, :user_id)
    end

    def set_new_tweet
      @tweet = Tweet.new
    end
end
