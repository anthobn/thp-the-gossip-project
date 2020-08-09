class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  
  validates :title, presence: true, length: { minimum: 3, maximum: 14, message: "must be between 3 and 14 characters"}
  validates :content, presence: true
  validates :user, presence: true
end
