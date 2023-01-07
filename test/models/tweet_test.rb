require "test_helper"

class TweetTest < ActiveSupport::TestCase
  test "should not create tweet without user" do
    tweet = Tweet.new
    assert_not tweet.save, "Tweet is able to save without user association"
  end

  test "should not save if body is less than 240 characters" do
    tweet = Tweet.new
    tweet.user_id = 1
    tweet.body = ""
    assert_not tweet.save, ":body length validation not being enforced"
  end
end
