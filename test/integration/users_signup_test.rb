require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def invalid_signup_info
     { name:  "", email: "user@invalid", organization_join_code: "1", password: "123", password_confirmation: "456" }
  end

  def valid_signup_info
    { name: "Test User", email: "tester@test.com", organization_join_code: "t2tjoin", password: "test123", password_confirmation: "test123" }
  end
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: invalid_signup_info
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, user: valid_signup_info
    end
    follow_redirect!
    # assert_template 'organizations/show'
    assert_template 'sales/show'
    assert logged_in?
  end
end
