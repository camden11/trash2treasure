require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user_1)
  end

  test "invalid login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not logged_in?
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "valid login and logout" do
    get login_path
    post login_path, session: { email: @user.email, password: 'test123' }
    assert logged_in?
    # assert_redirected_to @user.organization
    assert_redirected_to @user.organization.primary_sale
    follow_redirect!
    # assert_template 'organizations/show'
    assert_template 'sales/show'
    delete logout_path
    assert_not logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
  end

  test "already logged_in" do
    log_in @user
    get login_path
    assert_redirected_to @user.organization
  end
end
