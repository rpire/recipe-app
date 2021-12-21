class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :price, numericality: true
end
