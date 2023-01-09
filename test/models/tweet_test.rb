require "test_helper"

class TweetTest < ActiveSupport::TestCase

  setup do 
    @tweet = Tweet.new
  end

  test "should not create tweet without user" do
    assert_not @tweet.save, "Tweet is able to save without user association"
  end

  test "should not save if body is less than 240 characters" do
    @tweet.user_id = 1
    @tweet.body = ""
    assert_not @tweet.save, ":body length validation not being enforced"
  end
end
