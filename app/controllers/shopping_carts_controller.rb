class ShoppingCartsController < ApplicationController

  def show
    @user = current_user
    # @shopping_cart = ShoppingCart.where(shopping_cart: current_user.shopping_cart.id)
  end

  def new
    @shopping_cart = ShoppingCart.new()
    # @cart_member = CartMember.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if @shopping_cart.save
      @cart_member = CartMember.new(user_id: current_user.id, shopping_cart_id: @shopping_cart.id)
      raise
      redirect_to @shopping_cart, notice: "Shopping cart was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:name, :shopping_list)
  end

end
