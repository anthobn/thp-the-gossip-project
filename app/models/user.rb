class User < ApplicationRecord
  has_many :gossips
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :mail, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress" }
end
