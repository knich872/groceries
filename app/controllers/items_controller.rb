class ItemsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @items = Item.all
    # @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    if params[:query].present?
      @items = Item.search_by_keywords(params[:query])
    end
    if params[:filter].present?
      @items = Item.where(category: params[:filter])
    end
    @items
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @shopping_carts = ShoppingCart.find(current_user.shopping_cart_ids)
  end

  def new
    @item = Item.new
    @shopping_carts = ShoppingCart.find(current_user.shopping_cart_ids)
    @cart_item = CartItem.new
  end

  def create
    @item = Item.new(item_params)
    @shopping_cart = ShoppingCart.find(params[:item][:shopping_carts])
    # raise
    @cart_item = CartItem.new
    if @item.save
      @cart_item = CartItem.create(item: @item, shopping_cart: @shopping_cart, added_by: current_user.username)
      redirect_to shopping_cart_path(@shopping_cart), notice: "New item was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, photos: [])
  end

  def sanitize_page_params
    # params[:filter] = params[:filter].to_i
    # params[:id] = params[:id].to_i
  end

end
