class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages 
    end
    redirect_back fallback_location: tweets_path 
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_back fallback_location: tweets_path 
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end

end