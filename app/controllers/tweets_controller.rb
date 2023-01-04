class TweetsController < ApplicationController
  require 'debug'
  before_action :set_tweet, only: %i[ show edit update destroy retweet ]

  # GET /tweets or /tweets.json
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :desc)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweets = Tweet.all
    @tweet.user = current_user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path, notice: "Tweet was successfully created." }
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
    else
      redirect_to tweets_path, alert: "unable to retweet"
    end

  end

  

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body, :tweet_id, :user_id)
    end
end
