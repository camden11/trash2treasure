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
    assert_redirected_to @sale
  end

  test "create should redirect back when request made from outside sale page" do 
    request.env['HTTP_REFERER'] = 'redirect_url'
    post :create, item: { name: "test" }
    assert_redirected_to 'redirect_url'
  end

  test "import should create items from spreadsheet" do
    file = ActionDispatch::Http::UploadedFile.new({
      :tempfile => File.new("test/fixtures/files/t2t_list.xlsx"),
      filename: "Users/Camden/code/trash2treasure/test/fixtures/files/t2t_list.xlsx"
    })
    assert_difference("Item.count", 115) do
      post :import, { sale_id: @sale.id, file: file }
    end
  end

  test "import should not create items for someone else's sale" do
    file = ActionDispatch::Http::UploadedFile.new({
      :tempfile => File.new("test/fixtures/files/t2t_list.xlsx"),
      filename: "Users/Camden/code/trash2treasure/test/fixtures/files/t2t_list.xlsx"
    })
    request.env['HTTP_REFERER'] = 'redirect_url'
    assert_no_difference("Item.count") do
      post :import, { sale_id: sales(:sale_3), file: file }
    end
    assert_redirected_to 'redirect_url'
  end
end
