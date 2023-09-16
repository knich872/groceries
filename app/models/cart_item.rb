class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :shopping_cart
  # enum bought: {remaining: "remaining", purchased: "purchased"}


  def bought?
    bought == 1
  end

  # def valid
  #   if persisted?
  #     self.[:shopping_cart_id]
  #   else
  #     @cart_item.shopping_cart_id
  #   end
  # end
end
