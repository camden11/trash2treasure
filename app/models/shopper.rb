class Shopper < ActiveRecord::Base
  has_many :items, through: :shopper_items
end
