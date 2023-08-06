class CartMember < ApplicationRecord
  belongs_to :user_id
  belongs_to :shopping_cart_id
end
