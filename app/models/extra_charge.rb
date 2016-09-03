class ExtraCharge < ActiveRecord::Base
  belongs_to :shopper

  validates :name, presence: true
  validates :shopper_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end