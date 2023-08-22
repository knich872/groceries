class ShoppingCartsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @shopping_carts = ShoppingCart.all
    if params[:query].present?
      @shopping_carts = @shopping_carts.search_by_keywords(params[:query])
    end
    # if params[:filter].present?
    #   @shopping_carts = @shopping_carts.where(id: current_user.shopping_cart_ids)
    # end
    # raise
  end

  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    unless current_user.shopping_cart_ids.include?(@shopping_cart.id)
      @cart_member = CartMember.create(user: current_user, shopping_cart: @shopping_cart)
      redirect_to shopping_cart_path, :notice => "Successfully joined shopping cart."
    end
    @users = User.all
    @items = Item.all
    # @items = Item.where(shopping_cart: params[:id])
  end

  def new
    @shopping_cart = ShoppingCart.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if @shopping_cart.save
      @cart_member = CartMember.create(user: current_user, shopping_cart: @shopping_cart)
      redirect_to @shopping_cart, notice: "Shopping cart was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:name, :shopping_list)
  end

  def sanitize_page_params
    params[:filter] = params[:filter].to_i
    # params[:id] = params[:id].to_i
  end

end
