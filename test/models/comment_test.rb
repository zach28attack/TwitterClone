require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "Length of comment should be less than 240" do
    @comment = Comment.new(user_id: 1, tweet_id: 1)
    @comment.body = (1..241).to_a.join
    assert_not @comment.save, "Comment length validation not enforced"
  end
end
