require 'test_helper'

class ShopperItemTest < ActiveSupport::TestCase
  
  test "shopper and item must have same sale" do
    assert_no_difference("ShopperItem.count") do
      ShopperItem.create(shopper_id: 1, item_id: 2)
    end
  end

  test "name and quantity" do
    assert shopper_items(:item_1).name == "3 Lamps"
    assert shopper_items(:item_2).name == "1 Lamp"
  end
end
