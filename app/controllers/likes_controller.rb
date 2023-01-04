class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages 
    end
    redirect_back fallback_location: tweets_path 
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    tweet = @like.tweet
    @like.destroy
    redirect_back fallback_location: tweets_path 
  end

  private

  def like_params
    params.require(:like).permit(:tweet_id)
  end

end