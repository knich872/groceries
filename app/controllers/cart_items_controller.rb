class CartItemsController < ApplicationController

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # @cart_item.item = @item(params[:id])
    # @cart_item.shopping_cart = @shopping_cart(params[:id])
    @cart_item.added_by = current_user.username
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
    params.require(:cart_item).permit(:item_id, :shopping_cart_id, :bought)
  end
end
