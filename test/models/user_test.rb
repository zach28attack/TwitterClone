require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  setup do 
    @user = User.new(email: "test@email.com", password: 123456, username: "Rando")
    
  end

  test "should fail if username isn't unique" do
    @user.username = "testingman"
    assert_not @user.save, "username uniquness validation isn't enforced"
  end

  test "username should pass length validation" do 
    @user.username = "12"
    assert_not @user.save, "username length validation not enforced on save"
  end

  test "email should not be blank" do 
    @user.email = nil
    assert_not @user.save, "user created with empty email field"
  end
  
  test "email should be a valid email" do 
    @user.email = "invalid email"
    assert_not @user.save, "user created without valid email"
  end

  test "user password should exit" do 
    @user.password = nil
    assert_not @user.save, "user created with empty password field"
  end

  test "user password length should be more than 6" do 
    @user.password = 1234
    assert_not @user.save, "user password length validation not enforced on save"
  end

  test "email should be unique" do 
    @user.email = "email@test.com"
    assert_not @user.save, "user email uniqueness validation not enforced"
  end

  test "users name should exist" do 
    @user.name = nil
    assert_not @user.save, "user saved without name"
  end
  
end
