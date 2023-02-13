class FollowsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_following, only: %i[following feed]

  def index
     @followers = current_user.followers.all  #
  end

  def following
  end

  def feed 
    @arrayOfTweets = []                     
    @following.each do |user|               # iterating through all of the followed user's tweets
      user.tweets.each do |tweet|
        @arrayOfTweets << tweet             # saving them all to a seperate array 
      end
    end
    @arrayOfTweets.sort!.reverse!           # then sorting the array of followed user's tweets by newest 
  end

  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      redirect_to user_path(User.find(params[:id]))
    end
  end

  def destroy
    @follow = Follow.find_by(following_id: params[:id], follower_id: current_user)
    if @follow.destroy
      redirect_to user_path(User.find(params[:id]))
    end
  end

  private 

  def follow_params
    params.require(:follow).permit(:following_id, :follower_id)
  end

  def set_following
    @following = current_user.following.all
  end
end