class FollowsController < ApplicationController

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

end