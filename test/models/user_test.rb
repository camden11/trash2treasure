require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:user_1)
    @user.update_attributes(password: "testpass", password_confirmation: "testpass")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.email = "user2@example.com"
    assert_not @user.valid?
  end

  test "should have organization" do
    assert_not users(:no_org).valid?
  end

  test "belongs_to organization" do
    assert @user.organization = organizations(:trash2treasure)
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
