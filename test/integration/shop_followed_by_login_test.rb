require 'test_helper'

class ShopFollowedByLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user_1)
  end
  
  test "should not be able to shop when logged in" do
    get '/sales/1'
    assert_difference("ShopperItem.count") do
      xhr :post, shopper_items_path, { item_id: 1, quantity: 1 }
    end
    log_in @user
    get '/sales/1'
    assert_no_difference("ShopperItem.count") do
      xhr :post, shopper_items_path, { item_id: 1, quantity: 1 }
    end
  end
end
