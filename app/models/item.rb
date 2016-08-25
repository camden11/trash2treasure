class Item < ActiveRecord::Base

  belongs_to :sale

  has_many :shoppers, through: :shopper_items

  has_attached_file :image

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :total_quantity, presence: true
  validates :num_purchased, presence: true
  validates :units_per_sale, presence: true
  validates :sale_id, presence: true

  def organization
    self.sale.organization if self.sale
  end

  def self.import_from_spreadsheet(file, sale)
    spreadsheet = Roo::Spreadsheet.open(file)
    result = SpreadsheetImportResult.new file
    headers_done = false
    spreadsheet.each(spreadsheet_options) do |hash|
      if headers_done
        hash[:sale_id] = sale.id
        if Item.find_or_create_by hash
          result.success
        else
          result.failure hash[:name]
        end
      else
        headers_done = true
      end
    end
    result
  end

  private

  def self.spreadsheet_options
    { name: "name", price: "price", total_quantity: "total quantity", units_per_sale: "units per sale", category: "category" }
  end

  
end
