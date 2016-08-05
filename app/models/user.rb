class User < ActiveRecord::Base

  belongs_to :organization

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :organization_id, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  before_save { self.email = email.downcase }

  has_secure_password

  def organization_join_code
    @organization_join_code
  end

  def organization_join_code=(join_code)
    self.organization_id = Organization.find_by(join_code: join_code).id
  end

end
