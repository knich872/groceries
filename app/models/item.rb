class Item < ApplicationRecord
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  validates :name, presence: true, uniqueness: true
  has_many_attached :photos
end