class Sale < ActiveRecord::Base

  belongs_to :organization

  has_many :items

  validates :name, presence: true, length: { maximum: 100 }
  validates :organization_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
