class FollowsController < ApplicationController

  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      redirect_to user_path(User.find(params[:id]))
    end
  end

  def destroy
   
  end

end