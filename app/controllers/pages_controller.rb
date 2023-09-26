class PagesController < ApplicationController
  def home
    if user_signed_in?
      @shopping_carts = ShoppingCart.where(id: current_user.shopping_cart_ids)
    end
  end
end
