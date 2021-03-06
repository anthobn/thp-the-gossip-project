class User < ApplicationRecord
  has_many :gossips
  belongs_to :city
  has_many :comments
  has_many :likes, :dependent => :destroy
  has_secure_password

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :age, presence: true, inclusion: { :in => 1..99, message: "Please enter a correct age between 1 - 99" }
  validates :mail, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress" }
  validates :password, presence: true, length: { minimum: 6 }
end
