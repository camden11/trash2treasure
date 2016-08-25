class ShopperItem < ActiveRecord::Base

  include ActionView::Helpers::TextHelper

  belongs_to :item
  belongs_to :shopper

  validates :shopper_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validate :same_sale

  after_initialize { self.quantity ||= 0 }

  def name
    pluralize self.quantity, self.item.name
  end

  def price
    self.item.price * self.quantity
  end

  private

  def same_sale
    unless self.shopper.sale == self.item.sale
      self.errors.add(:base, "shopper and item must belong to the same sale")
    end
  end
end
