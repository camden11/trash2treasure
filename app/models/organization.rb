class Organization < ActiveRecord::Base

  has_many :users
  has_many :sales

  has_attached_file :image, default_url: "image_placeholder.png", styles: { small: "150x150#" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

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
