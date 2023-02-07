class FollowsController < ApplicationController

  def index
     @follows = current_user.followers.all
  end

  def following
    @follows = current_user.following.all
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

end