class Item < ApplicationRecord
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true

end
