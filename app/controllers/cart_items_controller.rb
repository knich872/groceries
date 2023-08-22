class CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user = current_user
    @cart_item.shopping_cart = @shopping_cart(params[:id])
    if @cart_item.save
      redirect_to items_path notice: "Item was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:user_id, :shopping_cart_id)
  end
end
