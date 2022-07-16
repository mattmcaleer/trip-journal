class User < ApplicationRecord
  has_many :trips
  has_many :places, through: :trips
  validates :username, uniqueness: { message: "username taken" }
  has_secure_password
end
