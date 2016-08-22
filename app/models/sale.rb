class Sale < ActiveRecord::Base

  belongs_to :organization

  has_many :items

  has_attached_file :image

  validates :name, presence: true, length: { maximum: 100 }
  validates :organization_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def start_date
    self.start_time.strftime("%B %-d")
  end

  def preferred_image
    self.image.url == "/images/original/missing.png" ? self.organization.image : self.image
  end

end
