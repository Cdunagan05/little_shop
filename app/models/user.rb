class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :username, presence: true, uniqueness: true

end
