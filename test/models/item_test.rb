require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  test "import from spreadsheets handles bad data" do
    file = "test/fixtures/files/bad_data_test.xlsx"
    sale = sales(:sale_1)
    result = Item.import_from_spreadsheet(file, sale)
    assert result.flash == :danger
    assert result.message == "Error reading file bad_data_test.xlsx"
  end

  test "import from spreadsheets handles partially bad data" do
    file = "test/fixtures/files/ok_data_test.xlsx"
    sale = sales(:sale_1)
    result = nil
    assert_difference("Item.count", 100) do
      result = Item.import_from_spreadsheet(file, sale)
    end
    assert result.flash == :warning
    assert result.message.include? "100 items created successfully"
  end
end
