class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    # redirect_to tweet_path(id: params[:tweet_id])
    respond_to do |format|
      format.html { redirect_to tweet_path(id: params[:tweet_id]), notice: "Comment successfully created." }
    end
  end

  def destroy
    @comment = Comment.find(params[:tweet_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to tweet_url, notice: "Comment successfully deleted." }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(tweet_id: params[:tweet_id])
  end
end