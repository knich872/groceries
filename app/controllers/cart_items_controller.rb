class CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new()
    @item = Item.find(params[:item_id])
    @cart_item.item = @item
    @shopping_cart = ShoppingCart.find(params[:cart_item][:shopping_cart_id])
    @cart_item.shopping_cart = @shopping_cart
    @cart_item.added_by = current_user.username
    if @cart_item.save
      redirect_to shopping_cart_path(@shopping_cart), notice: "Item was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.bought?
    @cart_item.bought_by = current_user.username
    @cart_item.update(cart_item_params)
    redirect_to shopping_cart_path(@cart_item.shopping_cart), notice: "Item was marked as purchased."
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :shopping_cart_id, :bought, :added_by, :bought_by)
  end
end
