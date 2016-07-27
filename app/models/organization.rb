class Organization < ActiveRecord::Base

  has_many :users

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  before_create :generate_join_code

  private

  def generate_join_code
    self.join_code = SecureRandom.urlsafe_base64
  end
  
end
