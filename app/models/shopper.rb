class Shopper < ActiveRecord::Base

  has_many :shopper_items
  has_many :items, through: :shopper_items
  has_many :extra_charges
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
    self.extra_charges.each do |charge|
      price += charge.price
    end
    price
  end

  def confirm_checkout
    self.shopper_items.each do |shopper_item|
      item = shopper_item.item
      item.num_purchased += shopper_item.quantity
      item.save
    end
    self.checked_out = true
    self.save
  end
end
