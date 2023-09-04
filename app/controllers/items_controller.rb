class ItemsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @items = Item.all
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
  end

  def create
    @item = Item.new(item_params)
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    if @item.save
      @cart_item = CartItem.create(item: @item, shopping_cart: @shopping_cart)
      redirect_to @shopping_cart, notice: "New item was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :photo)
  end

  def sanitize_page_params
    # params[:filter] = params[:filter].to_i
    # params[:id] = params[:id].to_i
  end

end
