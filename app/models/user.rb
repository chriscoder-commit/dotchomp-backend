class User < ApplicationRecord
  has_secure_password


  has_one_attached :picture, dependent: :destroy
  has_one :moderator
  has_many :recipes
  has_many :chomps
  has_many :favourites
  has_many :reviews 


  validates :username, presence: true, uniqueness: true 
  validates :email, presence: true, uniqueness: true 
end
