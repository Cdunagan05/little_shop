class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates_confirmation_of :password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true

  enum role: %w(default admin)
end
