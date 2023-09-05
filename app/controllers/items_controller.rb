class ItemsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @items = Item.all
    @cart_item = CartItem.new
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    if params[:query].present?
      @items = @items.search_by_keywords(params[:query])
    end
  end

  def show
    @item = Item.find(params[:id])
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
  end

  def new
    @item = Item.new
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
  end

  def create
    @item = Item.new(item_params)
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    if @item.save
      @cart_item = CartItem.create(item: @item, shopping_cart: @shopping_cart, added_by: current_user.username)
      redirect_to @shopping_cart, notice: "New item was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, photos: [])
  end

  def sanitize_page_params
    # params[:filter] = params[:filter].to_i
    # params[:id] = params[:id].to_i
  end

end
