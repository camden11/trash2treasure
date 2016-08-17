require 'test_helper'

class FriendlyForwardingTest < ActionDispatch::IntegrationTest
  test "successful friendly forwarding" do
    get new_sale_path
    log_in users(:user_1)
    assert_redirected_to new_sale_path
  end
end
