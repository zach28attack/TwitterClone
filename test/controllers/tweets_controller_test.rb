require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @tweet = tweets(:tweet)
    @user = User.create(username: "gordo", email: "test@email.com", password: "password", name: "Guadalupe")
  end

  test "should get index" do
    get tweets_path
    assert_response :success, "index isn't rendering"
  end

  test "should show tweet" do
    get tweet_path(@tweet)
    assert_response :success, "tweet isn't rendering"
  end

  test "should destroy tweet" do
    sign_in @user
    assert_difference("Tweet.count", -1) do
      delete tweet_path(@tweet)
    end

    assert_redirected_to tweets_path
  end
end
