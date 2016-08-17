require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "index should redirect back" do
    request.env['HTTP_REFERER'] = 'redirect_url'
    get :index
    assert_redirected_to 'redirect_url'
  end
end
