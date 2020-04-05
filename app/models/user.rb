class User < ApplicationRecord
  # Validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  vlidates :email, :username, presence: true, uniqueness: { case_sensitive: false }
  vlidates :username, length: { minimum: 3, maximum: 25 }
  vlidates :email, length: { maximum: 105 }, format: { with : VALID_EMAIL_REGEX }

  has_many :articles

  before_save { self.email = email.downcase }

  has_secure_password

end

