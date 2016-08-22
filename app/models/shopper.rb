class Shopper < ActiveRecord::Base
  has_many :shopper_items
  has_many :items, through: :shopper_items
  belongs_to :sale
end
