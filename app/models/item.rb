class Item < ActiveRecord::Base

  belongs_to :sale

  validates :name, presence: true, length: { maximum: 100 }
  validates :code, length: { maximum: 4 }
  validates :price, presence: true
  validates :total_quantity, presence: true
  validates :current_quantity, presence: true
  validates :sale_id, presence: true

  before_validation { self.current_quantity = self.total_quantity }

  def organization
    self.sale.organization if self.sale
  end
  
end
