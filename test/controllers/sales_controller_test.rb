require 'test_helper'

class SalesControllerTest < ActionController::TestCase

  def setup
    @sale = sales(:sale_1)
    @user = users(:user_1)
  end

  test "should render new" do
    log_in @user
    get :new
    assert_response :success
    assert_template 'sales/new'
  end
  
  test "should show sale" do
    get :show, id: @sale
    assert_response :success
  end

  test "should create sale for valid sale" do
    log_in @user
    assert_difference('Sale.count') do
      post :create, sale: {name: "New Sale", start_time: Time.now - 5.hours, end_time: Time.now }
    end
  end

  test "should render new for invalid sale" do
    log_in @user
    post :create, sale: { name: "" }
    assert_template 'sales/new'
  end
end
