require "test_helper"

class TweetTest < ActiveSupport::TestCase
  test "should not create tweet without user" do
    tweet = Tweet.new
    tweet.user_id = 1
    assert_not tweet.save, "Tweet is able to save without user association"
  end
end
