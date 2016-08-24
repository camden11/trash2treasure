require 'test_helper'

class ShopperItemTest < ActiveSupport::TestCase
  
  test "shopper and item must have same sale" do
    assert_no_difference("ShopperItem.count") do
      ShopperItem.create(shopper_id: 1, item_id: 2)
    end
  end
end
