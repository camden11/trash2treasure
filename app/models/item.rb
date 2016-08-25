class Item < ActiveRecord::Base

  belongs_to :sale

  has_many :shoppers, through: :shopper_items

  has_attached_file :image

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :total_quantity, presence: true
  validates :current_quantity, presence: true
  validates :sale_id, presence: true

  before_validation { self.current_quantity = self.total_quantity }

  def organization
    self.sale.organization if self.sale
  end

  def self.import_from_spreadsheet(file)
    spreadsheet = Roo::Spreadsheet.open(file)
  end
  
end
