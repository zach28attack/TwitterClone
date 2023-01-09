require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @tweet = tweets(:tweet)
    @user = User.create(username: "gordo", email: "test@email.com", password: "password")
  end

  test "should get index" do
    get tweets_url
    assert_response :success, "index isn't rendering"
  end

  test "should get new" do
    get new_tweet_url
    assert_response :success, "new page isn't rendering"
  end

  test "should create tweet" do
    assert_difference("Tweet.count") do  
      sign_in @user  
      post tweets_url, params: { tweet: { user_id: 1, body: "test body"} }
    end

    assert_redirected_to tweets_url
  end

  test "should show tweet" do
    get tweet_url(@tweet)
    assert_response :success, "new page isn't rendering"
  end

  # test "should get edit" do
  #   get edit_tweet_url(@tweet)
  #   assert_response :success
  # end

  # test "should update tweet" do
  #   patch tweet_url(@tweet), params: { tweet: { body: "new body of test tweet" } }
  #   assert_redirected_to tweet_url(@tweet)
  # end

  test "should destroy tweet" do
    assert_difference("Tweet.count", -1) do
      delete tweet_url(@tweet)
    end

    assert_redirected_to tweets_url
  end
end
