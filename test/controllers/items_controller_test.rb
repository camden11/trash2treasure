require 'test_helper'

class ItemsControllerTest < ActionController::TestCase

  def setup
    @user = users(:user_1)
    @sale = sales(:sale_1)
    log_in @user
  end

  test "index should redirect back" do
    request.env['HTTP_REFERER'] = 'redirect_url'
    get :index
    assert_redirected_to 'redirect_url'
  end
  
  test "create should create item for valid item" do
    assert_difference('Item.count') do
      post :create, item: { name: "test item", price: 10, total_quantity: 10, sale_id: @sale.id }
    end
    assert_redirected_to @sale
  end

  test "create should render sales/show for invalid data" do
    post :create, item: { sale_id: @sale.id }
    assert_template 'sales/show'
  end

  test "create should redirect back when request made from outside sale page" do 
    request.env['HTTP_REFERER'] = 'redirect_url'
    post :create, item: { name: "test" }
    assert_redirected_to 'redirect_url'
  end
end
