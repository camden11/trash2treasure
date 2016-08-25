class Shopper < ActiveRecord::Base

  has_many :shopper_items
  has_many :items, through: :shopper_items
  belongs_to :sale

  def num_shopper_items
    self.shopper_items.count
  end

  def total_price
    self.shopper_items.to_a.sum { |s| s.price }
  end
end
