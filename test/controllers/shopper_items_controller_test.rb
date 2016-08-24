require 'test_helper'

class ShopperItemsControllerTest < ActionController::TestCase

  def setup
    @shopper_1 = shoppers(:shopper_1)
    @sale = sales(:sale_1)
  end
  
  test "should create shopper_item for valid shopper_item" do
    shop_as @sale, @shopper_1
    assert_difference("ShopperItem.count") do
      xhr :post, :create, { item_id: 1, quantity: 1 }
    end
    assert ShopperItem.last.shopper == @shopper_1
  end

  test "create should redirect if not an active shopper" do
    assert_no_difference("ShopperItem.count") do
      xhr :post, :create, { item_id: 1, quantity: 1 }
    end
  end

  test "should not create shopper_item for invalid sale" do
    shop_as @sale, @shopper_1
    assert_no_difference("ShopperItem.count") do
      xhr :post, :create, { item_id: 1 }
    end
  end
end
