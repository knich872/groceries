class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: [:show]
  before_action :sanitize_page_params

  def index
    @shopping_carts = ShoppingCart.all
    if params[:query].present?
      @shopping_carts = @shopping_carts.search_by_keywords(params[:query])
    end
    if params[:filter].present?
      @shopping_carts = @shopping_carts.where(id: current_user.shopping_cart_ids)
    end
  end

  def show
    @users = User.all
    @cart_item = CartItem.new
    @cart_member = CartMember.new
    @cart_items = @shopping_cart.cart_items.where(bought: false)
    @bought_cart_items = @shopping_cart.cart_items.where('updated_at > ? AND bought = true',
    24.hours.ago).order(updated_at: :desc).limit(15)
    @frequently_bought_cart_items = @shopping_cart.cart_items.where(bought: true)
    .select(:item_id, 'COUNT(item_id)').group(:item_id).order(count: :desc).limit(10)
    @items = Item.all
    # @item = Item.find
    @shopping_carts = ShoppingCart.find(current_user.shopping_cart_ids)
  end

  def new
    @shopping_cart = ShoppingCart.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if @shopping_cart.save
      @cart_member = CartMember.create(user: current_user, shopping_cart: @shopping_cart)
      redirect_to shopping_cart_path(@shopping_cart), notice: "Shopping cart was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def set_shopping_cart
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(:name)
  end

  def sanitize_page_params
    # params[:filter] = params[:filter].to_i
    # params[:id] = params[:id].to_i
  end

end
