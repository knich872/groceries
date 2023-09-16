class CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new()
    @item = Item.find(params[:id])
    @cart_item.item = @item
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @cart_item.shopping_cart = @shopping_cart
    @cart_item.added_by = current_user.username
    # @cart_item = CartItem.create(item: @item, shopping_cart: @shopping_cart, added_by: current_user.username)
    # @cart_item.save!
    if @cart_item.save
      redirect_to shopping_cart_path notice: "Item was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # raise
    # @shopping_cart = ShoppingCart.find(params[:id])
    @cart_item = CartItem.find(params[:id])
    @cart_item.bought?
    @cart_item.update(cart_item_params)
    redirect_to shopping_cart_path(@cart_item.shopping_cart), notice: "Item was marked as purchased."
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :shopping_cart_id, :bought, :added_by)
  end
end
