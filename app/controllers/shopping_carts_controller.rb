class ShoppingCartsController < ApplicationController

  def show
    # @shopping_cart = ShoppingCart.where(shopping_cart: current_user.shopping_cart.id)
  end

  def new
    @shopping_cart = ShoppingCart.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:name, shopping_list: [])
  end
end
