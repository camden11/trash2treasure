class Sale < ActiveRecord::Base

  belongs_to :organization

  has_many :items
end
