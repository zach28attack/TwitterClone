require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do 
    @user = User.find(1)
    sign_in @user
  end

  test "should get new" do
    sign_out @user
    get new_user_registration_path
    assert_response :success, "User sign up page not rendering"
  end

  test "should get edit" do
    get edit_user_registration_path
    assert_response :success, "User edit page not rendering"
  end

  test "should update user" do
    # patch user_registration_path, {params:{ name: "new name of test user", password: 123456 } }
    # assert_redirected_to user_path
  end

  test "should destroy user" do
    # assert_difference("User.count", -1)
    # delete user_url
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success, "User show page not rendering"
  end
end
