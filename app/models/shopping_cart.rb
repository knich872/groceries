class ShoppingCart < ApplicationRecord
  has_many :cart_member
  has_many :user, through: :cart_member
  validates :name, presence: true

end
