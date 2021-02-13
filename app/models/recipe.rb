class Recipe < ApplicationRecord
  belongs_to :user 
  has_one_attached :picture, dependent: :destroy
  has_many :chomps
  has_many :favourites
  has_many :reviews
end
