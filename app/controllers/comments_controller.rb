class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to tweet_path(id: params[:tweet_id])
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(tweet_id: params[:tweet_id])
  end
end