class Organization < ActiveRecord::Base

  has_many :users
  has_many :sales

  has_attached_file :image, default_url: "/images/image_placeholder.jpg"

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  before_create :generate_join_code

  def preferred_name
    self.display_name || self.name
  end

  private

  def generate_join_code
    self.join_code = SecureRandom.urlsafe_base64
  end
  
end
