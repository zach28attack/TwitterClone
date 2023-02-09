class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to tweet_path(id: params[:tweet_id])
  end

  def edit
    #Remove these empty actions?
  end

  def update
    
  end

  def destroy
    @comment = Comment.find(params[:tweet_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to tweet_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(tweet_id: params[:tweet_id])
  end
end