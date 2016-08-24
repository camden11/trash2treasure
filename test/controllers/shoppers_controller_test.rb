require 'test_helper'

class ShoppersControllerTest < ActionController::TestCase

  def setup
    @sale = sales(:sale_1)
    @shopper_1 = shoppers(:shopper_1)
    @shopper_2 = shoppers(:shopper_2)
  end

  test "should show current shopper" do
    shop_as @sale, @shopper_1
    get :show, id: @shopper_1
    assert_response :success
  end

  test "should redirect other shoppers" do
    shop_as @sale, @shopper_2
    get :show, id: @shopper_1
    assert_redirected_to @sale
  end
end
