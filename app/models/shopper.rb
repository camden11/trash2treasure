class Shopper < ActiveRecord::Base

  has_many :shopper_items
  has_many :items, through: :shopper_items
  belongs_to :sale

  def num_shopper_items
    total = 0
    self.shopper_items.each do |shopper_item|
      total += shopper_item.quantity
    end
    total
  end

  def total_price
    price = 0;
    self.shopper_items.each do |shopper_item|
      price += shopper_item.price
    end
    price
  end
end
