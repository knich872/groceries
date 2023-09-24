class PagesController < ApplicationController
  def home
    @shopping_carts = ShoppingCart.where(id: current_user.shopping_cart_ids)
  end
end
